USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_Commission_DYN_QTR_NEW]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_Commission_DYN_QTR_NEW]
(@startDate varchar(10), @endDate varchar(10) )

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @SQLWHCol varchar(max);
    DECLARE @SQLCHCol varchar(max);
    DECLARE @SQLMLCol varchar(max);


	DECLARE @SQLWHBrand varchar(500);
	DECLARE @SQLWHGen varchar(500);
	DECLARE @SQLWHOTC varchar(500);

    DECLARE @varWHDate varchar(20);
    DECLARE @varCHDate varchar(20);
    DECLARE @varCHDate2 varchar(20);
    DECLARE @varMLDate varchar(20);

	DECLARE @chMonth int;
	DECLARE @startCHCount int;
	DECLARE @startWHCount int;
    DECLARE @startMLCount int;

	DECLARE @startCHCount2 int;
	DECLARE @startWHCount2 int;
    DECLARE @startMLCount2 int;

    DECLARE @SQL varchar(max);
    DECLARE @SQL2 varchar(max);
    DECLARE @SQL3 varchar(max);

	DECLARE @SQLCHTotal varchar(500);

    DECLARE @SQLMLTotal varchar(500);
	DECLARE @SQLToZero varchar(500);

    DECLARE @startYR varchar(50);
    DECLARE @endYR varchar(50);

    DECLARE @isOneYear varchar(1);

	DECLARE @mo_between int;
    DECLARE @mo_currYR_start int;
    DECLARE @SQLMo_Curr_YR varchar(50);
    DECLARE @SQLMo_Prev_YR varchar(50);
    DECLARE @mo_prevYR_start int;
    DECLARE @mo_prevYR_end int;

    SET @SQLMo_Curr_YR = '';
    SET @SQLMo_Prev_YR = '';
    SET @SQLWHCol = '';
    SET @SQLCHCol = '';
    SET @SQLMLCol = '';
	SET @SQLWHBrand = '';  
	SET @SQLWHGen = '';  
	SET @SQLWHOTC = '';
    SET @SQLCHTotal = '';
    SET @SQLMLTotal = '';


    SET @mo_between = (select datediff(month,@startDate,@endDate)) + 1  ;
  --  SET @mo_between = @mo_between + 1;
    SET @startYR = year(@startDate);
    SET @endYR = year(@endDate);


	IF(@startYR = year(@endYR))
		BEGIN
			SET @mo_currYR_start = month(@startDate);
			SET @isOneYear = 'Y';
		END
	ELSE
		BEGIN
			 SET @mo_currYR_start = 1;
             SET @mo_prevYR_start = month(@startDate);
             SET @mo_prevYR_end  = 12;
             SET @isOneYear = 'N';
		END

	SET @startCHCount = 0;   
    SET @startMLCount = 0; 
	SET @startWHCount = 0;

	SET @startCHCount2 = 0;   
    SET @startMLCount2 = 0; 
	SET @startWHCount2 = 0;
  
	   --- Drop the previous runs table

 
		 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_Comm_OneOff_jmw')
		 BEGIN
          DROP TABLE tmp_Comm_OneOff_jmw
         END

   
    -- Build the API WH Sales fields for 13 Months
	WHILE @startWHCount < @mo_between
	BEGIN
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@startWHCount,@startDate));
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Brand Sales])  as [API ' +@varWHDate + ' Brand Sales], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Generic Sales])  as [API ' + @varWHDate + ' Generic Sales], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' OTC Sales])  as [API ' +@varWHDate + ' OTC Sales], ';

        
       	SET @SQLWHBrand = @SQLWHBrand + ' [API ' +@varWHDate + ' Brand Sales], '; 
		SET @SQLWHGen = @SQLWHGen + ' [API ' + @varWHDate + ' Generic Sales], ';  
		SET @SQLWHOTC = @SQLWHOTC + ' [API ' +@varWHDate + ' OTC Sales], ';


    	SET @startWHCount = @startWHCount + 1;
	END

   -- Now take of trailing comma
       SET @SQLWHBrand = substring(@SQLWHBrand,0,len(@SQLWHBrand) );
       SET @SQLWHGen = substring(@SQLWHGen,0,len(@SQLWHGen) );
       SET @SQLWHOTC = substring(@SQLWHOTC,0,len(@SQLWHOTC) );

