USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_APIWHSalesByUnits_Rolling_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_APIWHSalesByUnits_Rolling_DYN]
(@in_month varchar(02), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- This report includes all of previous year and adds in each month as current year progresses

	SET NOCOUNT ON; 
    DECLARE @MonthActive    varchar(50);

	DECLARE @SQL  varchar(max);
	DECLARE @date datetime;
    DECLARE @strDate datetime;
	DECLARE @strDateStr varchar(50);

	SET @strDate =  @in_month + '/01/' + @in_year  ;
	SET @strDateStr =  @in_month + '/01/' + @in_year  ;


    DECLARE @mo_currYR_start int;
    DECLARE @SQLMo_Curr_YR varchar(50);
    DECLARE @SQLMo_Prev_YR varchar(50);
    DECLARE @mo_prevYR_start int; 
	DECLARE @yr_curr varchar(4);
	DECLARE @yr_prev varchar(4);
    DECLARE @mo_prevYR_end int;
	DECLARE @startCount int;
	DECLARE @startCount2 int;
    DECLARE @startCount3 int;
    DECLARE @varDate varchar(20);

    DECLARE @SQLCol varchar(max);
    DECLARE @SQLToZero varchar(max);

	DECLARE @SQLWHBrandUnits varchar(max);
	DECLARE @SQLWHGenUnits varchar(max);
	DECLARE @SQLWHOTCUnits varchar(max);

	DECLARE @SQLWHBrandVol varchar(max);
	DECLARE @SQLWHGenVol varchar(max);
	DECLARE @SQLWHOTCVol varchar(max);
	DECLARE @SQLDeleteZero varchar(max);

    SET @SQLCol = '';

	SET @SQLWHBrandUnits = '';
	SET @SQLWHGenUnits = '';
	SET @SQLWHOTCUnits = '';

	SET @SQLWHBrandVol = '';
	SET @SQLWHGenVol= '';
	SET @SQLWHOTCVol = '';
	SET @SQLDeleteZero = '';


    SET @SQLMo_Curr_YR = '';
    SET @SQLMo_Prev_YR = '';
    SET @mo_currYR_start = 1;
     
   
    SET @mo_prevYR_end  = 12;

 
	SET @mo_prevYR_start = @in_month -- Because this is rolling 13 month the start month will always be what the end month (@in_month) is
 
	SET @yr_prev = @in_year - 1;
	SET @startCount = -12;
	SET @startCount2 = -12;
	SET @startCount3 = -12;


 


--PRocessing for Detail

       --Loop through months in previous years - 
	WHILE @mo_prevYR_start < = @mo_prevYR_end
		BEGIN
			SET @SQLMo_Prev_YR = @SQLMo_Prev_YR + cast(@mo_prevYR_start as varchar(2)) + ','
			SET @mo_prevYR_start = @mo_prevYR_start + 1;
		END 
	-- Take off the last comma
	SET @SQLMo_Prev_YR = substring(@SQLMo_Prev_YR,0,len(@SQLMo_Prev_YR) )
	-- Loop through months in current year to tell which ones we need to select

 
 
	WHILE @mo_currYR_start < =  @in_month 
		BEGIN
			SET @SQLMo_Curr_YR = @SQLMo_Curr_YR + cast(@mo_currYR_start as varchar(2)) + ',';
			SET @mo_currYR_start = @mo_currYR_start + 1;
		END 
	-- Take off the last comma
	SET @SQLMo_Curr_YR = substring(@SQLMo_Curr_YR,0,len(@SQLMo_Curr_YR) );
	 
	 
-- Build the columns -- This is for Detail Report
 

	WHILE @startCount < 1
	BEGIN
		SET  @date =  DATEADD(m,@startCount,@strDateStr);

        SET  @varDate = RIGHT('0' + convert(varchar(2), month(@date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(@date),4), 3, 2)  
		SET @SQLCol = @SQLCol +  ' MAX([GRx Units ' + @varDate +  ']) as [GRx Units ' + @varDate  + '], ';
		SET @SQLCol = @SQLCol +  ' MAX([GRx $ ' + @varDate +  '])  as [GRx $ ' + @varDate  + '], ';
		SET @SQLCol = @SQLCol +  ' MAX([BRx Units ' + @varDate +  ']) as [BRx Units ' + @varDate  + '], ';
		SET @SQLCol = @SQLCol +  ' MAX([BRx $ ' + @varDate +  '])  as [BRx $ ' + @varDate  + '], ';
		SET @SQLCol = @SQLCol +  ' MAX([OTC Units ' + @varDate +  ']) as [OTC Units ' + @varDate  + '], ';
		SET @SQLCol = @SQLCol +  ' MAX([OTC $ ' + @varDate +  '])  as [OTC $ ' + @varDate  + '], ';

       	SET @SQLWHGenUnits = @SQLWHGenUnits + ' [GRx Units ' + @varDate  + '], '; 
		SET @SQLWHGenVol = @SQLWHGenVol + ' [GRx $ ' + @varDate  + '], ';  
       	SET @SQLWHBrandUnits = @SQLWHBrandUnits + ' [BRx Units ' + @varDate  + '], '; 
		SET @SQLWHBrandVol = @SQLWHBrandVol + ' [BRx $ ' + @varDate  + '], ';
       	SET @SQLWHOTCUnits = @SQLWHOTCUnits + ' [OTC Units ' + @varDate  + '], '; 
		SET @SQLWHOTCVol = @SQLWHOTCVol + ' [OTC $ ' + @varDate  + '], ';

		
        SET @SQLDeleteZero = @SQLDeleteZero + ' [GRx Units ' + @varDate  + '] = 0 and ';
        SET @SQLDeleteZero = @SQLDeleteZero + ' [GRx $ ' + @varDate  + ']    = 0 and ';  
       	SET @SQLDeleteZero = @SQLDeleteZero + ' [BRx Units ' + @varDate  + '] = 0 and ';
		SET @SQLDeleteZero = @SQLDeleteZero + ' [BRx $ ' + @varDate  + '] = 0 and ';
       	SET @SQLDeleteZero = @SQLDeleteZero + ' [OTC Units ' + @varDate  + '] = 0 and '; 
		SET @SQLDeleteZero = @SQLDeleteZero + ' [OTC $ ' + @varDate  + '] = 0 and ';

    	SET @startCount = @startCount + 1;
	END
		-- Take off end comma
		SET @SQLCol = substring(@SQLCol,0,len(@SQLCol) );
		SET @SQLWHGenUnits = substring(@SQLWHGenUnits,0,len(@SQLWHGenUnits) );
		SET @SQLWHGenVol = substring(@SQLWHGenVol,0,len(@SQLWHGenVol) );
		SET @SQLWHBrandUnits = substring(@SQLWHBrandUnits,0,len(@SQLWHBrandUnits) );
		SET @SQLWHBrandVol = substring(@SQLWHBrandVol,0,len(@SQLWHBrandVol) );
		SET @SQLWHOTCUnits = substring(@SQLWHOTCUnits,0,len(@SQLWHOTCUnits) );
		SET @SQLWHOTCVol = substring(@SQLWHOTCVol,0,len(@SQLWHOTCVol) );
        SET @SQLDeleteZero = substring(@SQLDeleteZero,0,len(@SQLDeleteZero) -3 );
 --TODO Add in @SQLDeleteZero
        print @SQLDeleteZero;
	   --- Drop the previous runs table
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_WHByUnits_detail_jmw')
		 BEGIN
          DROP TABLE tmp_WHByUnits_detail_jmw
         END

		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_WHUnits_TM_PMID')
		 BEGIN
          DROP TABLE tmp_WHUnits_TM_PMID
         END

		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_WHUnits_TM')
		 BEGIN
          DROP TABLE tmp_WHUnits_TM
         END
 
 SET @SQL = 'SELECT * INTO tmp_WHByUnits_detail_jmw from ( '+
		'SELECT   '+
		' cast(null as varchar(10)) as TM , '+
	    'PMID,  '+
		'cast(null as varchar(20)) as AAP# ,  '+
		'cast(null as varchar(20)) as Parent# ,'+
		'cast(null as varchar(20)) as [API#] ,   '+  
		'cast(null as varchar(10)) as [AAP Eff], '+
        'cast(null as varchar(10)) as [AAP Elite] , '+
		'cast(null as varchar(10)) as [API Acct Eff],   '+
		'cast(null as varchar(10)) as [AAP Quit],   '+
        'cast(null as varchar(20)) as [API Status] , '+
		'cast(null as  varchar(200)) as Description ,  '+
		'cast(null as  varchar(200)) as Affiliate ,    '+
		'cast(null as  varchar(100)) as [Account DBA Name] ,  '+
		'cast(null as  varchar(100)) as [City] ,   '+
		'cast(null as  varchar(100)) as ST , '+   
			@SQLCol + 

		' FROM ( '+   
	    '  SELECT PMID,date, '+   

 		'''GRx Units ''+ RIGHT(''0'' + convert(varchar(2), month(date)), 2)  + ''-'' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    AS dateGRU ,'+   
		' sum(isnull(WHAPIGenericUnits,0)) as WHAPIGenericUnits, ' +

		'''GRx $ ''+  RIGHT(''0'' + convert(varchar(2), month(date)), 2)  + ''-'' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)     AS dateGRD ,'+ 
		' sum(isnull(WHAPIGeneric,0)) as WHAPIGeneric,' +

        '''BRx Units ''+ RIGHT(''0'' + convert(varchar(2), month(date)), 2)  + ''-'' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    AS dateBRU ,'+
		'sum(isnull(WHAPIBrandUnits,0)) as WHAPIBrandUnits,' +

		'''BRx $ ''+  RIGHT(''0'' + convert(varchar(2), month(date)), 2)  + ''-'' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)     AS dateBRD ,'+
		'sum(isnull(WHAPIBrand,0)) as WHAPIBrand,'+

        '''OTC Units ''+ RIGHT(''0'' + convert(varchar(2), month(date)), 2)  + ''-'' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    AS dateOTU ,'+
		'sum(isnull(WHAPIOTCUnits,0)) as WHAPIOTCUnits,'+

		'''OTC $ ''+  RIGHT(''0'' + convert(varchar(2), month(date)), 2)  + ''-'' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)     AS dateOTD ,'+
		'sum(isnull(WHAPIOTC,0)) as WHAPIOTC '+


	     ' FROM pharmacymaster..all_volume  where (( month(date) in ( ' ;

         IF(@in_year = '2010')
			BEGIN 

	          SET @SQL = @SQL +    @SQLMo_Prev_YR + ')'+
                ' and year(date) = ' + @in_year + ')) and pmid != 900000' ;
		    END
        ELSE
			BEGIN
			 SET @SQL = @SQL +  @SQLMo_Curr_YR + ')'+
             ' and year(date) = ' + @in_year + ') '+ 
			 '	 or (month(date) in ( ' +
	         @SQLMo_Prev_YR + ')' +
		     ' and year(date) =  ' + @yr_prev + ')) and pmid != 900000' ;  
		    END   
        
		 SET @SQL = @SQL +  	 ' group by PMID ,date ' +
	         ' ) as TableDate ' +


	' PIVOT '+
	' ( '+
	  ' SUM(WHAPIGenericUnits) '+
	  ' FOR dateGRU IN  (' + @SQLWHGenUnits + ') '+
	' )as P1 '+

	' PIVOT '+
	' ( '+
	  ' SUM(WHAPIGeneric) '+
	  ' FOR dateGRD IN   (' + @SQLWHGenVol + ') '+
	' )as P2 '+    
	
	' PIVOT '+
	' ( '+
	  ' SUM(WHAPIBrandUnits) '+
	  ' FOR dateBRU IN   (' + @SQLWHBrandUnits + ') '+
	' )as P3 '+

	' PIVOT '+
	'( '+
	  ' SUM(WHAPIBrand) '+
	  ' FOR dateBRD IN   (' + @SQLWHBrandVol + ') '+
	' )as P4 '+

	' PIVOT '+
	' ( '+
	  ' SUM(WHAPIOTCUnits)'+
	  ' FOR dateOTU IN (' + @SQLWHOTCUnits + ') '+
	' )as P5 '+

	' PIVOT '+
	' ( '+
	  ' SUM(WHAPIOTC) '+
	  ' FOR dateOTD IN  (' + @SQLWHOTCVol + ') '+
	' )as P6 '+

	' group by PMID '+

