USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ReportCardVolume_DYN_PMID_ANDA]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ReportCardVolume_DYN_PMID_ANDA]
(@startDate varchar(10), @endDate varchar(10),@pmid varchar(8000) )

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @chMonth int;
	DECLARE @startCHCount int;
	DECLARE @startWHCount int;
    DECLARE @startMLCount int;
    DECLARE @startAndaCount int;
    DECLARE @startCombCount int;

	DECLARE @startCHCount2 int;
	DECLARE @startWHCount2 int;
    DECLARE @startMLCount2 int;
    DECLARE @startAndaCount2 int;
    DECLARE @startCombCount2 int;

	DECLARE @startCHCountComb int;
	DECLARE @startWHCountComb int;
    DECLARE @startMLCountComb int;
	DECLARE @startAndaCountComb int;
    DECLARE @startCombCountComb int;

    DECLARE @SQL varchar(max);
    DECLARE @SQL2 varchar(max);
    DECLARE @SQL3 varchar(max);

--    DECLARE @SQL varchar(8000);
--    DECLARE @SQL2 varchar(8000);
--    DECLARE @SQL3 varchar(8000);
 
--    DECLARE @SQLWHCol varchar(2700);
--    DECLARE @SQLCHCol varchar(5000);
--    DECLARE @SQLMLCol varchar(1000);
--    DECLARE @SQLCombCol varchar(2000);

    DECLARE @SQLWHCol varchar(max);
    DECLARE @SQLCHCol varchar(max);
    DECLARE @SQLMLCol varchar(max);
	DECLARE @SQLAndaCol varchar(max);
    DECLARE @SQLCombCol varchar(max);

	DECLARE @SQLWHBrand varchar(500);
	DECLARE @SQLWHGen varchar(500);
	DECLARE @SQLWHOTC varchar(500);
	DECLARE @SQLWHTotal varchar(500);

	DECLARE @SQLWHBrandTotal varchar(500);
	DECLARE @SQLWHGenTotal varchar(500);
	DECLARE @SQLWHOTCTotal varchar(500);
	DECLARE @SQLWHTotalTotal varchar(500);

	DECLARE @SQLCHBrand varchar(500);
	DECLARE @SQLCHGenTotSrc varchar(500);
	DECLARE @SQLCHOther varchar(500);
	DECLARE @SQLCHTotal varchar(500);

    DECLARE @SQLMLTOtal varchar(500);
	DECLARE @SQLAndaTOtal varchar(500);

	DECLARE @SQLCHBrandTotal varchar(500);
	DECLARE @SQLCHGenTotSrcTotal varchar(500);
	DECLARE @SQLCHOtherTotal varchar(500);
	DECLARE @SQLCHTotalTotal varchar(500);

	DECLARE @SQLMLTOtalTotal varchar(500);
    DECLARE @SQLAndaTOtalTotal varchar(500);

	DECLARE @SQLToZero varchar(500);
    DECLARE @SQLUpdateTotal varchar(500);
	DECLARE @SQLAllCol varchar(500);

	--Used to create select statement for the By Territory
	DECLARE @SQLWHColSelect varchar(max);
	DECLARE @SQLCHColSelect varchar(max);
    DECLARE @SQLMLColSelect varchar(max);
    DECLARE @SQLAndaColSelect varchar(max);
    DECLARE @SQLCombColSelect varchar(max);


    DECLARE @isOneYear varchar(1);

    DECLARE @varWHDate varchar(20);
    DECLARE @varCHDate varchar(20);
    DECLARE @varCHDate2 varchar(20);
    DECLARE @varMLDate varchar(20);
    DECLARE @varAndaDate varchar(20);
    DECLARE @varCombDate varchar(20);
    DECLARE @startCHDate varchar(10);
    DECLARE @mo_currYR_start int;
    DECLARE @SQLMo_Curr_YR varchar(50);
    DECLARE @SQLMo_Prev_YR varchar(50);
    DECLARE @mo_prevYR_start int;

    DECLARE @varWh_PrevYrDate  varchar(12);
    DECLARE @mo_prevYR_end int;

    DECLARE @startYR varchar(50);
    DECLARE @endYR varchar(50);

	DECLARE @mo_between int;
    SET @mo_between = (select datediff(month,@startDate,@endDate)) + 1  ;
  --  SET @mo_between = @mo_between + 1;
    SET @startYR = year(@startDate);
    SET @endYR = year(@endDate);


  
    SET @SQLWHCol = '';
    SET @SQLCHCol = '';
    SET @SQLMLCol = '';
    SET @SQLAndaCol = '';
    SET @SQLCombCol = '';

	SET @SQLWHBrand = '';  
	SET @SQLWHGen = '';  
	SET @SQLWHOTC = '';
	SET @SQLWHTotal = '';
	SET @SQLCHBrand = '';
	SET @SQLCHGenTotSrc = '';
	SET @SQLCHOther  = '';
	SET @SQLCHTotal = '';
	SET @SQLMLTOtal  = '';
	SET @SQLAndaTOtal  = '';

	SET @SQLWHBrandTotal = '';  
	SET @SQLWHGenTotal = '';  
	SET @SQLWHOTCTotal = '';
	SET @SQLWHTotalTotal = '';
	SET @SQLCHBrandTotal = '';
	SET @SQLCHGenTotSrcTotal = '';
	SET @SQLCHOtherTotal  = '';
	SET @SQLCHTotalTotal = '';
	SET @SQLMLTOtalTotal  = '';
	SET @SQLAndaTOtalTotal  = '';
	SET @SQLUpdateTotal = '';
	SET @SQLAllCol = '';

	SET @SQLWHColSelect = '';
	SET @SQLCHColSelect = '';
    SET @SQLMLColSelect = '';
    SET @SQLAndaColSelect = '';
    SET @SQLCombColSelect = '';

 

	--SET @startMonth = month(@startDate);
	SET @startCHCount = 0;  ---!!!!!!!!!!!!!!! When running in 2011 set the count to 0 - this was set to 1 to pull out January (no Sales in Jan 2010)
    SET @startMLCount = 0; 
    SET @startAndaCount = 0; 
	SET @startWHCount = 0;
    SET @startCombCount = 0;

	SET @startCHCount2 = 0;  ---!!!!!!!!!!!!!!! When running in 2011 set the count to 0 - this was set to 1 to pull out January (no Sales in Jan 2010)
    SET @startMLCount2 = 0; 
    SET @startAndaCount2 = 0; 
	SET @startWHCount2 = 0;
    SET @startCombCount2 = 0;


	SET @startCHCountComb = 0;  ---!!!!!!!!!!!!!!! When running in 2011 set the count to 0 - this was set to 1 to pull out January (no Sales in Jan 2010)
    SET @startMLCountComb = 0; 
    SET @startAndaCountComb = 0; 
	SET @startWHCountComb = 0;
    SET @startCombCountComb = 0;

    SET @startCHDate = @startDate;
    SET @SQLMo_Curr_YR = '';
    SET @SQLMo_Prev_YR = '';

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
     
   
    -- Build the API WH Sales fields for 13 Months
	WHILE @startWHCount < @mo_between
	BEGIN
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@startWHCount,@startDate));
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Brand])  as [API ' +@varWHDate + ' Brand], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Generic])  as [API ' + @varWHDate + ' Generic], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' OTC])  as [API ' +@varWHDate + ' OTC], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Total Whse])  as [API ' + @varWHDate + ' Total Whse], ';
        
       	SET @SQLWHBrand = @SQLWHBrand + ' [API ' +@varWHDate + ' Brand], '; 
		SET @SQLWHGen = @SQLWHGen + ' [API ' + @varWHDate + ' Generic], ';  
		SET @SQLWHOTC = @SQLWHOTC + ' [API ' +@varWHDate + ' OTC], ';
		SET @SQLWHTotal = @SQLWHTotal + ' [API ' + @varWHDate + ' Total Whse], ';
		-- Used to calculate totals for Update below (way at bottom of code)
        SET @SQLWHBrandTotal = @SQLWHBrandTotal + ' [API ' +@varWHDate + ' Brand] + '; 
		SET @SQLWHGenTotal = @SQLWHGenTotal + ' [API ' + @varWHDate + ' Generic] + ';  
		SET @SQLWHOTCTotal = @SQLWHOTCTotal + ' [API ' +@varWHDate + ' OTC] + ';
		SET @SQLWHTotalTotal = @SQLWHTotalTotal + ' [API ' + @varWHDate + ' Total Whse] + ';

		-- Used to create select statement for By Territory
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varWHDate +  ' Brand])  as [API ' +@varWHDate + ' Brand], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varWHDate +  ' Generic])  as [API ' + @varWHDate + ' Generic], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varWHDate +  ' OTC])  as [API ' +@varWHDate + ' OTC], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varWHDate +  ' Total Whse])  as [API ' + @varWHDate + ' Total Whse], ';

    	SET @startWHCount = @startWHCount + 1;
	END
   -- Now take of trailing comma
       SET @SQLWHBrand = substring(@SQLWHBrand,0,len(@SQLWHBrand) );
       SET @SQLWHGen = substring(@SQLWHGen,0,len(@SQLWHGen) );
       SET @SQLWHOTC = substring(@SQLWHOTC,0,len(@SQLWHOTC) );
       SET @SQLWHTotal = substring(@SQLWHTotal,0,len(@SQLWHTotal) );

       SET @SQLWHBrandTotal = substring(@SQLWHBrandTotal,0,len(@SQLWHBrandTotal) );
       SET @SQLWHGenTotal = substring(@SQLWHGenTotal,0,len(@SQLWHGenTotal) );
       SET @SQLWHOTCTotal = substring(@SQLWHOTCTotal,0,len(@SQLWHOTCTotal) );
       SET @SQLWHTotalTotal = substring(@SQLWHTotalTotal,0,len(@SQLWHTotalTotal) );
   
   -- Loop through months - Start at 1 - this is for CAH YTD
	WHILE @startCHCount < @mo_between
	BEGIN
		SET @varCHDate =  dbo.fDate1(DATEADD(m,@startCHCount,@startDate));
		SET @varCHDate2 =  dbo.fDate2(DATEADD(m,@startCHCount,@startDate));
        --Changed these next 4 to use @varCHDate
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Brand])  as [CAH ' + @varCHDate + ' AAP Brand],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Src Generics])  as [CAH ' + @varCHDate + ' AAP Src Generics],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Other Sales])  as [CAH ' + @varCHDate + ' AAP Other Sales],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Total Sales])  as [CAH ' + @varCHDate + ' AAP Total Sales],';
        
		SET @SQLCHBrand = @SQLCHBrand + ' [CAH ' + @varCHDate + ' AAP Brand],';
		SET @SQLCHGenTotSrc = @SQLCHGenTotSrc + ' [CAH ' + @varCHDate + ' AAP Src Generics],';
		SET @SQLCHOther  = @SQLCHOther + '[CAH ' + @varCHDate + ' AAP Other Sales],';
		SET @SQLCHTotal = @SQLCHTotal + ' [CAH ' + @varCHDate + ' AAP Total Sales],'; 

        --Changed these next 4 to use @varCHDate
		-- Used to calculate totals for Update below (way at bottom of code)
		SET @SQLCHBrandTotal = @SQLCHBrandTotal + ' [CAH ' + @varCHDate + ' AAP Brand] + ';
		SET @SQLCHGenTotSrcTotal = @SQLCHGenTotSrcTotal + ' [CAH ' + @varCHDate + ' AAP Src Generics] +';
		SET @SQLCHOtherTotal  = @SQLCHOtherTotal + '[CAH ' + @varCHDate + ' AAP Other Sales] + ';
		SET @SQLCHTotalTotal = @SQLCHTotalTotal + ' [CAH ' + @varCHDate + ' AAP Total Sales] + '; 

        --Used to select By Territory
        --Changed these next 4 to use @varCHDate
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Brand])  as [CAH ' + @varCHDate + ' AAP Brand],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Src Generics])  as [CAH ' + @varCHDate + ' AAP Src Generics],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Other Sales])  as [CAH ' + @varCHDate + ' AAP Other Sales],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Total Sales])  as [CAH ' + @varCHDate + ' AAP Total Sales],';
 
		SET @startCHCount  = @startCHCount + 1;
        print @varCHDate;
        print @varCHDate2;
    END
   -- Now take of trailing comma (not for the columns though)
       SET @SQLCHBrand = substring(@SQLCHBrand,0,len(@SQLCHBrand) );
       SET @SQLCHGenTotSrc = substring(@SQLCHGenTotSrc,0,len(@SQLCHGenTotSrc) );
       SET @SQLCHOther = substring(@SQLCHOther,0,len(@SQLCHOther) );
       SET @SQLCHTotal = substring(@SQLCHTotal,0,len(@SQLCHTotal) );

       SET @SQLCHBrandTotal = substring(@SQLCHBrandTotal,0,len(@SQLCHBrandTotal) );
       SET @SQLCHGenTotSrcTotal = substring(@SQLCHGenTotSrcTotal,0,len(@SQLCHGenTotSrcTotal) );
       SET @SQLCHOtherTotal = substring(@SQLCHOtherTotal,0,len(@SQLCHOtherTotal) );
       SET @SQLCHTotalTotal = substring(@SQLCHTotalTotal,0,len(@SQLCHTotalTotal) );

     -- Loop through months - Start at 1 - this is for ML Volume YTD
	WHILE @startMLCount < @mo_between
	BEGIN
		SET @varMLDate =  dbo.fDate1(DATEADD(m,@startMLCount,@startDate));
		SET @SQLMLCol = @SQLMLCol + ' MAX([ML ' + @varMLDate + ' Volume]) as [ML ' + @varMLDate + ' Volume],';
      	SET @SQLMLTOtal  = @SQLMLTOtal + ' [ML ' + @varMLDate + ' Volume],';
        SET @SQLMLTOtalTotal  = @SQLMLTOtalTotal + ' [ML ' + @varMLDate + ' Volume] + ';
		SET @SQLMLColSelect = @SQLMLColSelect + ' Sum([ML ' + @varMLDate + ' Volume]) as [ML ' + @varMLDate + ' Volume],';
  

	    SET @startMLCount  = @startMLCount + 1;
    END
       -- Now take of trailing comma (not for the columns though)
       SET @SQLMLTOtal = substring(@SQLMLTOtal,0,len(@SQLMLTOtal) );
       SET @SQLMLTOtalTotal = substring(@SQLMLTOtalTotal,0,len(@SQLMLTOtalTotal) );

     -- Loop through months - Start at 1 - this is for Anda Volume YTD
	WHILE @startAndaCount < @mo_between
	BEGIN
		SET @varAndaDate =  dbo.fDate1(DATEADD(m,@startAndaCount,@startDate));
		SET @SQLAndaCol = @SQLAndaCol + ' MAX([Anda ' + @varAndaDate + ' Volume]) as [Anda ' + @varAndaDate + ' Volume],';
      	SET @SQLAndaTOtal  = @SQLAndaTOtal + ' [Anda ' + @varAndaDate + ' Volume],';
        SET @SQLAndaTOtalTotal  = @SQLAndaTOtalTotal + ' [Anda ' + @varAndaDate + ' Volume] + ';
		SET @SQLAndaColSelect = @SQLAndaColSelect + ' Sum([Anda ' + @varAndaDate + ' Volume]) as [Anda ' + @varAndaDate + ' Volume],';
  

	    SET @startAndaCount  = @startAndaCount + 1;
    END
       -- Now take of trailing comma (not for the columns though)
       SET @SQLAndaTOtal = substring(@SQLAndaTOtal,0,len(@SQLAndaTOtal) );
       SET @SQLAndaTOtalTotal = substring(@SQLAndaTOtalTotal,0,len(@SQLAndaTOtalTotal) );

    --- Loop through Months to build the Combined Mnthly Sales -this uses range of WH Sales as this is the greater

	WHILE @startCombCount < @mo_between
	BEGIN
		SET  @varCombDate = dbo.fDate1(DATEADD(m,@startCombCount,@startDate));
		SET @SQLCombCol = @SQLCombCol +  ' cast(0 as float) as [Total ' + @varCombDate +  ' Combined Mthly Sales], ';
        SET @SQLCombColSelect = @SQLCombColSelect + ' Sum([Total ' + @varCombDate + ' Combined Mthly Sales]) as [Total ' + @varCombDate + ' Combined Mthly Sales],';
		SET @startCombCount = @startCombCount + 1;
	END


     -- Loop through months in current year to tell which ones we need to select

    WHILE @mo_currYR_start < = month(@endDate)
	BEGIN
	  SET @SQLMo_Curr_YR = @SQLMo_Curr_YR + cast(@mo_currYR_start as varchar(2)) + ',';
	  SET @mo_currYR_start = @mo_currYR_start + 1;
	END 
    -- Take off the last comma
    SET @SQLMo_Curr_YR = substring(@SQLMo_Curr_YR,0,len(@SQLMo_Curr_YR) );


   --Loop through months in previous years - not using the commented out version - I realized the start month was same as the month of the @wh_endDate passed in