----------------
-- Loop through months  for CAH  
	WHILE @startCHCount < @mo_between
	BEGIN
		SET @varCHDate =  dbo.fDate1(DATEADD(m,@startCHCount,@startDate));
		SET @varCHDate2 =  dbo.fDate2(DATEADD(m,@startCHCount,@startDate));
        --Changed these next 4 to use @varCHDate
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' Sales])  as [CAH ' + @varCHDate + ' Sales],';
		SET @SQLCHTotal = @SQLCHTotal + ' [CAH ' + @varCHDate + ' Sales],'; 


		SET @startCHCount  = @startCHCount + 1;

    END
   -- Now take of trailing comma (not for the columns though)
        SET @SQLCHTotal = substring(@SQLCHTotal,0,len(@SQLCHTotal) );

     -- Loop through months - Start at 1 - this is for ML Volume YTD
	WHILE @startMLCount < @mo_between
	BEGIN
		SET @varMLDate =  dbo.fDate1(DATEADD(m,@startMLCount,@startDate));
		SET @SQLMLCol = @SQLMLCol + ' MAX([ML ' + @varMLDate + ' Sales]) as [ML ' + @varMLDate + ' Sales],';
	   	SET @SQLMLTotal  = @SQLMLTotal + ' [ML ' + @varMLDate + ' Sales],';
 

	    SET @startMLCount  = @startMLCount + 1;
    END
       -- Now take of trailing comma - need to take off for columns on this one - it's the last one
       SET @SQLMLCol = substring(@SQLMLCol,0,len(@SQLMLCol) );
	   SET @SQLMLTotal = substring(@SQLMLTotal,0,len(@SQLMLTotal) );

-----------
     -- Loop through months in current year to tell which ones we need to select

    WHILE @mo_currYR_start < = month(@endDate)
	BEGIN
	  SET @SQLMo_Curr_YR = @SQLMo_Curr_YR + cast(@mo_currYR_start as varchar(2)) + ',';
	  SET @mo_currYR_start = @mo_currYR_start + 1;
	END 
    -- Take off the last comma
    SET @SQLMo_Curr_YR = substring(@SQLMo_Curr_YR,0,len(@SQLMo_Curr_YR) );


   --Loop through months in previous years - not using the commented out version  
       
    IF(@isOneYear = 'N')
	BEGIN
		WHILE @mo_prevYR_start < = @mo_prevYR_end
		BEGIN
			SET @SQLMo_Prev_YR = @SQLMo_Prev_YR + cast(@mo_prevYR_start as varchar(2)) + ','
			SET @mo_prevYR_start = @mo_prevYR_start + 1;
		END 
		-- Take off the last comma
		SET @SQLMo_Prev_YR = substring(@SQLMo_Prev_YR,0,len(@SQLMo_Prev_YR) )

   END



 SET @SQL = ' SELECT * INTO tmp_Comm_OneOff_jmw from ( '+
	        ' SELECT   '+
            '   cast(null as varchar(10)) as TM , '+
            '   PMID,  '+
			'   cast(null as varchar(20)) as AAP# ,  '+
			'   cast(null as varchar(20)) as Parent# ,  '+
			'   cast(null as varchar(20)) as [API Warehouse#] ,  '+
            '   cast(null as datetime) as [AAP Eff] ,'+
            '   cast(null as datetime) as [AAP Quit] ,'+
            '   cast(null as  varchar(100)) as [Description] , '+
			'   cast(null as  varchar(200)) as Affiliate ,    '+
			'   cast(null as  varchar(100)) as [Account DBA Name] ,  '+
			'   cast(null as  varchar(100)) as [City] ,  '+
			'   cast(null as  varchar(100)) as ST , '+
			'   cast(null as datetime ) as [Whse Acct Date Opened] , '+
            '   cast(null as varchar(20)) as [API Status] ,'+
			'   cast(null as  varchar(10)) as Wholesaler,  '+
                +  @SQLWHCol + @SQLCHCol + @SQLMLCol ;