' )vol';

	EXEC(@SQL);

	WHILE @startCount2 < 1
	BEGIN
		SET  @date =  DATEADD(m,@startCount2,@strDateStr);

        SET  @varDate = RIGHT('0' + convert(varchar(2), month(@date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(@date),4), 3, 2)  

		SET @SQLToZero = ' UPDATE tmp_WHByUnits_detail_jmw SET [GRx Units ' + @varDate +  '] = 0.0 where    [GRx Units ' + @varDate +  '] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_WHByUnits_detail_jmw SET [GRx $ ' + @varDate +  '] = 0.0 where  [GRx $ ' + @varDate +  '] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_WHByUnits_detail_jmw SET [BRx Units ' + @varDate +  '] = 0.0 where [BRx Units ' + @varDate +  ']  is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_WHByUnits_detail_jmw SET[BRx $ ' + @varDate +  '] = 0.0 where [BRx $ ' + @varDate +  '] is null ';
        Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_WHByUnits_detail_jmw SET [OTC Units ' + @varDate +  '] = 0.0 where [OTC Units ' + @varDate +  ']  is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_WHByUnits_detail_jmw SET[OTC $ ' + @varDate +  '] = 0.0 where [OTC $ ' + @varDate +  '] is null ';
        Exec (@SQLToZero);

		SET @startCount2 = @startCount2 + 1;
	END
 -- TO DO PUTIN DELETE FOR @SQLDeleteZero
	 SET @SQLToZero = ' delete from tmp_WHByUnits_detail_jmw where ' + @SQLDeleteZero;
         print @SQLToZero;
	 Exec (@SQLToZero);

-- Now update all the other stuff

	UPDATE v set
		TM = p.territory  ,
		[AAP#] = p.aapaccountno,
		[Parent#] = p.aapparentno ,
		[API#] = p.apiaccountno ,
		[AAP Eff] =    CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,
        [AAP Elite] =   CONVERT(VARCHAR(10), mp.startdate, 101),
		[AAP Quit] =   CONVERT(VARCHAR(10), p.AAPQuitDate, 101),
		[Description] = p.AccountDescription ,
		Affiliate = p.Affiliate,
		[Account DBA Name] = p.[accountname],
		City = p.City, 
		ST = p.State ,
    	[API Acct Eff] = CONVERT(VARCHAR(10), p.dateopened, 101) ,
		[API Status] = p.APIStatus 
  
	FROM tmp_WHByUnits_detail_jmw v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid
    left outer join
	(
		select pmid,startdate from pharmacymaster..pm_memberprograms where programid = 184  
	) mp
	on v.pmid = mp.pmid

     UPDATE  tmp  set  
		 [Account DBA Name] = vol.acctname   
	      FROM  tmp_WHByUnits_detail_jmw  tmp  
		  inner join  
		 	( select max(accountname) as acctname, pmid from pharmacymaster..all_volume group by pmid) vol  
	      on tmp.pmid = vol.pmid    
          where tmp.pmid < 99  


-------- Processing for TM Summary

-- For Summary
	DECLARE @mo_between int;
	DECLARE @startDate varchar(10);
	DECLARE @endDate varchar(10);
    DECLARE @startYR varchar(50);
    DECLARE @endYR varchar(50);
	DECLARE @TMCount int; 
	DECLARE @startTMCount  int;
	DECLARE @startTMCount2  int;
	DECLARE @SQLColTM varchar(max);
    DECLARE @SQLColTMDiff varchar(max);
	DECLARE @SQLSelectTM varchar(max);
	DECLARE @SQLSetToZeroTM varchar(max);
	DECLARE @SQLSumTM varchar(max);
	DECLARE @SQLDeleteZeroTM varchar(max);
	DECLARE @mo_currYR_TM_start int;
    DECLARE @SQLMo_Curr_YR_TM varchar(100);
    DECLARE @SQLMo_Prev_YR_TM varchar(100);
	DECLARE @SQLToZero_TM  varchar(max);
	DECLARE @SQLTMDiff varchar(max);

	DECLARE @prevStartDate varchar(10);
	DECLARE @prevEndDate varchar(10);
	DECLARE @prevYear varchar(4);
	DECLARE @varPrevDate varchar(20);
	DECLARE @prevdate datetime;

	SET @startDate = '01/01/' + @in_year; -- start always at beginning of year
    SET @endDate = @in_month + '/01/' + @in_year;
	SET @prevYear = @in_year -1;

    SET @mo_between = (select datediff(month,@startDate,@endDate)) + 1  ;
  --  SET @mo_between = @mo_between + 1;
    SET @startYR = year(@startDate);
    SET @endYR = year(@endDate);

	SET @prevStartDate = '01/01/' + @prevYear;
	SET @prevEndDate  = '12/01/' + @prevYear;


    SET @startTMCount = 0; 
    SET @startTMCount2 = 0;   
	SET @TMCount = 12 + @mo_between;
	SET @SQLColTM = '';
	SET @SQLSelectTM = '';
    SET @SQLMo_Curr_YR_TM = '';
    SET @SQLMo_Prev_YR_TM = '01,02,03,04,05,06,07,08,09,10,11,12' -- this will always be entire year
	SET @SQLSetToZeroTM = '';
	SET @SQLSumTM = '';
	SET @SQLDeleteZeroTM = '';
	SET @SQLColTMDiff = ''
	SET @SQLTMDiff = '';

	SET @mo_currYR_TM_start = 1; 

-- Build the entire previous year and the months in the current year - I hope
	WHILE @startTMCount < @TMCount
	BEGIN
		SET  @date =  DATEADD(m,@startTMCount,@prevStartDate);
        SET  @varDate = RIGHT('0' + convert(varchar(2), month(@date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(@date),4), 3, 2)  
		SET @SQLColTM = @SQLColTM +  ' MAX([GRx Units ' + @varDate +  ']) as [GRx Units ' + @varDate  + '], ';
		SET @SQLSelectTM = @SQLSelectTM +  ' [GRx Units ' + @varDate  + '], ';
		SET @SQLSumTM = @SQLSumTM + ' SUM([GRx Units ' + @varDate  + ']) as [GRx Units ' + @varDate  + '], ';
        SET @SQLDeleteZeroTM = @SQLDeleteZeroTM + ' [GRx Units ' + @varDate  + '] = 0 and ';
    	SET @startTMCount = @startTMCount + 1;
	END
-- Take off trailing comma
     SET @SQLColTM = substring(@SQLColTM,0,len(@SQLColTM) );
     SET @SQLSelectTM = substring(@SQLSelectTM,0,len(@SQLSelectTM) );
	-- SET @SQLSumTM = substring(@SQLSumTM,0,len(@SQLSumTM) );
	 SET @SQLDeleteZeroTM = substring(@SQLDeleteZeroTM,0,len(@SQLDeleteZeroTM) -3 );

-- Add columns for Difference
	SET @startTMCount = 0;
    WHILE @startTMCount < @mo_between 
	BEGIN
        SET  @date =  DATEADD(m,@startTMCount,@startDate);
		SET @SQLColTMDiff = @SQLColTMDiff + ' cast(0 as int) as [Difference  ' +  datename(month,dateadd(month, month(@date) - 1, 0)) + '],';
    	SET @startTMCount = @startTMCount + 1;
	END
 -- Take off trailing comma
      SET @SQLColTMDiff = substring(@SQLColTMDiff,0,len(@SQLColTMDiff) );

-- Build string for months to select in current year (Previous year will always be full year)
    WHILE @mo_currYR_TM_start < =  @in_month 
	BEGIN
	  SET @SQLMo_Curr_YR_TM = @SQLMo_Curr_YR_TM + cast(@mo_currYR_TM_start as varchar(2)) + ',';
	  SET @mo_currYR_TM_start = @mo_currYR_TM_start + 1;
	END 
    -- Take off the last comma
    SET @SQLMo_Curr_YR_TM = substring(@SQLMo_Curr_YR_TM,0,len(@SQLMo_Curr_YR_TM) );

	-- Now load into temp table with PMID so we can get the TM
SET @SQL = ' SELECT * into tmp_WHUnits_TM_PMID from ( ' +
			'	SELECT   ' +
			'			cast(null as varchar(10)) as TM , '+
			'			PMID,  '+  @SQLColTM + 
			'		FROM ( '+
			'		  SELECT PMID,date, '+ 

 			'			''GRx Units ''+ RIGHT(''0'' + convert(varchar(2), month(date)), 2)  + ''-'' +  SUBSTRING(CONVERT(VARCHAR(9), year(date),4), 3, 2)    AS dateGRU , '+ 
			'			sum(isnull(WHAPIGenericUnits,0)) as WHAPIGenericUnits '+
			'		  FROM pharmacymaster..all_volume  where (( month(date) in (' + @SQLMo_Prev_YR_TM + ') and year(date) = ' + @prevYear + ') ' +
			'             or (month(date) in (' + @SQLMo_Curr_YR_TM + ') and year(date) = ' + @in_year + ')) and pmid != 900000 ' +
 			'			 group by PMID ,date ' +
			'		) as TableDate ' +
			'		PIVOT ' +
			'		( ' +
			'		  SUM(WHAPIGenericUnits) ' +
			'		  FOR dateGRU IN  (' + @SQLSelectTM + ') ' +
			'		)as P1 ' +					
			'		group by PMID ' +
            ' ) jw ';

print @sql

EXEC (@SQL);
--Set Nulls to zero
		WHILE @startTMCount2 < @TMCount
		BEGIN
			SET  @date =  DATEADD(m,@startTMCount2,@prevStartDate);
			SET  @varDate = RIGHT('0' + convert(varchar(2), month(@date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(@date),4), 3, 2)  
			SET @SQLSetToZeroTM = ' UPDATE tmp_WHUnits_TM_PMID SET [GRx Units ' + @varDate +  '] = 0.0 where    [GRx Units ' + @varDate +  '] is null ';
			EXEC (@SQLSetToZeroTM);
            SET @startTMCount2 = @startTMCount2 + 1;
		END
 



	UPDATE v set
		TM = p.territory   
  
	FROM tmp_WHUnits_TM_PMID v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid;


	SET @SQL = 'SELECT * into tmp_WHUnits_TM from ( ' +
			' SELECT TM, ' + @SQLSumTM + @SQLColTMDiff +' from tmp_WHUnits_TM_PMID group by TM ' +
			' )jw ';
	EXEC (@SQL);

    

-- Set Difference Values
	SET @startTMCount = 0;
    WHILE @startTMCount < @mo_between 
	BEGIN
        SET  @date =  DATEADD(m,@startTMCount,@startDate);
		SET  @prevdate =  DATEADD(m,@startTMCount,@prevStartDate);
        SET  @varDate = RIGHT('0' + convert(varchar(2), month(@date)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(@date),4), 3, 2)  
        SET  @varPrevDate = RIGHT('0' + convert(varchar(2), month(@prevdate)), 2)  + '-' +  SUBSTRING(CONVERT(VARCHAR(9), year(@prevdate),4), 3, 2)  
		SET @SQLTMDiff = 'Update tmp_WHUnits_TM set  [Difference  ' +  datename(month,dateadd(month, month(@date) - 1, 0)) + '] =  [GRx Units ' + @varDate +  '] -  [GRx Units ' + @varPrevDate +  ']';
        print @SQLTMDiff;
        EXEC (@SQLTMDiff);
    	SET @startTMCount = @startTMCount + 1;
	END
 


	SET @SQLToZero_TM = ' delete from tmp_WHUnits_TM where ' + @SQLDeleteZeroTM + ' and TM is null ';
    print @SQLToZero_TM
	EXEC (@SQLToZero_TM)


END








GO