--SET @startWHCount = -12;
--		SET  @varWh_PrevYrDate =  DateName(mm,dateadd(mm,-12, (CONVERT(VARCHAR(12), @wh_endDate, 101))))
--        SET  @mo_prevYR_end =  reporting.dbo.MonthName2Int(@varWh_PrevYrDate  ) 
       
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

	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_RCVol_jmw_pmid')
	 BEGIN
      DROP TABLE tmp_RCVol_jmw_pmid
     END

--- Here is where the fun begins

 SET @SQL = 'SELECT * INTO tmp_RCVol_jmw_pmid from ( ' +
	        '  SELECT  cast('''' as varchar(10)) as TM , '+
            ' PMID, ' +  
			'  cast(null as varchar(20)) as AAP# , '+
			'  cast(null as varchar(20)) as Parent# , '+
			'  cast(null as varchar(20)) as API# , '+
			'  cast(null as varchar(10)) as [AAP Eff] , '+
			'  cast(null as varchar(10)) as [AAP Quit] , '+
			'  cast(null as  varchar(200)) as Description , '+
			'  cast(null as  varchar(200)) as Affiliate , '+
			'  cast(null as  varchar(100)) as [Account DBA Name] , '+
			'  cast(null as  varchar(100)) as [Account Corporate Name] , '+
			'  cast(null as  varchar(100)) as [Address] , '+
			'  cast(null as  varchar(100)) as [City] , '+
			'  cast(null as  varchar(100)) as ST , '+
			'  cast(null as  varchar(100)) as Contact , '+
			'  cast(null as  varchar(10)) as [Whse Acct Date Opened] , '+
			'  cast(null as  varchar(100)) as Status , '+
			'  cast(null as  varchar(100)) as Wholesaler , '+
             @SQLWHCol  + 
		    ' cast(0 as float) as [API Total Brand Sales], ' +
		    ' cast(0 as float) as [API Total Generic Sales], ' +
		    ' cast(0 as float) as [API Total OTC Sales], ' +
		    ' cast(0 as float) as [API TOTAL SALES], ' +	 
            @SQLCHCol +
		    ' cast(0 as float) as [CAH Total Brand Sales], ' +
		    ' cast(0 as float) as [CAH Total Src Generic Sales], ' +
		    ' cast(0 as float) as [CAH Total Other Sales], ' +
		    ' cast(0 as float) as [TOTAL CAH SALES], ' +
           @SQLMLCol +	 
		    ' cast(0 as float) as [ML Total Volume], ' +
           @SQLAndaCol +	 
		    ' cast(0 as float) as [Anda Total Volume], ' +
           @SQLCombCol    +
		   ' cast(0 as float) as [Total Combined Sales] ' ;

print @SQLCHCol;


 SET @SQL2 = ' FROM ( ' +
	         '  SELECT PMID,date, ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Brand'' as dateWAB,' +
		     ' sum(isnull(WHAPIBrand,0))as WHAPIBrand  , ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Generic'' as dateWAG, ' +
		     ' sum(isnull(WHAPIGeneric,0))as WHAPIGeneric , ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' OTC'' as dateWAO, '+
		     ' sum(isnull(WHAPIOTC,0))as WHAPIOTC  , ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Total Whse'' as dateWAT, '+
		     ' sum(isnull(WHAPITotal,0))as WHAPITotal , ' +
		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Brand''    AS dateCAB , '+
		     ' sum(isnull(AAPBrand,0)) as AAPBrand, '+
		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Src Generics''    AS dateSRCG , '+
		     ' sum(isnull(AAPGENTotalSrc,0)) as AAPGENTotalSrc, '+
		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Other Sales''    AS dateCOS , '+
		     ' sum(isnull(AAPNetSales ,0)) - sum(isnull(AAPBrand ,0))-sum(isnull(AAPGENTotalSrc,0)) as AAPOther, '+
		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Total Sales''    AS dateCTS , '+
		     ' sum(isnull(AAPNetSales,0)) as AAPNetSales, '+
		     '''ML ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Volume''    AS dateML , '+
		     ' sum(isnull(MLTotal,0)) as MLTotal, ' +
		     '''Anda ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Volume''    AS dateAnda , '+
		     ' sum(isnull(AndaTotal,0)) as AndaTotal ';
			IF(@isOneYear = 'N')
				BEGIN

       			   SET @SQL2 = @SQL2 +  ' FROM pharmacymaster..all_volume  where ( month(date) in ( ' +
					 @SQLMo_Prev_YR + ')'+
					 ' and year(date) = ' + @startYR ;
						IF(@pmid is not null)
						   BEGIN
							SET @SQL2 = @SQL2 +  '  and pmid in (' + @pmid + ')) ';
						   END
                         ELSE
							BEGIN
								SET @SQL2 = @SQL2 + ')'
							END
					 SET @SQL2 = @SQL2 + '	 or (month(date) in ( ' +
					 @SQLMo_Curr_YR + ')' +
					 ' and year(date) =  ' + @endYR ;
                     IF(@pmid is not null)
						   BEGIN
							SET @SQL2 = @SQL2 +  '  and pmid in (' + @pmid + ')) ';
						   END    
                      ELSE
							BEGIN
								SET @SQL2 = @SQL2 + ')'
							END      
					  SET @SQL2 = @SQL2 + ' group by PMID ,date ' +
					 ' ) as TableDate ';
				END
           ELSE 
				BEGIN
					SET @SQL2 = @SQL2 +  ' FROM pharmacymaster..all_volume  where ( month(date) in ( ' +
					 @SQLMo_Curr_YR + ')'+
					 ' and year(date) = ' + @startYR ;
                     IF(@pmid is not null)
                       BEGIN
						SET @SQL2 = @SQL2 +  '  and pmid in (' + @pmid + ')) ';
                       END
                      ELSE
							BEGIN
								SET @SQL2 = @SQL2 + ')'
							END
					 SET @SQL2 = @SQL2 +  ' group by PMID ,date ' +
					 ' ) as TableDate ';
				END


	SET @SQL2 = @SQL2  + ' PIVOT ' +
	' ( '+
	' SUM(WHAPIBrand) ' +
	' FOR dateWAB IN  ( ' + @SQLWHBrand + ')' + 
	' ) as P1 ' +
	' PIVOT ' +
	' ( '+
	' SUM(WHAPIGeneric) ' +
	'  FOR dateWAG IN  ( ' + @SQLWHGen + ')' +  
	' ) as P2 ' +
	' PIVOT ' + 
	' ( '+
	'  SUM(WHAPIOTC) ' + 
	'  FOR dateWAO IN ( ' +  @SQLWHOTC + ')' +  
	' )as P3 '+
	' PIVOT ' +  
	' ( '+
	'  SUM(WHAPITotal)  ' + 
	'  FOR dateWAT IN ( ' +  @SQLWHTotal + ')' +
	' )as P4 '+
	' PIVOT ' +  
	' ( '+
	'  SUM(AAPBrand) '+
	'  FOR dateCAB IN  ( ' + @SQLCHBrand + ')' +
	' )as P5 '+

	' PIVOT ' +  
	' ( '+
	'  SUM(AAPGENTotalSrc) '+
	'  FOR dateSRCG IN ( ' +  @SQLCHGenTotSrc + ')' + 
	' )as P6 '+

	' PIVOT ' +  
	' ( '+
	'   SUM(AAPOther)   '+
	'  FOR dateCOS IN  ( ' + @SQLCHOther + ')' + 
	' )as P7  '+

	' PIVOT ' +  
	' ( '+
	'  SUM(AAPNetSales)  '+
	'  FOR dateCTS IN  ( ' +  @SQLCHTotal + ')' +   
	' )as P8 '+

	' PIVOT ' +  
	' ( '+
	' SUM(MLTotal) '+
	' FOR dateML IN  ( ' +  @SQLMLTOtal + ')' +    
	' )as P9 '+

	' PIVOT ' +  
	' ( '+
	' SUM(AndaTotal) '+
	' FOR dateAnda IN  ( ' +  @SQLAndaTOtal + ')' +    
	' )as P10 '+

	' group by PMID  '+

    ' )vol ';
print @sql2

EXEC (@SQL + @SQL2)

-- Set where null to zero so we can do  totals
-- Set Warehouse columns to zero where null
	WHILE @startWHCount2 < @mo_between
	BEGIN
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@startWHCount2,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw_pmid SET [API ' + @varWHDate +  ' Brand] = 0.0 where    [API ' +@varWHDate + ' Brand] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw_pmid SET [API ' + @varWHDate +  ' Generic] = 0.0 where  [API ' + @varWHDate + ' Generic] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw_pmid SET [API ' + @varWHDate +  ' OTC] = 0.0 where [API ' +@varWHDate + ' OTC]  is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw_pmid SET [API ' + @varWHDate +  ' Total Whse]= 0.0 where [API ' + @varWHDate + ' Total Whse] is null ';
        Exec (@SQLToZero);

		SET @startWHCount2 = @startWHCount2 + 1;
	END
-- Set CH columns to zero where null
	WHILE @startCHCount2 < @mo_between
	BEGIN
		SET @varCHDate2 =  dbo.fDate2(DATEADD(m,@startCHCount2,@startDate));
        SET @varCHDate =  dbo.fDate1(DATEADD(m,@startCHCount2,@startDate));
		-- Changed these next 4 to use @varCHDate
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw_pmid SET [CAH ' + @varCHDate + ' AAP Brand] = 0.0 where  [CAH ' + @varCHDate + ' AAP Brand] is null';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw_pmid SET [CAH ' + @varCHDate + ' AAP Src Generics] = 0.0 where [CAH ' + @varCHDate + ' AAP Src Generics] is null';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw_pmid SET [CAH ' + @varCHDate + ' AAP Other Sales] = 0.0 where [CAH ' + @varCHDate + ' AAP Other Sales] is null';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw_pmid SET [CAH ' + @varCHDate + ' AAP Total Sales] = 0.0 where [CAH ' + @varCHDate + ' AAP Total Sales] is null';
        Exec (@SQLToZero);

		SET @startCHCount2  = @startCHCount2 + 1;
    END

-- Set ML Columns to zero where null
	WHILE @startMLCount2 < @mo_between
	BEGIN
		SET @varMLDate =  dbo.fDate1(DATEADD(m,@startMLCount2,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw_pmid SET [ML ' + @varMLDate + ' Volume]  = 0.0 where  [ML ' + @varMLDate + ' Volume] is null';
        Exec (@SQLToZero);
	    SET @startMLCount2  = @startMLCount2 + 1;
    END


-- Set Anda Columns to zero where null
	WHILE @startAndaCount2 < @mo_between
	BEGIN
		SET @varAndaDate =  dbo.fDate1(DATEADD(m,@startAndaCount2,@startDate));
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw_pmid SET [Anda ' + @varAndaDate + ' Volume]  = 0.0 where  [Anda ' + @varAndaDate + ' Volume] is null';
        Exec (@SQLToZero);
	    SET @startAndaCount2  = @startAndaCount2 + 1;
    END
 
--Update the totals now
	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw_pmid set [API Total Brand Sales] = ' + @SQLWHBrandTotal;
     Exec (@SQLUpdateTotal);
	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw_pmid set [API Total Generic Sales] = ' + @SQLWHGenTotal;
     Exec (@SQLUpdateTotal);
     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw_pmid set [API Total OTC Sales] = ' + @SQLWHOTCTotal;
     Exec (@SQLUpdateTotal);
     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw_pmid set [API Total Sales] = ' + @SQLWHTotalTotal;
     Exec (@SQLUpdateTotal);

	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw_pmid set [CAH Total Brand Sales] = ' + @SQLCHBrandTotal;
     Exec (@SQLUpdateTotal);
	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw_pmid set [CAH Total Src Generic Sales] = ' + @SQLCHGenTotSrcTotal;
     Exec (@SQLUpdateTotal);
     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw_pmid set [CAH Total Other Sales] = ' + @SQLCHOtherTotal;
     Exec (@SQLUpdateTotal);
     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw_pmid set [TOTAL CAH SALES] = ' + @SQLCHTotalTotal;
     Exec (@SQLUpdateTotal);

     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw_pmid set [ML Total Volume] = ' + @SQLMLTOtalTotal;
     Exec (@SQLUpdateTotal);

     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw_pmid set [Anda Total Volume] = ' + @SQLAndaTOtalTotal;
     Exec (@SQLUpdateTotal);

     UPDATE tmp_RCVol_jmw_pmid set  [Total Combined Sales] = [API Total Sales] +  [TOTAL CAH SALES] + [ML Total Volume] + [Anda Total Volume];

--Update Monthly Combined Totals for WH
   	WHILE @startWHCountComb < @mo_between
	BEGIN
		SET  @varCombDate = dbo.fDate1(DATEADD(m,@startWHCountComb,@startDate));
		SET @SQLUpdateTotal = ' UPDATE  tmp_RCVol_jmw_pmid set [Total ' + @varCombDate +  ' Combined Mthly Sales] =  [Total ' + @varCombDate +  ' Combined Mthly Sales] + [API ' + @varCombDate + ' Total Whse] ';
        Exec (@SQLUpdateTotal);
		SET @startWHCountComb = @startWHCountComb + 1;
	END

--Update Monthly Combined Totals for CAH
	WHILE @startCHCountComb < @mo_between
	BEGIN
		SET @varCHDate =  dbo.fDate1(DATEADD(m,@startCHCountComb,@startDate));
		SET @varCHDate2 =  dbo.fDate2(DATEADD(m,@startCHCountComb,@startDate));
		--Changed the last one to use @varCHDate instead of @varCHDate2
        SET @SQLUpdateTotal = ' UPDATE  tmp_RCVol_jmw_pmid set [Total ' + @varCHDate +  ' Combined Mthly Sales] =  [Total ' + @varCHDate +  ' Combined Mthly Sales] +   [CAH ' + @varCHDate + ' AAP Total Sales]';
        Exec (@SQLUpdateTotal);
		SET @startCHCountComb  = @startCHCountComb + 1;
    END
--Update Monthly Combined Totals for ML

	WHILE @startMLCountComb < @mo_between
	BEGIN
		SET @varMLDate =  dbo.fDate1(DATEADD(m,@startMLCountComb,@startDate));
        SET @SQLUpdateTotal = ' UPDATE  tmp_RCVol_jmw_pmid set [Total ' + @varMLDate +  ' Combined Mthly Sales] =  [Total ' + @varMLDate +  ' Combined Mthly Sales] +  [ML ' + @varMLDate + ' Volume]';
        Exec (@SQLUpdateTotal);
	    SET @startMLCountComb  = @startMLCountComb + 1;
    END

--Update Monthly Combined Totals for Anda

	WHILE @startAndaCountComb < @mo_between
	BEGIN
		SET @varAndaDate =  dbo.fDate1(DATEADD(m,@startAndaCountComb,@startDate));
        SET @SQLUpdateTotal = ' UPDATE  tmp_RCVol_jmw_pmid set [Total ' + @varAndaDate +  ' Combined Mthly Sales] =  [Total ' + @varAndaDate +  ' Combined Mthly Sales] +  [Anda ' + @varAndaDate + ' Volume]';
        Exec (@SQLUpdateTotal);
	    SET @startAndaCountComb  = @startAndaCountComb + 1;
    END



BEGIN
--Delete these PMID's - don't know if need to - but Bruce did so I did -- DO THIS AFTER QA - easier to QA with this in
	--   DELETE FROM tmp_RCVol_jmw_pmid  where pmid = 900000 or pmid < 99

	DELETE FROM tmp_RCVol_jmw_pmid where  [Total Combined Sales] = 0;
END
-- Now update all the other stuff
BEGIN
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
		[Account Corporate Name] = p.[corporatename],
		[Address] = p.Addr1,
		City = p.City, 
		ST = p.State ,
		Contact = (select case when ownername is null then 
			(select distinct contactfullname from pharmacymaster..v_Address_Mailing_Financials where pharmacymaster..v_Address_Mailing_Financials.pmid=p.pmid) 
			else ownername end ) ,
		 [Whse Acct Date Opened] = CONVERT(VARCHAR(10), p.dateopened, 101) ,
		Status = p.APIStatus ,
		Wholesaler = case when w.vendor is null then 'CH' else w.vendor end    
	FROM tmp_RCVol_jmw_pmid v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid

-- Now build the table where we group by territory for totals
END
BEGIN

	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_RCVol_jmw_pmid_TM')
	 BEGIN
      DROP TABLE tmp_RCVol_jmw_pmid_TM
     END

	SET @SQL = ' SELECT * into tmp_RCVol_jmw_pmid_TM from ( ' +
				'    SELECT TM, ' + @SQLWHColSelect +
				' SUM([API Total Brand Sales]) as  [API Total Brand Sales],' +
				' SUM([API Total Generic Sales]) as  [API Total Generic Sales],' +
				' SUM([API Total OTC Sales]) as  [API Total OTC Sales],' +
				' SUM([API TOTAL SALES]) as  [API TOTAL SALES],' ;
	SET @SQL2 = @SQLCHColSelect +
				' SUM([CAH Total Brand Sales]) as  [CAH Total Brand Sales],' + 
				' SUM([CAH Total Src Generic Sales]) as  [CAH Total Src Generic Sales],' + 
				' SUM([CAH Total Other Sales]) as  [CAH Total Other Sales],' + 
				' SUM([TOTAL CAH SALES]) as  [TOTAL CAH SALES],' + 
		        @SQLMLColSelect +
                ' SUM([ML Total Volume]) as  [ML Total Volume],' +
				@SQLAndaColSelect +
                ' SUM([Anda Total Volume]) as  [Anda Total Volume],';
	SET @SQL3 = @SQLCombColSelect + 
				' SUM([Total Combined Sales]) as  [Total Combined Sales] '+
                ' from tmp_RCVol_jmw_pmid group by TM ) vol ';

	EXEC (@SQL + @SQL2 + @SQL3)
END
END








GO