print @SQL;
print @SQLWHCol;
 
	SET @SQL2 =  ' FROM ( '+
				'  SELECT PMID,date, '+
				'''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Brand Sales'' as dateWAB, '+
				' sum(isnull(WHAPIBrand,0))as WHAPIBrand  ,'+
				'''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Generic Sales'' as dateWAG,'+
				' sum(isnull(WHAPIGeneric,0))as WHAPIGeneric ,'+
				'''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' OTC Sales'' as dateWAO,'+
				' sum(isnull(WHAPIOTC,0))as WHAPIOTC  ,'+
				'''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Sales''    AS dateCTS ,'+
				' sum(isnull(AAPNetSales,0)) as AAPNetSales,'+
				'''ML ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Sales''    AS dateML ,'+
				' sum(isnull(MLTotal,0)) as MLTotal ' ;
	      
	 IF(@isOneYear = 'N')
				BEGIN

       			   SET @SQL2 = @SQL2 +  ' FROM pharmacymaster..all_volume  where ( month(date) in ( ' +
					 @SQLMo_Prev_YR + ')'+
					 ' and year(date) = ' + @startYR + ')';
	
					 SET @SQL2 = @SQL2 + '	 or (month(date) in ( ' +
					 @SQLMo_Curr_YR + ')' +
					 ' and year(date) =  ' + @endYR  + ')' ;
    
					  SET @SQL2 = @SQL2 + ' group by PMID ,date ' +
					 ' ) as TableDate ';
				END
           ELSE 
				BEGIN
					SET @SQL2 = @SQL2 +  ' FROM pharmacymaster..all_volume  where ( month(date) in ( ' +
					 @SQLMo_Curr_YR + ')'+
					 ' and year(date) = ' + @startYR + ')';
					 SET @SQL2 = @SQL2 +  ' group by PMID ,date ' +
					 ' ) as TableDate ';
				END



	SET @SQL2 = @SQL2  + ' PIVOT '+
		' ( '+
		  ' SUM(WHAPIBrand) '+
		  ' FOR dateWAB IN  ( ' + @SQLWHBrand + ')' + 
		' ) as P1 '+
		' PIVOT '+
		' ( '+
		  ' SUM(WHAPIGeneric)'+
		  ' FOR dateWAG IN   ( ' + @SQLWHGen + ')' +  
		' ) as P2 '+
		' PIVOT '+
		' ( '+
		  ' SUM(WHAPIOTC) '+
		  ' FOR dateWAO IN  ( ' +  @SQLWHOTC + ')' +  
		' )as P3 '+
		' PIVOT '+
		' ( '+
		  ' SUM(AAPNetSales) '+
		  ' FOR dateCTS IN  ( ' +  @SQLCHTotal + ')' +  
		' )as P4 '+

		' PIVOT '+
		' ( '+
		  ' SUM(MLTotal) '+
		  ' FOR dateML IN   ( ' +  @SQLMLTOtal + ')' +  
		' )as P5 '+
		' group by PMID '+

	' )vol';

    print @sql
    print @sql2
    print 'im here'
	EXEC (@SQL + @SQL2)


-- Set where null to zero so we can do  totals
-- Set Warehouse columns to zero where null
	WHILE @startWHCount2 < @mo_between
	BEGIN
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@startWHCount2,@startDate));
		SET @SQLToZero = ' UPDATE tmp_Comm_OneOff_jmw SET [API ' + @varWHDate +  ' Brand Sales] = 0.0 where    [API ' +@varWHDate + ' Brand Sales] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_Comm_OneOff_jmw SET [API ' + @varWHDate +  ' Generic Sales] = 0.0 where  [API ' + @varWHDate + ' Generic Sales] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_Comm_OneOff_jmw SET [API ' + @varWHDate +  ' OTC Sales] = 0.0 where [API ' +@varWHDate + ' OTC Sales]  is null ';
        Exec (@SQLToZero);

		SET @startWHCount2 = @startWHCount2 + 1;
	END
-- Set CH columns to zero where null
	WHILE @startCHCount2 < @mo_between
	BEGIN
		SET @varCHDate2 =  dbo.fDate2(DATEADD(m,@startCHCount2,@startDate));
        SET @varCHDate =  dbo.fDate1(DATEADD(m,@startCHCount2,@startDate));
		-- Changed these next 4 to use @varCHDate

		SET @SQLToZero = ' UPDATE tmp_Comm_OneOff_jmw SET [CAH ' + @varCHDate + ' Sales] = 0.0 where [CAH ' + @varCHDate + ' Sales] is null';
        Exec (@SQLToZero);

		SET @startCHCount2  = @startCHCount2 + 1;
    END

-- Set ML Columns to zero where null
	WHILE @startMLCount2 < @mo_between
	BEGIN
		SET @varMLDate =  dbo.fDate1(DATEADD(m,@startMLCount2,@startDate));
		SET @SQLToZero = ' UPDATE tmp_Comm_OneOff_jmw SET [ML ' + @varMLDate + ' Sales]  = 0.0 where  [ML ' + @varMLDate + ' Sales] is null';
        Exec (@SQLToZero);
	    SET @startMLCount2  = @startMLCount2 + 1;
    END
 
	UPDATE v set
		TM = p.territory  ,
        --PMID = p.pmid,
		[AAP#] = p.aapaccountno,
		[Parent#] = p.aapparentno ,
		[API Warehouse#] = p.apiaccountno ,
		[AAP Eff] =    CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,
		[AAP Quit] =   CONVERT(VARCHAR(10), p.AAPQuitDate, 101),
		[Description] = p.AccountDescription ,
		Affiliate = p.Affiliate,
		[Account DBA Name] = p.[accountname],
		City = p.City, 
		ST = p.State ,
    	[Whse Acct Date Opened] = CONVERT(VARCHAR(10), p.dateopened, 101) ,
		[API Status] = p.APIStatus  ,
		Wholesaler = case when w.vendor is null then 'CH' else w.vendor end    
 
	FROM tmp_Comm_OneOff_jmw v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid

    -- Update the CH to CAH
	UPDATE tmp_Comm_OneOff_jmw set  Wholesaler = 'CAH' where Wholesaler = 'CH'

	-- Update those funky PMID's
	UPDATE t set  [Account DBA Name]= p.accountname
	FROM tmp_Comm_OneOff_jmw t
	join(
	SELECT pmid,accountname FROM ( 
	SELECT * , Rank() OVER (Partition BY pmid order by date desc) as Rank
	FROM (SELECT     *
				FROM        pharmacymaster..All_Volume where pmid < 99       ) pm 
	) tmp where   Rank = 1  
	)p on t.pmid = p.pmid

	UPDATE   tmp_Comm_OneOff_jmw set  [Account DBA Name] = 'No PMID' where pmid = 900000


	 
END








GO
