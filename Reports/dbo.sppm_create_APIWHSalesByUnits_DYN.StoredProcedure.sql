USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_APIWHSalesByUnits_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Compliance Report for Chriss S.
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_APIWHSalesByUnits_DYN]
(@in_month varchar(02), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON; 
    DECLARE @MonthActive    varchar(50);

	DECLARE @SQL  varchar(6000);
	DECLARE @date datetime;
	DECLARE @compDate datetime; 
    DECLARE @strDate datetime;
	DECLARE @strDateStr varchar(50);
	SET @compDate ='09/01/2011'; -- This is the date where we will start a full 12 months - otherwise we start with 9/2010
	--SET @MonthActive = substring(@in_month,len(@in_month) -1,2);
	SET @strDate =  @in_month + '/01/' + @in_year  ;
	SET @strDateStr =  @in_month + '/01/' + @in_year  ;


    DECLARE @mo_currYR_start int;
    DECLARE @SQLMo_Curr_YR varchar(50);
    DECLARE @SQLMo_Prev_YR varchar(50);
    DECLARE @mo_prevYR_start int; -- Set to 9 if not full year
	DECLARE @yr_curr varchar(4);
	DECLARE @yr_prev varchar(4);
    DECLARE @mo_prevYR_end int;
	DECLARE @startCount int;
	DECLARE @startCount2 int;
    DECLARE @startCount3 int;
    DECLARE @varDate varchar(20);

    DECLARE @SQLCol varchar(2700);
    DECLARE @SQLToZero varchar(1000);

	DECLARE @SQLWHBrandUnits varchar(500);
	DECLARE @SQLWHGenUnits varchar(500);
	DECLARE @SQLWHOTCUnits varchar(500);

	DECLARE @SQLWHBrandVol varchar(500);
	DECLARE @SQLWHGenVol varchar(500);
	DECLARE @SQLWHOTCVol varchar(500);
	DECLARE @SQLDeleteZero varchar(1000);

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

 
	IF( @strDate >= @compDate  ) --If the date we enter is greater than or equal to where we start the full year processing

		BEGIN
 
			print('Yes') -- Put In Processing for full year
			SET @mo_prevYR_start = @in_month
			SET @yr_prev = @in_year - 1;
			SET @startCount = -12;
			SET @startCount2 = -12;
			SET @startCount3 = -12;
		END
	ELSE
		BEGIN
			print('No') -- Not Full year processing - year starts with 9/2010
			SET @mo_prevYR_start = '09';
			SET @yr_prev = '2010';
			IF(@in_year = '2010' )
				BEGIN
					SET @startCount = -4;
					SET @startCount2 = -4;
					SET @startCount3 = -4;
				END
			ELSE 
				BEGIN
					SET @startCount = -4 +  (cast(@in_month as int)  * -1 );
					SET @startCount2 = -4 +  (cast(@in_month as int)  * -1);
                    SET @startCount3 = -4 +  (cast(@in_month as int)  * -1);
				END
		END


       --Loop through months in previous years - 
	WHILE @mo_prevYR_start < = @mo_prevYR_end
		BEGIN
			SET @SQLMo_Prev_YR = @SQLMo_Prev_YR + cast(@mo_prevYR_start as varchar(2)) + ','
			SET @mo_prevYR_start = @mo_prevYR_start + 1;
		END 
	-- Take off the last comma
	SET @SQLMo_Prev_YR = substring(@SQLMo_Prev_YR,0,len(@SQLMo_Prev_YR) )
	-- Loop through months in current year to tell which ones we need to select

	IF(@in_year != '2010' )
		BEGIN
			WHILE @mo_currYR_start < = month(@in_month)
				BEGIN
					SET @SQLMo_Curr_YR = @SQLMo_Curr_YR + cast(@mo_currYR_start as varchar(2)) + ',';
					SET @mo_currYR_start = @mo_currYR_start + 1;
				END 
			-- Take off the last comma
			SET @SQLMo_Curr_YR = substring(@SQLMo_Curr_YR,0,len(@SQLMo_Curr_YR) );
		END
	 
-- Build the columns 

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
			 WHERE name = 'tmp_WHByUnits_jmw_test')
		 BEGIN
          DROP TABLE tmp_WHByUnits_jmw_test
         END
 
 SET @SQL = 'SELECT * INTO tmp_WHByUnits_jmw_test from ( '+
		'SELECT   '+
		' cast(null as varchar(10)) as TM , '+
	    'PMID,  '+
		'cast(null as varchar(20)) as AAP# ,  '+
		'cast(null as varchar(20)) as Parent# ,'+
		'cast(null as varchar(20)) as [API#] ,   '+  
		'cast('''' as DateTime) as [AAP Eff], '+
		'cast('''' as DateTime) as [API Acct Eff],   '+
		'cast('''' as DateTime) as [AAP Quit],   '+
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


	     ' FROM pharmacymaster..all_volume  where ( month(date) in ( ' ;
		print @sql;

         IF(@in_year = '2010')
			BEGIN 

	          SET @SQL = @SQL +    @SQLMo_Prev_YR + ')'+
                ' and year(date) = ' + @in_year + ')' ;
		    END
        ELSE
			BEGIN
			 SET @SQL = @SQL +  @SQLMo_Curr_YR + ')'+
             ' and year(date) = ' + @in_year + ') '+ 
			 '	 or (month(date) in ( ' +
	         @SQLMo_Prev_YR + ')' +
		     ' and year(date) =  ' + @yr_prev + ')' ;  
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

		SET @SQLToZero = ' UPDATE tmp_WHByUnits_jmw_test SET [GRx Units ' + @varDate +  '] = 0.0 where    [GRx Units ' + @varDate +  '] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_WHByUnits_jmw_test SET [GRx $ ' + @varDate +  '] = 0.0 where  [GRx $ ' + @varDate +  '] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_WHByUnits_jmw_test SET [BRx Units ' + @varDate +  '] = 0.0 where [BRx Units ' + @varDate +  ']  is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_WHByUnits_jmw_test SET[BRx $ ' + @varDate +  '] = 0.0 where [BRx $ ' + @varDate +  '] is null ';
        Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_WHByUnits_jmw_test SET [OTC Units ' + @varDate +  '] = 0.0 where [OTC Units ' + @varDate +  ']  is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_WHByUnits_jmw_test SET[OTC $ ' + @varDate +  '] = 0.0 where [OTC $ ' + @varDate +  '] is null ';
        Exec (@SQLToZero);

		SET @startCount2 = @startCount2 + 1;
	END
 -- TO DO PUTIN DELETE FOR @SQLDeleteZero
	 SET @SQLToZero = ' delete from tmp_WHByUnits_jmw_test where ' + @SQLDeleteZero;
         print @SQLToZero;
	 Exec (@SQLToZero);

-- Now update all the other stuff

	UPDATE v set
		TM = p.territory  ,
		[AAP#] = p.aapaccountno,
		[Parent#] = p.aapparentno ,
		[API#] = p.apiaccountno ,
		[AAP Eff] =    CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,
		[AAP Quit] =   CONVERT(VARCHAR(10), p.AAPQuitDate, 101),
		[Description] = p.AccountDescription ,
		Affiliate = p.Affiliate,
		[Account DBA Name] = p.[accountname],
		City = p.City, 
		ST = p.State ,
    	[API Acct Eff] = CONVERT(VARCHAR(10), p.dateopened, 101) ,
		[API Status] = p.APIStatus 
  
	FROM tmp_WHByUnits_jmw_test v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid

     UPDATE  tmp  set  
		 [Account DBA Name] = vol.acctname   
	      FROM  tmp_WHByUnits_jmw_test  tmp  
		  inner join  
		 	( select max(accountname) as acctname, pmid from pharmacymaster..all_volume group by pmid) vol  
	      on tmp.pmid = vol.pmid    
          where tmp.pmid < 99  



END








GO
