USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_ReportCardVolume_Rolling_DYN_backup_20191209]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/14/2010>
-- Description:	Create table for Report Card for Wayne
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_ReportCardVolume_Rolling_DYN_backup_20191209]

		@ch_endDate varchar(10)
		, @wh_endDate varchar(10) 

AS
BEGIN

	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @chStartMonth varchar(2);
    DECLARE @whStartMonth varchar(2);
	DECLARE @startCHCount int;
	DECLARE @startWHCount int;
    --DECLARE @startMLCount int; --Removed by LA 2/9/2018 per Wayne's Request
    DECLARE @startCombCount int;

	DECLARE @startCHCount2 int;
	DECLARE @startWHCount2 int;
    DECLARE @startMLCount2 int;
    DECLARE @startCombCount2 int;

	DECLARE @startCHCountComb int;
	DECLARE @startWHCountComb int;
    --DECLARE @startMLCountComb int; --Removed by LA 2/9/2018 per Wayne's Request
    DECLARE @startCombCountComb int;

    DECLARE @SQL varchar(max);
    DECLARE @SQL2 varchar(max);
    DECLARE @SQL3 varchar(max);


    DECLARE @SQLWHCol varchar(max);
    DECLARE @SQLCHCol varchar(max);
    --DECLARE @SQLMLCol varchar(max); --Removed by LA 2/9/2018 per Wayne's Request
    DECLARE @SQLCombCol varchar(max);

	DECLARE @SQLWHBrand varchar(max);
	DECLARE @SQLWHGen varchar(max);
	DECLARE @SQLWHOTC varchar(max);
	DECLARE @SQLWHSalesTier1 varchar(max); -- Added by RSE 08/14/2019
	DECLARE @SQLWHSalesTier2 varchar(max); -- Added by RSE 08/14/2019
	DECLARE @SQLWHTotal varchar(max);

	DECLARE @SQLWHBrandTotal varchar(max);
	DECLARE @SQLWHGenTotal varchar(max);
	DECLARE @SQLWHOTCTotal varchar(max);
	DECLARE @SQLTier1Total varchar(max); -- Added by RSE 08/14/2019
	DECLARE @SQLTier2Total varchar(max); -- Added by RSE 08/14/2019
	DECLARE @SQLWHTotalTotal varchar(max);

	DECLARE @SQLCHBrand varchar(max);
	DECLARE @SQLCHNewBrand varchar(max);
	DECLARE @SQLCHGenTotSrc varchar(max);
	DECLARE @SQLCHOther varchar(max);
	DECLARE @SQLCHTotal varchar(max);

--AAPTotalRX
--AAPExcludedFromTotalRX
--AAPNonRXOTCandHH
--AAPSourceCompliance
    DECLARE @SQLCHTotalRX varchar(max);
	DECLARE @SQLCHOtherRX varchar(max);
	DECLARE @SQLCHExcludedFromTotalRX varchar(max);
	DECLARE @SQLCHNonRXOTCandHH varchar(max);
	DECLARE @SQLCHSourceCompliance varchar(max);

--    DECLARE @SQLCHGenExcl varchar(max); -- NEW

   -- DECLARE @SQLMLTOtal varchar(max); --Removed by LA 2/9/2018 per Wayne's Request

	DECLARE @SQLCHBrandTotal varchar(max);
	DECLARE @SQLCHNewBrandTotal varchar(max);
	DECLARE @SQLCHGenTotSrcTotal varchar(max);
	DECLARE @SQLCHOtherTotal varchar(max);
	DECLARE @SQLCHTotalTotal varchar(max);
--	DECLARE @SQLCHGenExclTotal varchar(max); -- NEW
	DECLARE @SQLCHOtherRxTotal varchar(max);
    DECLARE @SQLCHTotalRXTotal varchar(max);
	DECLARE @SQLCHExcludedFromTotalRXTotal varchar(max);
	DECLARE @SQLCHNonRXOTCandHHTotal varchar(max);
	DECLARE @SQLCHSourceComplianceTotal varchar(max);


	--DECLARE @SQLMLTOtalTotal varchar(max); --Removed by LA 2/9/2018 per Wayne's Request

	DECLARE @SQLToZero varchar(max);
    DECLARE @SQLUpdateTotal varchar(max);
	DECLARE @SQLAllCol varchar(max);

	--Used to create select statement for the By Territory
	DECLARE @SQLWHColSelect varchar(max);
	DECLARE @SQLCHColSelect varchar(max);
    --DECLARE @SQLMLColSelect varchar(max); --Removed by LA 2/9/2018 per Wayne's Request
    DECLARE @SQLCombColSelect varchar(max);


  

    DECLARE @varWHDate varchar(20);
    DECLARE @varCHDate varchar(20);
    DECLARE @varCHDate2 varchar(20);
    --DECLARE @varMLDate varchar(20); --Removed by LA 2/9/2018 per Wayne's Request
    DECLARE @varCombDate varchar(20);
    DECLARE @startCHDate varchar(10);
    DECLARE @mo_currYR_start int;
    DECLARE @SQLMo_Curr_YR varchar(50);
    DECLARE @SQLMo_Prev_YR varchar(50);
	DECLARE @SQLMo_Next_YR varchar(50);
    DECLARE @mo_prevYR_start int;
    DECLARE @wh_startYR varchar(50);
    DECLARE @wh_prevYR varchar(50);
    DECLARE @varWh_PrevYrDate  varchar(12);
    DECLARE @mo_prevYR_end int;

    DECLARE @ch_startYR varchar(50);
    DECLARE @ch_prevYR varchar(50);

    SET @wh_startYR = year(@wh_endDate);
    SET @wh_prevYR = @wh_startYR -1;

    SET @ch_startYR = year(@ch_endDate);
    SET @ch_prevYR = @ch_startYR -1;
  
    SET @SQLWHCol = '';
    SET @SQLCHCol = '';
    --SET @SQLMLCol = ''; --Removed by LA 2/9/2018 per Wayne's Request
    SET @SQLCombCol = '';

	SET @SQLWHBrand = '';  
	SET @SQLWHGen = '';  
	SET @SQLWHOTC = '';
	SET @SQLWHSalesTier1 = '' --Added RSE 08/14/2019
	SET @SQLWHSalesTier2 = '' --Added RSE 08/14/2019
	SET @SQLWHTotal = '';
	SET @SQLCHBrand = '';
	SET @SQLCHNewBrand = '';  
	SET @SQLCHGenTotSrc = '';
--    SET @SQLCHGenExcl = ''; -- NEW

	SET @SQLCHTotalRX = '';
	SET @SQLCHOtherRX = '';
	SET @SQLCHExcludedFromTotalRX = '';  
	SET @SQLCHNonRXOTCandHH = '';  
	SET @SQLCHSourceCompliance = '';  



	SET @SQLCHOther  = '';
	SET @SQLCHTotal = '';
	--SET @SQLMLTOtal  = ''; --Removed by LA 2/9/2018 per Wayne's Request

	SET @SQLWHBrandTotal = '';  
	SET @SQLWHGenTotal = '';  
	SET @SQLWHOTCTotal = '';
	SET @SQLTier1Total = ''; -- Added RSE 08/15/2019
	SET @SQLTier2Total = ''; -- Added RSE 08/15/2019
	SET @SQLWHTotalTotal = '';
	SET @SQLCHBrandTotal = '';
	SET @SQLCHNewBrandTotal = '';
	SET @SQLCHGenTotSrcTotal = '';
--    SET @SQLCHGenExclTotal = ''; -- NEW
	SET @SQLCHTotalRXTotal = '';  
	SET @SQLCHOtherRxTotal = ''; 
	SET @SQLCHExcludedFromTotalRXTotal = '';  
	SET @SQLCHNonRXOTCandHHTotal = '';  
	SET @SQLCHSourceComplianceTotal = '';  

	SET @SQLCHOtherTotal  = '';
	SET @SQLCHTotalTotal = '';
	--SET @SQLMLTOtalTotal  = ''; --Removed by LA 2/9/2018 per Wayne's Request
	SET @SQLUpdateTotal = '';
	SET @SQLAllCol = '';

	SET @SQLWHColSelect = '';
	SET @SQLCHColSelect = '';
    --SET @SQLMLColSelect = ''; --Removed by LA 2/9/2018 per Wayne's Request
    SET @SQLCombColSelect = '';

 

	SET @chStartMonth = cast(month(@ch_endDate) as varchar(2)); -- Because start month and end month are the same we can you the endate month
	SET @whStartMonth = cast(month(@wh_endDate) as varchar(2)); -- Because start month and end month are the same we can you the endate month
	SET @startCHCount = -12;  
    --SET @startMLCount = -12; --Removed by LA 2/9/2018 per Wayne's Request
	SET @startWHCount = -12;
    --- Here if the dates are the same we will span 13 months
    IF(@ch_endDate = @wh_endDate)
		BEGIN
			 SET @startCombCount = -12;  --- Here if the dates are the same we will span 13 months
		END
    ELSE
		BEGIN
			SET @startCombCount = -13;  --- Here if the dates are the same we will span 14 months
		END
	SET @startCHCount2 = -12;  
   -- SET @startMLCount2 = -12; --Removed by LA 2/9/2018 per Wayne's Request
	SET @startWHCount2 = -12;
   --- Here if the dates are the same we will span 13 months
    IF(@ch_endDate = @wh_endDate)
		BEGIN
			 SET @startCombCount2 = -12;  --- Here if the dates are the same we will span 13 months
		END
    ELSE
		BEGIN
			SET @startCombCount2 = -13;  --- Here if the dates are the same we will span 14 months
		END


	SET @startCHCountComb = -12;  
   -- SET @startMLCountComb = -12; --Removed by LA 2/9/2018 per Wayne's Request
	SET @startWHCountComb = -12;
      --- Here if the dates are the same we will span 13 months
    IF(@ch_endDate = @wh_endDate)
		BEGIN
			 SET @startCombCountComb = -12;  --- Here if the dates are the same we will span 13 months
		END
    ELSE
		BEGIN
			SET @startCombCountComb = -13;  --- Here if the dates are the same we will span 14 months
		END

  --  SET @startCHDate = '01/01/' + cast(year(@ch_endDate) as varchar(4)); -- FYTD so start at 01/01 of whatever year
    SET @SQLMo_Curr_YR = '';
    SET @SQLMo_Prev_YR = '';
    SET @mo_currYR_start = 1;

     
    SET @mo_prevYR_start = month(@ch_endDate); -- Here we use the ch becuase it will always be the earliest
    SET @mo_prevYR_end  = 12;
 
  
    -- Build the API WH Sales fields for 13 Months
	WHILE @startWHCount < 1
	BEGIN
		SET @varWHDate = dbo.fDate1(DATEADD(m,@startWHCount,@wh_endDate));
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Brand])  as [API ' +@varWHDate + ' Brand], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Generic])  as [API ' + @varWHDate + ' Generic], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' OTC])  as [API ' +@varWHDate + ' OTC], ';
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Tier 1])  as [API ' +@varWHDate + ' Tier 1], '; -- Added RSE 08/14/2019
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Tier 2])  as [API ' +@varWHDate + ' Tier 2], '; -- Added RSE 08/14/2019
		SET @SQLWHCol = @SQLWHCol +  ' MAX([API ' + @varWHDate +  ' Total Whse])  as [API ' + @varWHDate + ' Total Whse], ';
        
       	SET @SQLWHBrand = @SQLWHBrand + ' [API ' +@varWHDate + ' Brand], '; 
		SET @SQLWHGen = @SQLWHGen + ' [API ' + @varWHDate + ' Generic], ';  
		SET @SQLWHOTC = @SQLWHOTC + ' [API ' +@varWHDate + ' OTC], ';
		SET @SQLWHSalesTier1 = @SQLWHSalesTier1 + ' [API ' +@varWHDate + ' Tier 1], ';
		SET @SQLWHSalesTier2 = @SQLWHSalesTier2 + ' [API ' +@varWHDate + ' Tier 2], ';
		SET @SQLWHTotal = @SQLWHTotal + ' [API ' + @varWHDate + ' Total Whse], ';
		
		-- Used to calculate totals for Update below (way at bottom of code)
        SET @SQLWHBrandTotal = @SQLWHBrandTotal + ' [API ' +@varWHDate + ' Brand] + '; 
		SET @SQLWHGenTotal = @SQLWHGenTotal + ' [API ' + @varWHDate + ' Generic] + ';  
		SET @SQLWHOTCTotal = @SQLWHOTCTotal + ' [API ' +@varWHDate + ' OTC] + ';
		SET @SQLTier1Total = @SQLTier1Total + ' [API ' +@varWHDate + ' Tier 1] + '; -- Added RSE 08/14/2019
		SET @SQLTier2Total = @SQLTier2Total + ' [API ' +@varWHDate + ' Tier 2] + '; --Added RSE 08/14/2019
		SET @SQLWHTotalTotal = @SQLWHTotalTotal + ' [API ' + @varWHDate + ' Total Whse] + ';

		-- Used to create select statement for By Territory
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varWHDate +  ' Brand])  as [API ' +@varWHDate + ' Brand], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varWHDate +  ' Generic])  as [API ' + @varWHDate + ' Generic], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varWHDate +  ' OTC])  as [API ' +@varWHDate + ' OTC], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varWHDate +  ' Tier 1])  as [API ' +@varWHDate + ' Tier 1], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varWHDate +  ' Tier 2])  as [API ' +@varWHDate + ' Tier 2], ';
		SET @SQLWHColSelect = @SQLWHColSelect +  ' Sum([API ' + @varWHDate +  ' Total Whse])  as [API ' + @varWHDate + ' Total Whse], ';

    	SET @startWHCount = @startWHCount + 1;
	END
   -- Now take of trailing comma
       SET @SQLWHBrand = substring(@SQLWHBrand,0,len(@SQLWHBrand) );
       SET @SQLWHGen = substring(@SQLWHGen,0,len(@SQLWHGen) );
       SET @SQLWHOTC = substring(@SQLWHOTC,0,len(@SQLWHOTC) );
	   SET @SQLWHSalesTier1 = substring(@SQLWHSalesTier1,0,len(@SQLWHSalesTier1) );
	   SET @SQLWHSalesTier2 = substring(@SQLWHSalesTier2,0,len(@SQLWHSalesTier2) );
       SET @SQLWHTotal = substring(@SQLWHTotal,0,len(@SQLWHTotal) );

       SET @SQLWHBrandTotal = substring(@SQLWHBrandTotal,0,len(@SQLWHBrandTotal) );
       SET @SQLWHGenTotal = substring(@SQLWHGenTotal,0,len(@SQLWHGenTotal) );
       SET @SQLWHOTCTotal = substring(@SQLWHOTCTotal,0,len(@SQLWHOTCTotal) );
	   SET @SQLTier1Total = substring(@SQLTier1Total,0,len(@SQLTier1Total) );
	   SET @SQLTier2Total = substring(@SQLTier2Total,0,len(@SQLTier2Total) );
       SET @SQLWHTotalTotal = substring(@SQLWHTotalTotal,0,len(@SQLWHTotalTotal) );
   
   -- Loop through months - for 13 months - Cardinal
	WHILE @startCHCount < 1 
	BEGIN
		SET @varCHDate = dbo.fDate1(DATEADD(m,@startCHCount,@ch_endDate));
		SET @varCHDate2 = dbo.fDate2(DATEADD(m,@startCHCount,@ch_endDate));
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Brand])  as [CAH ' + @varCHDate + ' AAP Brand],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH New ' + @varCHDate + ' AAP Brand])  as [CAH New ' + @varCHDate + ' AAP Brand],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Src Generics])  as [CAH ' + @varCHDate + ' AAP Src Generics],';
--   		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Excluded Generics])  as [CAH ' + @varCHDate + ' AAP Excluded Generics],'; --NEW

		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Other Sales])  as [CAH ' + @varCHDate + ' AAP Other Sales],';

-- Put new here

		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Total RX])  as [CAH ' + @varCHDate + ' AAP Total RX],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' Other RX])  as [CAH ' + @varCHDate + ' Other RX],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Excluded from Total RX])  as [CAH ' + @varCHDate + ' AAP Excluded from Total RX],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP NonRX - OTC&HH])  as [CAH ' + @varCHDate + ' AAP NonRX - OTC&HH],';
		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Source Compliance])  as [CAH ' + @varCHDate + ' AAP Source Compliance],';

--End new

		SET @SQLCHCol = @SQLCHCol + ' MAX([CAH ' + @varCHDate + ' AAP Total Sales])  as [CAH ' + @varCHDate + ' AAP Total Sales],';


       
		SET @SQLCHBrand = @SQLCHBrand + ' [CAH ' + @varCHDate + ' AAP Brand],';
		SET @SQLCHNewBrand = @SQLCHNewBrand + ' [CAH New ' + @varCHDate + ' AAP Brand],';
		SET @SQLCHGenTotSrc = @SQLCHGenTotSrc + ' [CAH ' + @varCHDate + ' AAP Src Generics],';
		SET @SQLCHOther  = @SQLCHOther + '[CAH ' + @varCHDate + ' AAP Other Sales],';

--Put New here 
		SET @SQLCHTotalRX  = @SQLCHTotalRX + '[CAH ' + @varCHDate + ' AAP Total RX],';
		SET @SQLCHOtherRX  = @SQLCHOtherRX + '[CAH ' + @varCHDate + ' Other RX],';
		SET @SQLCHExcludedFromTotalRX  = @SQLCHExcludedFromTotalRX + '[CAH ' + @varCHDate + ' AAP Excluded from Total RX],';
		SET @SQLCHNonRXOTCandHH  = @SQLCHNonRXOTCandHH + '[CAH ' + @varCHDate + ' AAP NonRX - OTC&HH],';
		SET @SQLCHSourceCompliance  = @SQLCHSourceCompliance + '[CAH ' + @varCHDate + ' AAP Source Compliance],';

--End new


		SET @SQLCHTotal = @SQLCHTotal + ' [CAH ' + @varCHDate + ' AAP Total Sales],'; 

		-- Used to calculate totals for Update below (way at bottom of code)
		SET @SQLCHBrandTotal = @SQLCHBrandTotal + ' [CAH ' + @varCHDate + ' AAP Brand] + ';
		SET @SQLCHNewBrandTotal = @SQLCHNewBrandTotal + ' [CAH New ' + @varCHDate + ' AAP Brand] + ';
		SET @SQLCHGenTotSrcTotal = @SQLCHGenTotSrcTotal + ' [CAH ' + @varCHDate + ' AAP Src Generics] +';
--		SET @SQLCHGenExclTotal = @SQLCHGenExclTotal + ' [CAH ' + @varCHDate + ' AAP Excluded Generics] +'; -- NEW

		SET @SQLCHOtherTotal  = @SQLCHOtherTotal + '[CAH ' + @varCHDate + ' AAP Other Sales] + ';

--Put new here
		SET @SQLCHTotalRXTotal = @SQLCHTotalRXTotal + ' [CAH ' + @varCHDate + ' AAP Total RX] + ';
		SET @SQLCHOtherRxTotal = @SQLCHOtherRxTotal + ' [CAH ' + @varCHDate + ' Other RX] + ';
		SET @SQLCHExcludedFromTotalRXTotal = @SQLCHExcludedFromTotalRXTotal + ' [CAH ' + @varCHDate + ' AAP Excluded from Total RX] + ';
		SET @SQLCHNonRXOTCandHHTotal = @SQLCHNonRXOTCandHHTotal + ' [CAH ' + @varCHDate + ' AAP NonRX - OTC&HH] + ';
--  Did not put Source Compliance in  totals

--End new 
		SET @SQLCHTotalTotal = @SQLCHTotalTotal + ' [CAH ' + @varCHDate + ' AAP Total Sales] + '; 

        --Used to select By Territory

		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Brand])  as [CAH ' + @varCHDate + ' AAP Brand],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH New ' + @varCHDate + ' AAP Brand])  as [CAH New ' + @varCHDate + ' AAP Brand],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Src Generics])  as [CAH ' + @varCHDate + ' AAP Src Generics],';
--		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Excluded Generics])  as [CAH ' + @varCHDate + ' AAP Excluded Generics],'; --NEW

		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Other Sales])  as [CAH ' + @varCHDate + ' AAP Other Sales],';
--Put New here
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Total RX])  as [CAH ' + @varCHDate + ' AAP Total RX],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' Other RX])  as [CAH ' + @varCHDate + ' Other RX],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Excluded from Total RX])  as [CAH ' + @varCHDate + ' AAP Excluded from Total RX],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP NonRX - OTC&HH])  as [CAH ' + @varCHDate + ' AAP NonRX - OTC&HH],';
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Source Compliance])  as [CAH ' + @varCHDate + ' AAP Source Compliance],';

--End New
		SET @SQLCHColSelect = @SQLCHColSelect + ' Sum([CAH ' + @varCHDate + ' AAP Total Sales])  as [CAH ' + @varCHDate + ' AAP Total Sales],';
 
		SET @startCHCount  = @startCHCount + 1;
    END
   -- Now take of trailing comma (not for the columns though)
       SET @SQLCHBrand = substring(@SQLCHBrand,0,len(@SQLCHBrand) );
	   SET @SQLCHNewBrand = substring(@SQLCHNewBrand,0,len(@SQLCHNewBrand) );
       SET @SQLCHGenTotSrc = substring(@SQLCHGenTotSrc,0,len(@SQLCHGenTotSrc) );
--       SET @SQLCHGenExcl = substring(@SQLCHGenExcl,0,len(@SQLCHGenExcl) ); --NEW

       SET @SQLCHOther = substring(@SQLCHOther,0,len(@SQLCHOther) );
--Put New here
	   SET @SQLCHTotalRX = substring(@SQLCHTotalRX,0,len(@SQLCHTotalRX) );
	   SET @SQLCHOtherRX = substring(@SQLCHOtherRX,0,len(@SQLCHOtherRX) );
	   SET @SQLCHExcludedFromTotalRX = substring(@SQLCHExcludedFromTotalRX,0,len(@SQLCHExcludedFromTotalRX) );
	   SET @SQLCHNonRXOTCandHH  = substring(@SQLCHNonRXOTCandHH ,0,len(@SQLCHNonRXOTCandHH ) );
	   SET @SQLCHSourceCompliance  = substring(@SQLCHSourceCompliance ,0,len(@SQLCHSourceCompliance ) );

--End New
       SET @SQLCHTotal = substring(@SQLCHTotal,0,len(@SQLCHTotal) );

       SET @SQLCHBrandTotal = substring(@SQLCHBrandTotal,0,len(@SQLCHBrandTotal) );
	   SET @SQLCHNewBrandTotal = substring(@SQLCHNewBrandTotal,0,len(@SQLCHNewBrandTotal) );
       SET @SQLCHGenTotSrcTotal = substring(@SQLCHGenTotSrcTotal,0,len(@SQLCHGenTotSrcTotal) );
--       SET @SQLCHGenExclTotal = substring(@SQLCHGenExclTotal,0,len(@SQLCHGenExclTotal) ); --NEW

       SET @SQLCHOtherTotal = substring(@SQLCHOtherTotal,0,len(@SQLCHOtherTotal) );

--Put New Here
	   SET @SQLCHTotalRXTotal = substring(@SQLCHTotalRXTotal,0,len(@SQLCHTotalRXTotal) );
	   SET @SQLCHOtherRxTotal = substring(@SQLCHOtherRxTotal,0,len(@SQLCHOtherRxTotal) );
	   SET @SQLCHExcludedFromTotalRXTotal = substring(@SQLCHExcludedFromTotalRXTotal,0,len(@SQLCHExcludedFromTotalRXTotal) );
	   SET @SQLCHNonRXOTCandHHTotal  = substring(@SQLCHNonRXOTCandHHTotal ,0,len(@SQLCHNonRXOTCandHHTotal ) );
	  -- SET @SQLCHSourceComplianceTotal  = substring(@SQLCHSourceComplianceTotal ,0,len(@SQLCHSourceComplianceTotal ) );
--End New
       SET @SQLCHTotalTotal = substring(@SQLCHTotalTotal,0,len(@SQLCHTotalTotal) );

     -- Loop through months - Start at 1 - this is for ML Volume YTD

	 /* --Removed by LA 2/9/2018 per Wayne's Request
	WHILE @startMLCount < 1 
	BEGIN
		SET @varMLDate =  dbo.fDate1(DATEADD(m,@startMLCount,@ch_endDate));
		SET @SQLMLCol = @SQLMLCol + ' MAX([ML ' + @varMLDate + ' Volume]) as [ML ' + @varMLDate + ' Volume],';
      	SET @SQLMLTOtal  = @SQLMLTOtal + ' [ML ' + @varMLDate + ' Volume],';
        SET @SQLMLTOtalTotal  = @SQLMLTOtalTotal + ' [ML ' + @varMLDate + ' Volume] + ';
		SET @SQLMLColSelect = @SQLMLColSelect + ' Sum([ML ' + @varMLDate + ' Volume]) as [ML ' + @varMLDate + ' Volume],';
  

	    SET @startMLCount  = @startMLCount + 1;
    END
       -- Now take of trailing comma (not for the columns though)
       SET @SQLMLTOtal = substring(@SQLMLTOtal,0,len(@SQLMLTOtal) );
       SET @SQLMLTOtalTotal = substring(@SQLMLTOtalTotal,0,len(@SQLMLTOtalTotal) );

	*/

    --- Loop through Months to build the Combined Mnthly Sales -this uses range of WH Sales as this is the greater

	WHILE @startCombCount < 1
	BEGIN
		SET  @varCombDate = dbo.fDate1(DATEADD(m,@startCombCount,@wh_endDate));
		SET @SQLCombCol = @SQLCombCol +  ' cast(0 as float) as [Total ' + @varCombDate +  ' Combined Mthly Sales], ';
        SET @SQLCombColSelect = @SQLCombColSelect + ' Sum([Total ' + @varCombDate + ' Combined Mthly Sales]) as [Total ' + @varCombDate + ' Combined Mthly Sales],';
		SET @startCombCount = @startCombCount + 1;
	END


     -- Loop through months in current year to tell which ones we need to select
     -- Here is the API month is 1 we need to use the ch_enddate because API rolls into next year (there is a 2 year span) 
	-- We also need another QSQL to pull the - what I will call the Next year

    IF (month(@wh_endDate) = 1 and month(@ch_endDate) != 1  )
		BEGIN
			WHILE @mo_currYR_start < = month(@ch_endDate)
			BEGIN
			  SET @SQLMo_Curr_YR = @SQLMo_Curr_YR + cast(@mo_currYR_start as varchar(2)) + ',';
			  SET @mo_currYR_start = @mo_currYR_start + 1;
			END 
			-- Take off the last comma
			SET @SQLMo_Curr_YR = substring(@SQLMo_Curr_YR,0,len(@SQLMo_Curr_YR) );
			SET @SQLMo_Next_YR = '01';
		END
    ELSE
       BEGIN
			WHILE @mo_currYR_start < = month(@wh_endDate)
			BEGIN
			  SET @SQLMo_Curr_YR = @SQLMo_Curr_YR + cast(@mo_currYR_start as varchar(2)) + ',';
			  SET @mo_currYR_start = @mo_currYR_start + 1;
			END 
			-- Take off the last comma
			SET @SQLMo_Curr_YR = substring(@SQLMo_Curr_YR,0,len(@SQLMo_Curr_YR) );
		END


   --Loop through months in previous years - not using the commented out version - I realized the start month was same as the month of the @wh_endDate passed in
       
 
	WHILE @mo_prevYR_start < = @mo_prevYR_end
	BEGIN
		SET @SQLMo_Prev_YR = @SQLMo_Prev_YR + cast(@mo_prevYR_start as varchar(2)) + ','
		SET @mo_prevYR_start = @mo_prevYR_start + 1;
	END 
	-- Take off the last comma
	SET @SQLMo_Prev_YR = substring(@SQLMo_Prev_YR,0,len(@SQLMo_Prev_YR) )

  

	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_RCVol_jmw')
	 BEGIN
      DROP TABLE tmp_RCVol_jmw
     END

--- Here is where the fun begins

 SET @SQL = 'SELECT * INTO tmp_RCVol_jmw from ( ' +
	        '  SELECT  cast('''' as varchar(10)) as TM , '+
            ' PMID, ' +  
			'  cast(null as varchar(20)) as AAP# , '+
			'  cast(null as varchar(20)) as Parent# , '+
	        ' cast(null as varchar(25)) as Group# ,' +
			'  cast(null as varchar(20)) as API# , '+
			'  cast(null as varchar(10)) as [AAP Eff] , '+
			'  cast(null as varchar(10)) as [AAP Quit] , '+
            --'  cast(null as varchar(10)) as [AAP Elite] , '+ --removed by LA on 2/9/2018 per Wayne's request
			--'  cast(null as varchar(10)) as [AAP Elite Termed] , '+ --removed by LA on 2/9/2018 per Wayne's request
			'  cast(null as  varchar(200)) as Description , '+
			'  cast(null as  varchar(200)) as Affiliate , '+
            ' cast(null as varchar(20)) as [ChainCode] ,  '+
			'  cast(null as  varchar(100)) as [Account DBA Name] , '+
			'  cast(null as  varchar(100)) as [Account Corporate Name] , '+
			'  cast(null as  varchar(100)) as [Software] , '+
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
			' cast(0 as float) as [API Total Tier 1 Sales], ' +
			' cast(0 as float) as [API Total Tier 2 Sales], ' +
		    ' cast(0 as float) as [API Total OTC Sales], ' +
		    ' cast(0 as float) as [API TOTAL SALES], ' +	 
            @SQLCHCol +
		    ' cast(0 as float) as [CAH Total Brand Sales], ' +
			' cast(0 as float) as [CAH Total New Brand Sales], ' +
		    ' cast(0 as float) as [CAH Total Src Generic Sales], ' +
--            ' cast(0 as float) as [CAH Total Excluded Generic Sales], ' + --NEW
		    ' cast(0 as float) as [CAH Total Other Sales], ' +
-- Put New here
            ' cast(0 as float) as [CAH Total Total RX], ' +
			' cast(0 as float) as [CAH Total Other RX], ' +
			' cast(0 as float) as [CAH Total Excluded from Total RX], ' +
			' cast(0 as float) as [CAH Total NonRX - OTC&HH], ' +
			--' cast(0 as float) as [CAH Total Source Compliance], ' +
--End new
		    ' cast(0 as float) as [CAH TOTAL SALES], ' +
           --@SQLMLCol +	 --Removed by LA 2/9/2018 per Wayne's Request
		    --' cast(0 as float) as [ML TOTAL SALES], ' + --Removed by LA 2/9/2018 per Wayne's Request
           @SQLCombCol    +
		   ' cast(0 as float) as [TOTAL COMBINED SALES] ' ;

print @SQL


 SET @SQL2 = ' FROM ( ' +
	         '  SELECT PMID,date, ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Brand'' as dateWAB,' +
		     ' sum(isnull(WHAPIBrand,0))as WHAPIBrand  , ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Generic'' as dateWAG, ' +
		     ' sum(isnull(WHAPIGeneric,0))as WHAPIGeneric , ' +
		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' OTC'' as dateWAO, '+
		     ' sum(isnull(WHAPIOTC,0))as WHAPIOTC  , ' +

			  '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Tier 1'' as dateSalesTier1, '+
		     ' sum(isnull(APIGenericSalesTier1,0))as APIGenericSalesTier1  , ' +
			  '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Tier 2'' as dateSalesTier2, '+
		     ' sum(isnull(APIGenericSalesTier2,0))as APIGenericSalesTier2  , ' +

		     '''API '' + SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Total Whse'' as dateWAT, '+
		     ' sum(isnull(WHAPITotal,0))as WHAPITotal , ' +


		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Brand''    AS dateCAB , '+
		     ' sum(isnull(AAPBrand,0)) as AAPBrand, '+
			 '''CAH New ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Brand''    AS dateCANB , '+
 	       ' sum(isnull(AAPBrand ,0)) - sum(isnull(AAPExcludedFromTotalRX ,0)) as AAPNewBrand, '+
		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Src Generics''    AS dateSRCG , '+
		     ' sum(isnull(AAPGENTotalSrc,0)) as AAPGENTotalSrc, '+

--			 '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Excluded Generics''    AS dateEXCG , '+ --NEW
--		     ' sum(isnull(AAPGenExcl,0)) as AAPGenExcl, '+ --NEW

		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Other Sales''    AS dateCOS , '+
 	       ' sum(isnull(AAPNetSales ,0)) - sum(isnull(AAPBrand ,0))-sum(isnull(AAPGENTotalSrc,0)) as AAPOther, '+
--		     ' sum(isnull(AAPNetSales ,0)) - sum(isnull(AAPBrand ,0))-sum(isnull(AAPGENTotalSrc,0)) -  sum(isnull(AAPGenExcl,0)) as AAPOther, '+ --NEW
-- Put new here
 
           '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Total RX''    AS dateTRX , '+
		     ' sum(isnull(AAPTotalRX,0)) as AAPTotalRX, '+

		   '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Other Rx''    AS dateORX , '+
 	       ' sum(isnull(AAPTotalRX ,0)) - sum(isnull(AAPBrand ,0))-sum(isnull(AAPGENTotalSrc,0)) as CAHOtherRx, '+

		   '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Excluded from Total RX''    AS dateETRX , '+
		     ' sum(isnull(AAPExcludedFromTotalRX,0)) as AAPExcludedFromTotalRX, '+

		   '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP NonRX - OTC&HH''    AS dateNROH , '+
		     ' sum(isnull(AAPNonRXOTCandHH,0)) as AAPNonRXOTCandHH, '+

		   '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Source Compliance''    AS dateSC , '+
		     ' max(isnull(AAPSourceCompliance,0)) as AAPSourceCompliance, '+
--End new
		     '''CAH ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' AAP Total Sales''    AS dateCTS , '+
		     ' sum(isnull(AAPNetSales,0)) as AAPNetSales'+
		     --'''ML ''+ SUBSTRING(CONVERT(VARCHAR(9), date, 6), 4, 6) + '' Volume''    AS dateML , '+ --Removed by LA 2/9/2018 per Wayne's Request
		     --' sum(isnull(MLTotal,0)) as MLTotal '+ --Removed by LA 2/9/2018 per Wayne's Request

       	     ' FROM pharmacymaster.dbo.vw_ReportCardVolume  where ( month(date) in ( ' +
             @SQLMo_Curr_YR + ')'+
             ' and year(date) = ' + @ch_startYR + ') '+ 
			 '	 or (month(date) in ( ' +
	         @SQLMo_Prev_YR + ')' +
		     ' and year(date) =  ' + @ch_prevYR + ')' ;
		 IF (month(@wh_endDate) = 1 and month(@ch_endDate) != 1  )
			BEGIN 
				SET @SQL2 = @SQL2  +
				 '	 or (month(date) in ( ' +
				 @SQLMo_Next_YR + ')' +
				 ' and year(date) =  ' + @wh_startYR + ')' ;
             END           
			SET @SQL2 = @SQL2  + ' group by PMID ,date ' +
	         ' ) as TableDate ' +


	' PIVOT ' +
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
	'  SUM(APIGenericSalesTier1) ' + 
	'  FOR dateSalesTier1 IN ( ' +  @SQLWHSalesTier1 + ')' +  --Added RSE 08/14/2019
	' )as P15 '+

	 'PIVOT ' + 
	' ( '+
	'  SUM(APIGenericSalesTier2) ' + 
	'  FOR dateSalesTier2 IN ( ' +  @SQLWHSalesTier2 + ')' +  --Added RSE 08/14/2019
	' )as P16 '+

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
	'  SUM(AAPNewBrand) '+
	'  FOR dateCANB IN  ( ' + @SQLCHNewBrand + ')' +
	' )as P6 '+

	' PIVOT ' +  
	' ( '+
	'  SUM(AAPGENTotalSrc) '+
	'  FOR dateSRCG IN ( ' +  @SQLCHGenTotSrc + ')' + 
	' )as P7 '+

--    ' PIVOT ' +  --NEW
--	' ( '+
--	'  SUM(AAPGenExcl) '+
--	'  FOR dateEXCG IN ( ' +  @SQLCHGenExcl + ')' + 
--	' )as P6a '+  --NEW

	' PIVOT ' +  
	' ( '+
	'  SUM(AAPOther)  '+
	'  FOR dateCOS IN  ( ' + @SQLCHOther + ')' + 
	' )as P8  '+
-- Put new here

	' PIVOT ' +  
	' ( '+
	'  SUM(AAPTotalRX)  '+
	'  FOR dateTRX IN  ( ' + @SQLCHTotalRX + ')' + 
	' )as P9  '+

	' PIVOT ' +  
	' ( '+
	'  SUM(CAHOtherRX)  '+
	'  FOR dateORX IN  ( ' + @SQLCHOtherRX + ')' + 
	' )as P10  '+

	' PIVOT ' +  
	' ( '+
	'  SUM(AAPExcludedFromTotalRX)  '+
	'  FOR dateETRX IN  ( ' + @SQLCHExcludedFromTotalRX   + ')' + 
	' )as P11  '+

	' PIVOT ' +  
	' ( '+
	'  SUM(AAPNonRXOTCandHH)  '+
	'  FOR dateNROH IN  ( ' + @SQLCHNonRXOTCandHH  + ')' + 
	' )as P12  '+

	' PIVOT ' +  
	' ( '+
	'  MAX(AAPSourceCompliance)  '+
	'  FOR dateSC IN  ( ' + @SQLCHSourceCompliance  + ')' + 
	' )as P13  '+


	' PIVOT ' +  
	' ( '+
	'  SUM(AAPNetSales)  '+
	'  FOR dateCTS IN  ( ' +  @SQLCHTotal + ')' +   
	' )as P14 '+
/* --Removed by LA 2/9/2018 per Wayne's Request
	' PIVOT ' +  
	' ( '+
	' SUM(MLTotal) '+
	' FOR dateML IN  ( ' +  @SQLMLTOtal + ')' +    
	' )as P15 '+
*/
	' group by PMID  '+

    ' )vol ';
print @sql2

EXEC (@SQL + @SQL2)

-- Set where null to zero so we can do  totals
-- Set Warehouse columns to zero where null
	WHILE @startWHCount2 < 1
	BEGIN
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@startWHCount2,@wh_endDate));
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [API ' + @varWHDate +  ' Brand] = 0.0 where    [API ' +@varWHDate + ' Brand] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [API ' + @varWHDate +  ' Generic] = 0.0 where  [API ' + @varWHDate + ' Generic] is null ';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [API ' + @varWHDate +  ' OTC] = 0.0 where [API ' +@varWHDate + ' OTC]  is null ';
        Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [API ' + @varWHDate +  ' Tier 1] = 0.0 where [API ' +@varWHDate + ' Tier 1]  is null ';
        Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [API ' + @varWHDate +  ' Tier 2] = 0.0 where [API ' +@varWHDate + ' Tier 2]  is null ';
        Exec (@SQLToZero);


		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [API ' + @varWHDate +  ' Total Whse]= 0.0 where [API ' + @varWHDate + ' Total Whse] is null ';
        Exec (@SQLToZero);

		SET @startWHCount2 = @startWHCount2 + 1;
	END
-- Set CH columns to zero where null
	WHILE @startCHCount2 < 1
	BEGIN
		SET @varCHDate2 =  dbo.fDate1(DATEADD(m,@startCHCount2,@ch_endDate));
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH ' + @varCHDate2 + ' AAP Brand] = 0.0 where  [CAH ' + @varCHDate2 + ' AAP Brand] is null';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH New ' + @varCHDate2 + ' AAP Brand] = 0.0 where  [CAH New ' + @varCHDate2 + ' AAP Brand] is null';
        Exec (@SQLToZero);
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH ' + @varCHDate2 + ' AAP Src Generics] = 0.0 where [CAH ' + @varCHDate2 + ' AAP Src Generics] is null';
        Exec (@SQLToZero);

--		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH ' + @varCHDate2 + ' AAP Excluded Generics] = 0.0 where [CAH ' + @varCHDate2 + ' AAP Excluded Generics] is null'; --NEW
--        Exec (@SQLToZero); --NEW

		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH ' + @varCHDate2 + ' AAP Other Sales] = 0.0 where [CAH ' + @varCHDate2 + ' AAP Other Sales] is null';
        Exec (@SQLToZero);
--Put new here
	   SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH ' + @varCHDate2 + ' AAP Total RX] = 0.0 where [CAH ' + @varCHDate2 + ' AAP Total RX] is null';
        Exec (@SQLToZero);

		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH ' + @varCHDate2 + ' Other RX] = 0.0 where [CAH ' + @varCHDate2 + ' Other RX] is null';
        Exec (@SQLToZero);

	  SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH ' + @varCHDate2 + ' AAP Excluded from Total RX] = 0.0 where [CAH ' + @varCHDate2 + ' AAP Excluded from Total RX] is null';
        Exec (@SQLToZero);

	  SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH ' + @varCHDate2 + ' AAP NonRX - OTC&HH] = 0.0 where [CAH ' + @varCHDate2 + ' AAP NonRX - OTC&HH] is null';
        Exec (@SQLToZero);

	  SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH ' + @varCHDate2 + ' AAP Source Compliance] = 0.0 where [CAH ' + @varCHDate2 + ' AAP Source Compliance] is null';
        Exec (@SQLToZero);

--End new 
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [CAH ' + @varCHDate2 + ' AAP Total Sales] = 0.0 where [CAH ' + @varCHDate2 + ' AAP Total Sales] is null';
        Exec (@SQLToZero);

		SET @startCHCount2  = @startCHCount2 + 1;
    END

-- Set ML Columns to zero where null
/* --Removed by LA 2/9/2018 per Wayne's Request
	WHILE @startMLCount2 < 1
	BEGIN
		SET @varMLDate =  dbo.fDate1(DATEADD(m,@startMLCount2,@ch_endDate));
		SET @SQLToZero = ' UPDATE tmp_RCVol_jmw SET [ML ' + @varMLDate + ' Volume]  = 0.0 where  [ML ' + @varMLDate + ' Volume] is null';
        Exec (@SQLToZero);
	    SET @startMLCount2  = @startMLCount2 + 1;
    END
*/
 
--Update the totals now
	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [API Total Brand Sales] = ' + @SQLWHBrandTotal;
     Exec (@SQLUpdateTotal);

	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [API Total Generic Sales] = ' + @SQLWHGenTotal;
     Exec (@SQLUpdateTotal);

     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [API Total OTC Sales] = ' + @SQLWHOTCTotal;
     Exec (@SQLUpdateTotal);

	 --Tier 1
	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [API Total Tier 1 Sales] = ' + @SQLTier1Total;
     Exec (@SQLUpdateTotal);

	 --Tier 2
	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [API Total Tier 2 Sales] = ' + @SQLTier2Total;
     Exec (@SQLUpdateTotal);


     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [API Total Sales] = ' + @SQLWHTotalTotal;
     Exec (@SQLUpdateTotal);

	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [CAH Total Brand Sales] = ' + @SQLCHBrandTotal;
     Exec (@SQLUpdateTotal);

	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [CAH Total New Brand Sales] = ' + @SQLCHNewBrandTotal;
     Exec (@SQLUpdateTotal);

	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [CAH Total Src Generic Sales] = ' + @SQLCHGenTotSrcTotal;
     Exec (@SQLUpdateTotal);
--
--	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [CAH Total Excluded Generic Sales] = ' + @SQLCHGenExclTotal; --NEW
--     Exec (@SQLUpdateTotal);

     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [CAH Total Other Sales] = ' + @SQLCHOtherTotal;
     Exec (@SQLUpdateTotal);

--Put new here
     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [CAH Total Total RX] = ' + @SQLCHTotalRXTotal;
     Exec (@SQLUpdateTotal);

	 SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [CAH Total Other RX] = ' + @SQLCHOtherRxTotal;
     Exec (@SQLUpdateTotal);

    SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [CAH Total Excluded from Total RX] = ' + @SQLCHExcludedFromTotalRXTotal;
     Exec (@SQLUpdateTotal);

   SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [CAH Total NonRX - OTC&HH] = ' + @SQLCHNonRXOTCandHHTotal;
     Exec (@SQLUpdateTotal);
-- No Source Compliance Total
--End new
     SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [CAH TOTAL SALES] = ' + @SQLCHTotalTotal;
     Exec (@SQLUpdateTotal);

     --SET @SQLUpdateTotal = ' UPDATE tmp_RCVol_jmw set [ML TOTAL SALES] = ' + @SQLMLTOtalTotal; --Removed by LA 2/9/2018 per Wayne's Request
     --Exec (@SQLUpdateTotal);

     --UPDATE tmp_RCVol_jmw set  [TOTAL COMBINED SALES] = [API Total Sales] +  [CAH TOTAL SALES] + [ML TOTAL SALES]; --Removed by LA 2/9/2018 per Wayne's Request
	 UPDATE tmp_RCVol_jmw set  [TOTAL COMBINED SALES] = [API Total Sales] +  [CAH TOTAL SALES];

--Update Monthly Combined Totals for WH
   	WHILE @startWHCountComb < 1
	BEGIN
		SET  @varCombDate = dbo.fDate1(DATEADD(m,@startWHCountComb,@wh_endDate));
		SET @SQLUpdateTotal = ' UPDATE  tmp_RCVol_jmw set [Total ' + @varCombDate +  ' Combined Mthly Sales] =  [Total ' + @varCombDate +  ' Combined Mthly Sales] + [API ' + @varCombDate + ' Total Whse] ';
        Exec (@SQLUpdateTotal);
		SET @startWHCountComb = @startWHCountComb + 1;
	END

--Update Monthly Combined Totals for CAH
	WHILE @startCHCountComb < 1
	BEGIN
		SET @varCHDate =  dbo.fDate1(DATEADD(m,@startCHCountComb,@ch_endDate));
		--SET @varCHDate2 =  dbo.fDate2(DATEADD(m,@startCHCountComb,@ch_endDate));
        SET @SQLUpdateTotal = ' UPDATE  tmp_RCVol_jmw set [Total ' + @varCHDate +  ' Combined Mthly Sales] =  [Total ' + @varCHDate +  ' Combined Mthly Sales] +   [CAH ' + @varCHDate + ' AAP Total Sales]';
        Exec (@SQLUpdateTotal);
		SET @startCHCountComb  = @startCHCountComb + 1;
    END
--Update Monthly Combined Totals for ML
/* --Removed by LA 2/9/2018 per Wayne's Request
	WHILE @startMLCountComb < 1
	BEGIN
		SET @varMLDate =  dbo.fDate1(DATEADD(m,@startMLCountComb,@ch_endDate));
        SET @SQLUpdateTotal = ' UPDATE  tmp_RCVol_jmw set [Total ' + @varMLDate +  ' Combined Mthly Sales] =  [Total ' + @varMLDate +  ' Combined Mthly Sales] +  [ML ' + @varMLDate + ' Volume]';
        Exec (@SQLUpdateTotal);
	    SET @startMLCountComb  = @startMLCountComb + 1;
    END
*/

BEGIN
--Delete these PMID's - don't know if need to - but Bruce did so I did -- DO THIS AFTER QA - easier to QA with this in

	 IF EXISTS(SELECT name 
				FROM sys.tables
				WHERE name = 'tmp_RCVol_jmw_BD'
				)
	 BEGIN

      DROP TABLE tmp_RCVol_jmw_BD

     END

      SELECT * into tmp_RCVol_jmw_BD 
	  from tmp_RCVol_jmw;

	  DELETE 
	  FROM tmp_RCVol_jmw  
	  where pmid = 900000 or pmid < 99
  
	 -- DELETE FROM tmp_RCVol_jmw where  [TOTAL COMBINED SALES] = 0;
      --DELETE FROM tmp_RCVol_jmw where [API TOTAL SALES] = 0 and [CAH TOTAL SALES] = 0 and [ML TOTAL SALES] = 0; --Removed by LA 2/9/2018 per Wayne's Request
	  DELETE 
	  FROM tmp_RCVol_jmw 
	  where [API TOTAL SALES] = 0 and [CAH TOTAL SALES] = 0;
END
-- Now update all the other stuff
BEGIN
	UPDATE v set
		TM = p.territory  ,
		[AAP#] = p.aapaccountno,
		[Parent#] = p.aapparentno ,
		[Group#] = p.Groupno ,
		[API#] = p.apiaccountno ,
		[AAP Eff] =    CONVERT(VARCHAR(10), p.AAPEffectiveDate, 101) ,
		[AAP Quit] =   CONVERT(VARCHAR(10), p.AAPQuitDate, 101),
        --[AAP Elite] =   CONVERT(VARCHAR(10), mp.startdate, 101), --removed by LA on 2/9/2018 per Wayne's request
		--[AAP Elite Termed] =   CONVERT(VARCHAR(10), mp.enddate, 101), --removed by LA on 2/9/2018 per Wayne's request
		[Description] = p.AccountDescription ,
		Affiliate = p.Affiliate,
		[Account DBA Name] = p.[accountname],
		[Account Corporate Name] = p.[corporatename],
        [Software] = s.software,
		[Address] = p.Addr1,
        ChainCode = case when p.mcquitdate is null and p.chaincode is not null and p.aapquitdate is  null then p.chaincode else null end ,
		City = p.City, 
		ST = p.State ,
		Contact = (select case when ownername is null then 
			(select distinct contactfullname from pharmacymaster..v_Address_Mailing_Financials where pharmacymaster..v_Address_Mailing_Financials.pmid=p.pmid) 
			else ownername end ) ,
		 [Whse Acct Date Opened] = CONVERT(VARCHAR(10), p.dateopened, 101) ,
		Status = p.APIStatus ,
		Wholesaler = case when w.vendor is null then 'CH' else w.vendor end   
        
	FROM tmp_RCVol_jmw v
	left join pharmacymaster..v_PM_AllWithAffiliates p on v.pmid=p.pmid
	left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid
    left join  pharmacymaster..software s on p.computersoftware = s.id
    left outer join
	(
		select pmid,startdate,enddate from pharmacymaster..pm_memberprograms where programid = 184  
	) mp
	on v.pmid = mp.pmid
 

-- Now build the table where we group by territory for totals
END
BEGIN

	 IF EXISTS(SELECT name FROM sys.tables
		 WHERE name = 'tmp_RCVol_jmw_TM')
	 BEGIN
      DROP TABLE tmp_RCVol_jmw_TM
     END

--------------Here we need to add code to figure out the quarterly values - Wayne only wants full quarters - so this is going to be a trick

    DECLARE @whQ1PrevStartDate varchar(20);
    DECLARE @cahQ1PrevStartDate varchar(20);

    DECLARE @whQ2PrevStartDate varchar(20);
    DECLARE @cahQ2PrevStartDate varchar(20);

    DECLARE @whQ3PrevStartDate varchar(20);
    DECLARE @cahQ3PrevStartDate varchar(20);

    DECLARE @whQ4PrevStartDate varchar(20);
    DECLARE @cahQ4PrevStartDate varchar(20);


    DECLARE @whQ1CurrStartDate varchar(20);
    DECLARE @cahQ1CurrStartDate varchar(20);

    DECLARE @whQ2CurrStartDate varchar(20);
    DECLARE @cahQ2CurrStartDate varchar(20);

    DECLARE @whQ3CurrStartDate varchar(20);
    DECLARE @cahQ3CurrStartDate varchar(20);

    DECLARE @whQ4CurrStartDate varchar(20);
    DECLARE @cahQ4CurrStartDate varchar(20);

    DECLARE @mo_Count int;
	DECLARE @varWHDate2 varchar(20);
	DECLARE @varWHDate3 varchar(20);
	DECLARE @varCHDate3 varchar(20);

	--  For WH
    DECLARE @QSQLWHColQuarter varchar(max);
    SET @QSQLWHColQuarter = '';

	--  For CAH
    DECLARE @QSQLCAHColQuarter varchar(max);
    SET @QSQLCAHColQuarter = '';


	--  For ML
    --DECLARE @QSQLMLColQuarter varchar(max); --Removed by LA 2/9/2018 per Wayne's Request
    --SET @QSQLMLColQuarter = '';

	--  For All Quarters

    DECLARE @SQLAllQuarterCol varchar(max);
    SET @SQLAllQuarterCol = '';

    DECLARE @SQLAllQuarter varchar(max);
    SET @SQLAllQuarter = '';

    SET @whQ1PrevStartDate =  @whStartMonth   + '/01/' + cast(@wh_prevYR as varchar(4))
    SET @cahQ1PrevStartDate =  @chStartMonth   + '/01/' + cast(@ch_prevYR as varchar(4))
    --- Q1 Prev
	IF(@whStartMonth = 1)
      BEGIN
		SET @mo_Count = 0
		--Q1 Prev WH
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@mo_Count,@whQ1PrevStartDate));
        SET  @varWHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@whQ1PrevStartDate));
        SET  @varWHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@whQ1PrevStartDate));

		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Brand])  +  Sum([API ' + @varWHDate2 +  ' Brand]) +  Sum([API ' + @varWHDate3 +  ' Brand]) as [API Q1 ' + @wh_prevYR + ' Brand] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Generic]) +  Sum([API ' + @varWHDate2 +  ' Generic]) +  Sum([API ' + @varWHDate3 +  ' Generic]) as [API Q1 ' + @wh_prevYR + ' Generic] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' OTC])  +  Sum([API ' + @varWHDate2 +  ' OTC]) +  Sum([API ' + @varWHDate3 +  ' OTC]) as [API Q1 ' + @wh_prevYR + ' OTC] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 1])  +  Sum([API ' + @varWHDate2 +  ' Tier 1]) +  Sum([API ' + @varWHDate3 +  ' Tier 1]) as [API Q1 ' + @wh_prevYR + ' Tier 1] , '; -- Added RSE 08/14/2019
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 2])  +  Sum([API ' + @varWHDate2 +  ' Tier 2]) +  Sum([API ' + @varWHDate3 +  ' Tier 2]) as [API Q1 ' + @wh_prevYR + ' Tier 2] , '; -- Added RSE 08/14/2019
    	SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Total Whse])   +  Sum([API ' + @varWHDate2 +  ' Total Whse]) +  Sum([API ' + @varWHDate3 +  ' Total Whse]) as [API Q1 ' + @wh_prevYR + ' Total Whse] , ';
 
	  END 

	IF(@chStartMonth = 1)
      BEGIN	
		SET @mo_Count = 0
		--Q1 Prev CAH
		SET  @varCHDate = dbo.fDate1(DATEADD(m,@mo_Count,@cahQ1PrevStartDate));
        SET  @varCHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@cahQ1PrevStartDate));
        SET  @varCHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@cahQ1PrevStartDate));

    	SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Brand]) + Sum([CAH ' + @varCHDate2 + ' AAP Brand]) + Sum([CAH ' + @varCHDate3 + ' AAP Brand]) as [CAH Q1 ' + @ch_prevYR + ' AAP Brand] , ';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Src Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Src Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Src Generics]) as [CAH Q1 ' + @ch_prevYR + ' AAP Src Generics],';

--		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded Generics]) as [CAH Q1 ' + @ch_prevYR + ' AAP Excluded Generics],'; --NEW

		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Other Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Other Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Other Sales]) as [CAH Q1 ' + @ch_prevYR + ' AAP Other Sales],';

-- Put new here
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Total RX]) as [CAH Q1 ' + @ch_prevYR + ' AAP Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded from Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded from Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded from Total RX]) as [CAH Q1 ' + @ch_prevYR + ' AAP Excluded from Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP NonRX - OTC&HH])  +  Sum([CAH ' + @varCHDate2 + ' AAP NonRX - OTC&HH]) + Sum([CAH ' + @varCHDate3 + ' AAP NonRX - OTC&HH]) as [CAH Q1 ' + @ch_prevYR + ' AAP NonRX - OTC&HH],';
		-- No Source Compliance
--End new
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Total Sales]) as [CAH Q1 ' + @ch_prevYR + ' AAP Total Sales],';

      -- Q1 Prev ML --Removed by LA 2/9/2018 per Wayne's Request
        --SET @QSQLMLColQuarter = @QSQLMLColQuarter + ' Sum([ML ' + @varCHDate + ' Volume]) +  Sum([ML ' + @varCHDate2 + ' Volume]) +  Sum([ML ' + @varCHDate3 + ' Volume]) as [ML Q1 ' + @ch_prevYR + '],';
	END

    -- Q2 Prev
	IF(@whStartMonth = 1 or @whStartMonth = 2 or @whStartMonth = 3 or @whStartMonth = 4)
      BEGIN
        SET @whQ2PrevStartDate = '04/01/' + cast(@wh_prevYR as varchar(4))
		SET @mo_Count = 0
		--Q2 Prev WH
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@mo_Count,@whQ2PrevStartDate));
        SET  @varWHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@whQ2PrevStartDate));
        SET  @varWHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@whQ2PrevStartDate));
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Brand])  +  Sum([API ' + @varWHDate2 +  ' Brand]) +  Sum([API ' + @varWHDate3 +  ' Brand]) as [API Q2 ' + @wh_prevYR + ' Brand] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Generic]) +  Sum([API ' + @varWHDate2 +  ' Generic]) +  Sum([API ' + @varWHDate3 +  ' Generic]) as [API Q2 ' + @wh_prevYR + ' Generic] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' OTC])  +  Sum([API ' + @varWHDate2 +  ' OTC]) +  Sum([API ' + @varWHDate3 +  ' OTC]) as [API Q2 ' + @wh_prevYR + ' OTC] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 1])  +  Sum([API ' + @varWHDate2 +  ' Tier 1]) +  Sum([API ' + @varWHDate3 +  ' Tier 1]) as [API Q2 ' + @wh_prevYR + ' Tier 1] , '; --Added RSE 08/14/2019
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 2])  +  Sum([API ' + @varWHDate2 +  ' Tier 2]) +  Sum([API ' + @varWHDate3 +  ' Tier 2]) as [API Q2 ' + @wh_prevYR + ' Tier 2] , '; -- Added RSE 08/14/2019
    	SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Total Whse])   +  Sum([API ' + @varWHDate2 +  ' Total Whse]) +  Sum([API ' + @varWHDate3 +  ' Total Whse]) as [API Q2 ' + @wh_prevYR + ' Total Whse] , ';
	  END 

	IF(@chStartMonth = 1 or @chStartMonth = 2 or @chStartMonth = 3 or @chStartMonth = 4)
      BEGIN	

        SET @cahQ2PrevStartDate = '04/01/' + cast(@wh_prevYR as varchar(4))
		SET @mo_Count = 0
		--Q2 Prev CAH

		SET  @varCHDate = dbo.fDate1(DATEADD(m,@mo_Count,@cahQ2PrevStartDate));

        SET  @varCHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@cahQ2PrevStartDate));

        SET  @varCHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@cahQ2PrevStartDate));

    	SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Brand]) + Sum([CAH ' + @varCHDate2 + ' AAP Brand]) + Sum([CAH ' + @varCHDate3 + ' AAP Brand]) as [CAH Q2 ' + @ch_prevYR + ' AAP Brand] , ';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Src Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Src Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Src Generics]) as [CAH Q2 ' + @ch_prevYR + ' AAP Src Generics],';

--		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded Generics]) as [CAH Q2 ' + @ch_prevYR + ' AAP Excluded Generics],'; --NEW


		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Other Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Other Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Other Sales]) as [CAH Q2 ' + @ch_prevYR + ' AAP Other Sales],';

-- Put new here
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Total RX]) as [CAH Q2 ' + @ch_prevYR + ' AAP Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded from Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded from Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded from Total RX]) as [CAH Q2 ' + @ch_prevYR + ' AAP Excluded from Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP NonRX - OTC&HH])  +  Sum([CAH ' + @varCHDate2 + ' AAP NonRX - OTC&HH]) + Sum([CAH ' + @varCHDate3 + ' AAP NonRX - OTC&HH]) as [CAH Q2 ' + @ch_prevYR + ' AAP NonRX - OTC&HH],';
		-- No Source Compliance
--End new
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Total Sales]) as [CAH Q2 ' + @ch_prevYR + ' AAP Total Sales],';

      -- Q2 Prev ML --Removed by LA 2/9/2018 per Wayne's Request
        --SET @QSQLMLColQuarter = @QSQLMLColQuarter + ' Sum([ML ' + @varCHDate + ' Volume]) +  Sum([ML ' + @varCHDate2 + ' Volume]) +  Sum([ML ' + @varCHDate3 + ' Volume]) as [ML Q2 ' + @ch_prevYR + '],';
	END

---------------Q3 PRev
    -- Q3 Prev
	IF(@whStartMonth = 1 or @whStartMonth = 2 or @whStartMonth = 3 or @whStartMonth = 4 or @whStartMonth = 5 or @whStartMonth = 6 or @whStartMonth = 7)
      BEGIN
  
		SET  @whQ3PrevStartDate = '07/01/' + cast(@wh_prevYR as varchar(4));
 
		SET @mo_Count = 0
		--Q3 Prev WH
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@mo_Count,@whQ3PrevStartDate));
        SET  @varWHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@whQ3PrevStartDate));
        SET  @varWHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@whQ3PrevStartDate));
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Brand])  +  Sum([API ' + @varWHDate2 +  ' Brand]) +  Sum([API ' + @varWHDate3 +  ' Brand]) as [API Q3 ' + @wh_prevYR + ' Brand] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Generic]) +  Sum([API ' + @varWHDate2 +  ' Generic]) +  Sum([API ' + @varWHDate3 +  ' Generic]) as [API Q3 ' + @wh_prevYR + ' Generic] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' OTC])  +  Sum([API ' + @varWHDate2 +  ' OTC]) +  Sum([API ' + @varWHDate3 +  ' OTC]) as [API Q3 ' + @wh_prevYR + ' OTC] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 1])  +  Sum([API ' + @varWHDate2 +  ' Tier 1]) +  Sum([API ' + @varWHDate3 +  ' Tier 1]) as [API Q3 ' + @wh_prevYR + ' Tier 1] , ';  -- Added RSE 08/14/2019
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 2])  +  Sum([API ' + @varWHDate2 +  ' Tier 2]) +  Sum([API ' + @varWHDate3 +  ' Tier 2]) as [API Q3 ' + @wh_prevYR + ' Tier 2] , '; -- Added RSE 08/14/2019
    	SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Total Whse])   +  Sum([API ' + @varWHDate2 +  ' Total Whse]) +  Sum([API ' + @varWHDate3 +  ' Total Whse]) as [API Q3 ' + @wh_prevYR + ' Total Whse] , ';
	  END 

	IF(@chStartMonth = 1 or @chStartMonth = 2 or @chStartMonth = 3 or @chStartMonth = 4 or @chStartMonth = 5 or @chStartMonth = 6 or @chStartMonth = 7)
	BEGIN
        SET  @cahQ3PrevStartDate = '07/01/' + cast(@ch_prevYR as varchar(4));
		SET @mo_Count = 0
		--Q3 Prev CAH

		SET  @varCHDate = dbo.fDate1(DATEADD(m,@mo_Count,@cahQ3PrevStartDate));

        SET  @varCHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@cahQ3PrevStartDate));

        SET  @varCHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@cahQ3PrevStartDate));

    	SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Brand]) + Sum([CAH ' + @varCHDate2 + ' AAP Brand]) + Sum([CAH ' + @varCHDate3 + ' AAP Brand]) as [CAH Q3 ' + @ch_prevYR + ' AAP Brand] , ';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Src Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Src Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Src Generics]) as [CAH Q3 ' + @ch_prevYR + ' AAP Src Generics],';

--		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded Generics]) as [CAH Q3 ' + @ch_prevYR + ' AAP Excluded Generics],'; --NEW

		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Other Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Other Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Other Sales]) as [CAH Q3 ' + @ch_prevYR + ' AAP Other Sales],';

-- Put new here
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Total RX]) as [CAH Q3 ' + @ch_prevYR + ' AAP Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded from Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded from Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded from Total RX]) as [CAH Q3 ' + @ch_prevYR + ' AAP Excluded from Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP NonRX - OTC&HH])  +  Sum([CAH ' + @varCHDate2 + ' AAP NonRX - OTC&HH]) + Sum([CAH ' + @varCHDate3 + ' AAP NonRX - OTC&HH]) as [CAH Q3 ' + @ch_prevYR + ' AAP NonRX - OTC&HH],';
		-- No Source Compliance
--End new
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Total Sales]) as [CAH Q3 ' + @ch_prevYR + ' AAP Total Sales],';

      -- Q3 Prev ML --Removed by LA 2/9/2018 per Wayne's Request
        --SET @QSQLMLColQuarter = @QSQLMLColQuarter + ' Sum([ML ' + @varCHDate + ' Volume]) +  Sum([ML ' + @varCHDate2 + ' Volume]) +  Sum([ML ' + @varCHDate3 + ' Volume]) as [ML Q3 ' + @ch_prevYR + '],';
	END
-------------------------------- END Q3 Prev

---------------Q4 PRev
    -- Q4 Prev
	IF(@whStartMonth = 1 or @whStartMonth = 2 or @whStartMonth = 3 or @whStartMonth = 4 or @whStartMonth = 5 or @whStartMonth = 6 or @whStartMonth = 7 or @whStartMonth = 8 or @whStartMonth = 9 or @whStartMonth = 10)
      BEGIN
  
		SET  @whQ4PrevStartDate = '10/01/' + cast(@wh_prevYR as varchar(4));
 
		SET @mo_Count = 0
		--Q4 Prev WH
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@mo_Count,@whQ4PrevStartDate));
        SET  @varWHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@whQ4PrevStartDate));
        SET  @varWHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@whQ4PrevStartDate));
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Brand])  +  Sum([API ' + @varWHDate2 +  ' Brand]) +  Sum([API ' + @varWHDate3 +  ' Brand]) as [API Q4 ' + @wh_prevYR + ' Brand] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Generic]) +  Sum([API ' + @varWHDate2 +  ' Generic]) +  Sum([API ' + @varWHDate3 +  ' Generic]) as [API Q4 ' + @wh_prevYR + ' Generic] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' OTC])  +  Sum([API ' + @varWHDate2 +  ' OTC]) +  Sum([API ' + @varWHDate3 +  ' OTC]) as [API Q4 ' + @wh_prevYR + ' OTC] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 1])  +  Sum([API ' + @varWHDate2 +  ' Tier 1]) +  Sum([API ' + @varWHDate3 +  ' Tier 1]) as [API Q4 ' + @wh_prevYR + ' Tier 1] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 2])  +  Sum([API ' + @varWHDate2 +  ' Tier 2]) +  Sum([API ' + @varWHDate3 +  ' Tier 2]) as [API Q4 ' + @wh_prevYR + ' Tier 2] , ';
    	SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Total Whse])   +  Sum([API ' + @varWHDate2 +  ' Total Whse]) +  Sum([API ' + @varWHDate3 +  ' Total Whse]) as [API Q4 ' + @wh_prevYR + ' Total Whse] , ';
	  END 

	IF(@chStartMonth = 1 or @chStartMonth = 2 or @chStartMonth = 3 or @chStartMonth = 4 or @chStartMonth = 5 or @chStartMonth = 6 or @chStartMonth = 7 or @chStartMonth = 8 or @chStartMonth = 9 or @chStartMonth = 10)
	BEGIN
        SET @cahQ4PrevStartDate = '10/01/' + cast(@ch_prevYR as varchar(4));
		SET @mo_Count = 0
		--Q4 Prev CAH

		SET  @varCHDate = dbo.fDate1(DATEADD(m,@mo_Count,@cahQ4PrevStartDate));

        SET  @varCHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@cahQ4PrevStartDate));

        SET  @varCHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@cahQ4PrevStartDate));

    	SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Brand]) + Sum([CAH ' + @varCHDate2 + ' AAP Brand]) + Sum([CAH ' + @varCHDate3 + ' AAP Brand]) as [CAH Q4 ' + @ch_prevYR + ' AAP Brand] , ';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Src Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Src Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Src Generics]) as [CAH Q4 ' + @ch_prevYR + ' AAP Src Generics],';

--		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded Generics]) as [CAH Q4 ' + @ch_prevYR + ' AAP Excluded Generics],'; --NEW

		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Other Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Other Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Other Sales]) as [CAH Q4 ' + @ch_prevYR + ' AAP Other Sales],';

-- Put new here
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Total RX]) as [CAH Q4 ' + @ch_prevYR + ' AAP Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded from Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded from Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded from Total RX]) as [CAH Q4 ' + @ch_prevYR + ' AAP Excluded from Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP NonRX - OTC&HH])  +  Sum([CAH ' + @varCHDate2 + ' AAP NonRX - OTC&HH]) + Sum([CAH ' + @varCHDate3 + ' AAP NonRX - OTC&HH]) as [CAH Q4 ' + @ch_prevYR + ' AAP NonRX - OTC&HH],';
		-- No Source Compliance
--End new
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Total Sales]) as [CAH Q4 ' + @ch_prevYR + ' AAP Total Sales],';

      -- Q4 Prev ML --Removed by LA 2/9/2018 per Wayne's Request
        --SET @QSQLMLColQuarter = @QSQLMLColQuarter + ' Sum([ML ' + @varCHDate + ' Volume]) +  Sum([ML ' + @varCHDate2 + ' Volume]) +  Sum([ML ' + @varCHDate3 + ' Volume]) as [ML Q4 ' + @ch_prevYR + '],';
	END
-------------------------------- END Q4 Prev

---------------Q1 Curr
    -- Q1 Curr
	IF( @whStartMonth = 3 or @whStartMonth = 4 or @whStartMonth = 5 or @whStartMonth = 6 or @whStartMonth = 7 or @whStartMonth = 8 or @whStartMonth = 9 or @whStartMonth = 10 or @whStartMonth = 11 or @whStartMonth = 12)
      BEGIN
  
		SET  @whQ1CurrStartDate = '01/01/' + cast(@wh_startYR as varchar(4));
 
		SET @mo_Count = 0
		--Q1 Curr WH
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@mo_Count,@whQ1CurrStartDate));
        SET  @varWHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@whQ1CurrStartDate));
        SET  @varWHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@whQ1CurrStartDate));
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Brand])  +  Sum([API ' + @varWHDate2 +  ' Brand]) +  Sum([API ' + @varWHDate3 +  ' Brand]) as [API Q1 ' + @wh_startYR + ' Brand] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Generic]) +  Sum([API ' + @varWHDate2 +  ' Generic]) +  Sum([API ' + @varWHDate3 +  ' Generic]) as [API Q1 ' + @wh_startYR + ' Generic] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' OTC])  +  Sum([API ' + @varWHDate2 +  ' OTC]) +  Sum([API ' + @varWHDate3 +  ' OTC]) as [API Q1 ' + @wh_startYR + ' OTC] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 1])  +  Sum([API ' + @varWHDate2 +  ' Tier 1]) +  Sum([API ' + @varWHDate3 +  ' Tier 1]) as [API Q1 ' + @wh_startYR + ' Tier 1] , '; -- Added RSE 08/14/2019
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 2])  +  Sum([API ' + @varWHDate2 +  ' Tier 2]) +  Sum([API ' + @varWHDate3 +  ' Tier 2]) as [API Q1 ' + @wh_startYR + ' Tier 2] , '; -- Added RSE 08/14/2019
    	SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Total Whse])   +  Sum([API ' + @varWHDate2 +  ' Total Whse]) +  Sum([API ' + @varWHDate3 +  ' Total Whse]) as [API Q1 ' + @wh_startYR + ' Total Whse] , ';
	  END 

	IF( @chStartMonth = 3 or @chStartMonth = 4 or @chStartMonth = 5 or @chStartMonth = 6 or @chStartMonth = 7 or @chStartMonth = 8 or @chStartMonth = 9 or @chStartMonth = 10 or @chStartMonth = 11 or @chStartMonth = 12)
	BEGIN
        SET @cahQ1CurrStartDate = '01/01/' + cast(@ch_startYR as varchar(4));
		SET @mo_Count = 0
		--Q1 Curr CAH

		SET  @varCHDate = dbo.fDate1(DATEADD(m,@mo_Count,@cahQ1CurrStartDate));

        SET  @varCHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@cahQ1CurrStartDate));

        SET  @varCHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@cahQ1CurrStartDate));

    	SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Brand]) + Sum([CAH ' + @varCHDate2 + ' AAP Brand]) + Sum([CAH ' + @varCHDate3 + ' AAP Brand]) as [CAH Q1 ' + @ch_startYR + ' AAP Brand] , ';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Src Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Src Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Src Generics]) as [CAH Q1 ' + @ch_startYR + ' AAP Src Generics],';

--		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded Generics]) as [CAH Q1 ' + @ch_startYR + ' AAP Excluded Generics],'; --NEW

		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Other Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Other Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Other Sales]) as [CAH Q1 ' + @ch_startYR + ' AAP Other Sales],';

-- Put new here
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Total RX]) as [CAH Q1 ' + @ch_startYR + ' AAP Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded from Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded from Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded from Total RX]) as [CAH Q1 ' + @ch_startYR + ' AAP Excluded from Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP NonRX - OTC&HH])  +  Sum([CAH ' + @varCHDate2 + ' AAP NonRX - OTC&HH]) + Sum([CAH ' + @varCHDate3 + ' AAP NonRX - OTC&HH]) as [CAH Q1 ' + @ch_startYR + ' AAP NonRX - OTC&HH],';
		-- No Source Compliance
--End new
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Total Sales]) as [CAH Q1 ' + @ch_startYR + ' AAP Total Sales],';

      -- Q1 Curr ML --Removed by LA 2/9/2018 per Wayne's Request
        --SET @QSQLMLColQuarter = @QSQLMLColQuarter + ' Sum([ML ' + @varCHDate + ' Volume]) +  Sum([ML ' + @varCHDate2 + ' Volume]) +  Sum([ML ' + @varCHDate3 + ' Volume]) as [ML Q1 ' + @ch_startYR + '],';
	END
-------------------------------- END Q1 Curr

---------------Q2 Curr
    -- Q2 Curr
	IF( @whStartMonth = 6 or @whStartMonth = 7 or @whStartMonth = 8 or @whStartMonth = 9 or @whStartMonth = 10 or @whStartMonth = 11 or @whStartMonth = 12)
      BEGIN
  
		SET  @whQ2CurrStartDate = '04/01/' + cast(@wh_startYR as varchar(4));
 
		SET @mo_Count = 0
		--Q2 Curr WH
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@mo_Count,@whQ2CurrStartDate));
        SET  @varWHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@whQ2CurrStartDate));
        SET  @varWHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@whQ2CurrStartDate));
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Brand])  +  Sum([API ' + @varWHDate2 +  ' Brand]) +  Sum([API ' + @varWHDate3 +  ' Brand]) as [API Q2 ' + @wh_startYR + ' Brand] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Generic]) +  Sum([API ' + @varWHDate2 +  ' Generic]) +  Sum([API ' + @varWHDate3 +  ' Generic]) as [API Q2 ' + @wh_startYR + ' Generic] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' OTC])  +  Sum([API ' + @varWHDate2 +  ' OTC]) +  Sum([API ' + @varWHDate3 +  ' OTC]) as [API Q2 ' + @wh_startYR + ' OTC] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 1])  +  Sum([API ' + @varWHDate2 +  ' Tier 1]) +  Sum([API ' + @varWHDate3 +  ' Tier 1]) as [API Q2 ' + @wh_startYR + ' Tier 1] , '; -- Added RSE 08/14/2019
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 2])  +  Sum([API ' + @varWHDate2 +  ' Tier 2]) +  Sum([API ' + @varWHDate3 +  ' Tier 2]) as [API Q2 ' + @wh_startYR + ' Tier 2] , '; -- Added RSE 08/14/2019
    	SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Total Whse])   +  Sum([API ' + @varWHDate2 +  ' Total Whse]) +  Sum([API ' + @varWHDate3 +  ' Total Whse]) as [API Q2 ' + @wh_startYR + ' Total Whse] , ';
	  END 

	IF(  @chStartMonth = 6 or @chStartMonth = 7 or @chStartMonth = 8 or @chStartMonth = 9 or @chStartMonth = 10 or @chStartMonth = 11 or @chStartMonth = 12)
	BEGIN
        SET @cahQ2CurrStartDate = '04/01/' + cast(@ch_startYR as varchar(4));
		SET @mo_Count = 0
		--Q2 Curr CAH

		SET  @varCHDate = dbo.fDate1(DATEADD(m,@mo_Count,@cahQ2CurrStartDate));

        SET  @varCHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@cahQ2CurrStartDate));

        SET  @varCHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@cahQ2CurrStartDate));

    	SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Brand]) + Sum([CAH ' + @varCHDate2 + ' AAP Brand]) + Sum([CAH ' + @varCHDate3 + ' AAP Brand]) as [CAH Q2 ' + @ch_startYR + ' AAP Brand] , ';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Src Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Src Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Src Generics]) as [CAH Q2 ' + @ch_startYR + ' AAP Src Generics],';

--		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded Generics]) as [CAH Q2 ' + @ch_startYR + ' AAP Excluded Generics],'; --NEW

		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Other Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Other Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Other Sales]) as [CAH Q2 ' + @ch_startYR + ' AAP Other Sales],';

-- Put new here
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Total RX]) as [CAH Q2 ' + @ch_startYR + ' AAP Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded from Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded from Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded from Total RX]) as [CAH Q2 ' + @ch_startYR + ' AAP Excluded from Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP NonRX - OTC&HH])  +  Sum([CAH ' + @varCHDate2 + ' AAP NonRX - OTC&HH]) + Sum([CAH ' + @varCHDate3 + ' AAP NonRX - OTC&HH]) as [CAH Q2 ' + @ch_startYR + ' AAP NonRX - OTC&HH],';
		-- No Source Compliance
--End new
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Total Sales]) as [CAH Q2 ' + @ch_startYR + ' AAP Total Sales],';

      -- Q2 Curr ML --Removed by LA 2/9/2018 per Wayne's Request
        --SET @QSQLMLColQuarter = @QSQLMLColQuarter + ' Sum([ML ' + @varCHDate + ' Volume]) +  Sum([ML ' + @varCHDate2 + ' Volume]) +  Sum([ML ' + @varCHDate3 + ' Volume]) as [ML Q2 ' + @ch_startYR + '],';
	END
-------------------------------- END Q2 Curr


---------------Q3 Curr
    -- Q3 Curr
	IF( @whStartMonth = 9 or @whStartMonth = 10 or @whStartMonth = 11 or @whStartMonth = 12)
      BEGIN
  
		SET  @whQ3CurrStartDate = '07/01/' + cast(@wh_startYR as varchar(4));
 
		SET @mo_Count = 0
		--Q3 Curr WH
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@mo_Count,@whQ3CurrStartDate));
        SET  @varWHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@whQ3CurrStartDate));
        SET  @varWHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@whQ3CurrStartDate));
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Brand])  +  Sum([API ' + @varWHDate2 +  ' Brand]) +  Sum([API ' + @varWHDate3 +  ' Brand]) as [API Q3 ' + @wh_startYR + ' Brand] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Generic]) +  Sum([API ' + @varWHDate2 +  ' Generic]) +  Sum([API ' + @varWHDate3 +  ' Generic]) as [API Q3 ' + @wh_startYR + ' Generic] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' OTC])  +  Sum([API ' + @varWHDate2 +  ' OTC]) +  Sum([API ' + @varWHDate3 +  ' OTC]) as [API Q3 ' + @wh_startYR + ' OTC] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 1])  +  Sum([API ' + @varWHDate2 +  ' Tier 1]) +  Sum([API ' + @varWHDate3 +  ' Tier 1]) as [API Q3 ' + @wh_startYR + ' Tier 1] , '; -- Added RSE 08/14/2019
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 2])  +  Sum([API ' + @varWHDate2 +  ' Tier 2]) +  Sum([API ' + @varWHDate3 +  ' Tier 2]) as [API Q3 ' + @wh_startYR + ' Tier 2] , '; -- Added RSE 08/14/2019
    	SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Total Whse])   +  Sum([API ' + @varWHDate2 +  ' Total Whse]) +  Sum([API ' + @varWHDate3 +  ' Total Whse]) as [API Q3 ' + @wh_startYR + ' Total Whse] , ';
	  END 

	IF( @chStartMonth = 9 or @chStartMonth = 10 or @chStartMonth = 11 or @chStartMonth = 12)
	BEGIN
        SET @cahQ3CurrStartDate = '07/01/' + cast(@ch_startYR as varchar(4));
		SET @mo_Count = 0
		--Q3 Curr CAH

		SET  @varCHDate = dbo.fDate1(DATEADD(m,@mo_Count,@cahQ3CurrStartDate));

        SET  @varCHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@cahQ3CurrStartDate));

        SET  @varCHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@cahQ3CurrStartDate));

    	SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Brand]) + Sum([CAH ' + @varCHDate2 + ' AAP Brand]) + Sum([CAH ' + @varCHDate3 + ' AAP Brand]) as [CAH Q3 ' + @ch_startYR + ' AAP Brand] , ';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Src Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Src Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Src Generics]) as [CAH Q3 ' + @ch_startYR + ' AAP Src Generics],';

--		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded Generics]) as [CAH Q3 ' + @ch_startYR + ' AAP Excluded Generics],'; --NEW

		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Other Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Other Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Other Sales]) as [CAH Q3 ' + @ch_startYR + ' AAP Other Sales],';

-- Put new here
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Total RX]) as [CAH Q3 ' + @ch_startYR + ' AAP Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded from Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded from Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded from Total RX]) as [CAH Q3 ' + @ch_startYR + ' AAP Excluded from Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP NonRX - OTC&HH])  +  Sum([CAH ' + @varCHDate2 + ' AAP NonRX - OTC&HH]) + Sum([CAH ' + @varCHDate3 + ' AAP NonRX - OTC&HH]) as [CAH Q3 ' + @ch_startYR + ' AAP NonRX - OTC&HH],';
		-- No Source Compliance
--End new
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Total Sales]) as [CAH Q3 ' + @ch_startYR + ' AAP Total Sales],';

      -- Q3 Curr ML --Removed by LA 2/9/2018 per Wayne's Request
        --SET @QSQLMLColQuarter = @QSQLMLColQuarter + ' Sum([ML ' + @varCHDate + ' Volume]) +  Sum([ML ' + @varCHDate2 + ' Volume]) +  Sum([ML ' + @varCHDate3 + ' Volume]) as [ML Q3 ' + @ch_startYR + '],';
	END
-------------------------------- END Q3 Curr

---------------Q4 Curr
    -- Q4 Curr
	IF(@whStartMonth = 12)
      BEGIN
  
		SET  @whQ4CurrStartDate = '10/01/' + cast(@wh_startYR as varchar(4));
 
		SET @mo_Count = 0
		--Q4 Curr WH
		SET  @varWHDate = dbo.fDate1(DATEADD(m,@mo_Count,@whQ4CurrStartDate));
        SET  @varWHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@whQ4CurrStartDate));
        SET  @varWHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@whQ4CurrStartDate));
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Brand])  +  Sum([API ' + @varWHDate2 +  ' Brand]) +  Sum([API ' + @varWHDate3 +  ' Brand]) as [API Q4 ' + @wh_startYR + ' Brand] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Generic]) +  Sum([API ' + @varWHDate2 +  ' Generic]) +  Sum([API ' + @varWHDate3 +  ' Generic]) as [API Q4 ' + @wh_startYR + ' Generic] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' OTC])  +  Sum([API ' + @varWHDate2 +  ' OTC]) +  Sum([API ' + @varWHDate3 +  ' OTC]) as [API Q4 ' + @wh_startYR + ' OTC] , ';
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 1])  +  Sum([API ' + @varWHDate2 +  ' Tier 1]) +  Sum([API ' + @varWHDate3 +  ' Tier 1]) as [API Q4 ' + @wh_startYR + ' Tier 1] , '; -- Added RSE 08/14/2019
		SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Tier 2])  +  Sum([API ' + @varWHDate2 +  ' Tier 2]) +  Sum([API ' + @varWHDate3 +  ' Tier 2]) as [API Q4 ' + @wh_startYR + ' Tier 2] , '; -- Added RSE 08/14/2019
    	SET @QSQLWHColQuarter = @QSQLWHColQuarter +  ' Sum([API ' + @varWHDate +  ' Total Whse])   +  Sum([API ' + @varWHDate2 +  ' Total Whse]) +  Sum([API ' + @varWHDate3 +  ' Total Whse]) as [API Q4 ' + @wh_startYR + ' Total Whse] , ';
	  END 

	IF(@chStartMonth = 12)
	BEGIN
        SET @cahQ4CurrStartDate = '10/01/' + cast(@ch_startYR as varchar(4));
		SET @mo_Count = 0
		--Q4 Curr CAH

		SET  @varCHDate = dbo.fDate1(DATEADD(m,@mo_Count,@cahQ4CurrStartDate));

        SET  @varCHDate2 = dbo.fDate1(DATEADD(m,@mo_Count + 1 ,@cahQ4CurrStartDate));

        SET  @varCHDate3 = dbo.fDate1(DATEADD(m,@mo_Count + 2 ,@cahQ4CurrStartDate));

    	SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Brand]) + Sum([CAH ' + @varCHDate2 + ' AAP Brand]) + Sum([CAH ' + @varCHDate3 + ' AAP Brand]) as [CAH Q4 ' + @ch_startYR + ' AAP Brand] , ';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Src Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Src Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Src Generics]) as [CAH Q4 ' + @ch_startYR + ' AAP Src Generics],';

--		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded Generics]) +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded Generics]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded Generics]) as [CAH Q4 ' + @ch_startYR + ' AAP Excluded Generics],'; --NEW

		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Other Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Other Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Other Sales]) as [CAH Q4 ' + @ch_startYR + ' AAP Other Sales],';

-- Put new here
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Total RX]) as [CAH Q4 ' + @ch_startYR + ' AAP Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Excluded from Total RX])  +  Sum([CAH ' + @varCHDate2 + ' AAP Excluded from Total RX]) + Sum([CAH ' + @varCHDate3 + ' AAP Excluded from Total RX]) as [CAH Q4 ' + @ch_startYR + ' AAP Excluded from Total RX],';
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP NonRX - OTC&HH])  +  Sum([CAH ' + @varCHDate2 + ' AAP NonRX - OTC&HH]) + Sum([CAH ' + @varCHDate3 + ' AAP NonRX - OTC&HH]) as [CAH Q4 ' + @ch_startYR + ' AAP NonRX - OTC&HH],';
		-- No Source Compliance
--End new
		SET @QSQLCAHColQuarter = @QSQLCAHColQuarter + ' Sum([CAH ' + @varCHDate + ' AAP Total Sales])  +  Sum([CAH ' + @varCHDate2 + ' AAP Total Sales]) + Sum([CAH ' + @varCHDate3 + ' AAP Total Sales]) as [CAH Q4 ' + @ch_startYR + ' AAP Total Sales],';

      -- Q4 Curr ML --Removed by LA 2/9/2018 per Wayne's Request
        --SET @QSQLMLColQuarter = @QSQLMLColQuarter + ' Sum([ML ' + @varCHDate + ' Volume]) +  Sum([ML ' + @varCHDate2 + ' Volume]) +  Sum([ML ' + @varCHDate3 + ' Volume]) as [ML Q4 ' + @ch_startYR + '],';
	END
-------------------------------- END Q4 Curr
--------------------------

	SET @SQL = ' SELECT * into tmp_RCVol_jmw_TM from ( ' +
				'    SELECT TM, ' + @SQLWHColSelect +
				' SUM([API Total Brand Sales]) as  [API Total Brand Sales],' +
				' SUM([API Total Generic Sales]) as  [API Total Generic Sales],' +
				' SUM([API Total OTC Sales]) as  [API Total OTC Sales],' +
				' SUM([API Total Tier 1 Sales]) as  [API Total Tier 1 Sales],' + -- Added RSE 08/14/2019
				' SUM([API Total Tier 2 Sales]) as  [API Total Tier 2 Sales],' + -- Added RSE 08/14/2019
				' SUM([API TOTAL SALES]) as  [API TOTAL SALES],' + @QSQLWHColQuarter;
	SET @SQL2 = @SQLCHColSelect +
				' SUM([CAH Total Brand Sales]) as  [CAH Total Brand Sales],' +
				' SUM([CAH Total New Brand Sales]) as  [CAH Total New Brand Sales],' + 
				' SUM([CAH Total Src Generic Sales]) as  [CAH Total Src Generic Sales],' + 
--				' SUM([CAH Total Excluded Generic Sales]) as  [CAH Total Excluded Generic Sales],' +  --NEW
				' SUM([CAH Total Other Sales]) as  [CAH Total Other Sales],' + 

--Start New here
				' SUM([CAH Total Total RX]) as  [CAH Total Total RX],' + 
				' SUM([CAH Total Other RX]) as  [CAH Total Other RX],' + 
				' SUM([CAH Total Excluded from Total RX]) as  [CAH Total Excluded from Total RX],' + 
				' SUM([CAH Total NonRX - OTC&HH]) as  [CAH Total NonRX - OTC&HH],' + 
-- No Source Compliance
-- End new
				' SUM([CAH TOTAL SALES]) as  [CAH TOTAL SALES],' + @QSQLCAHColQuarter
		        --@SQLMLColSelect + --Removed by LA 2/9/2018 per Wayne's Request
                --' SUM([ML TOTAL SALES]) as  [ML TOTAL SALES],' + @QSQLMLColQuarter; --Removed by LA 2/9/2018 per Wayne's Request
	SET @SQL3 = @SQLCombColSelect + 
				' SUM([TOTAL COMBINED SALES]) as  [TOTAL COMBINED SALES] '+
                ' from tmp_RCVol_jmw group by TM ) vol ';

	EXEC (@SQL + @SQL2 + @SQL3)

--- Now need to do the Quarter Totals
	--Q1 Prev
		  IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q1 ' + @wh_prevYR + ' Total Whse') = 'T' 
           BEGIN 
		       SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q1 ' + @wh_prevYR + ' Sales] numeric(18,2) NOT NULL DEFAULT (0)'; 
               EXEC (@SQLAllQuarter);
          END

         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q1 ' + @wh_prevYR + ' Total Whse') = 'T'   
            BEGIN  
			   SET @SQLAllQuarter = ' UPDATE  tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_prevYR + ' Sales]  = [Total All Q1 ' + @wh_prevYR + ' Sales] + [API Q1 ' + @wh_prevYR + ' Total Whse];' ;
               EXEC (@SQLAllQuarter);
            END  
    	

          IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q1 ' + @wh_prevYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q1 ' + @wh_prevYR + ' Total Whse') = 'T'  
				--Removed by LA 2/9/2018 per Wayne's Request
			  --  BEGIN 
					--SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_prevYR + ' Sales]  = [Total All Q1 ' + @wh_prevYR + ' Sales] + [CAH Q1 ' + @wh_prevYR + ' AAP Total Sales];' +
					--' UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_prevYR + ' Sales]  = [Total All Q1 ' + @wh_prevYR + ' Sales] + [ML Q1 ' + @wh_prevYR +'];' ;
     --               EXEC (@SQLAllQuarter);
			  --  END
				BEGIN 
					SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_prevYR + ' Sales]  = [Total All Q1 ' + @wh_prevYR + ' Sales] + [CAH Q1 ' + @wh_prevYR + ' AAP Total Sales];';
                    EXEC (@SQLAllQuarter);
			    END
         
         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q1 ' + @wh_prevYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q1 ' + @wh_prevYR + ' Total Whse') = 'F'   
			 BEGIN 
				 SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q1 ' + @wh_prevYR + ' Sales] numeric(18,2)  NOT NULL DEFAULT (0);';
                 EXEC (@SQLAllQuarter);
             END

        IF  dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q1 ' + @wh_prevYR + ' Total Whse') = 'F'  and 
                               dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q1 ' + @wh_prevYR + ' AAP Total Sales') = 'T'   
			 --BEGIN 
				-- SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_prevYR + ' Sales]  = [Total All Q1 ' + @wh_prevYR + ' Sales] + [CAH Q1 ' + @wh_prevYR + ' AAP Total Sales];' +
	   --       '  UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_prevYR + ' Sales]  = [Total All Q1 ' + @wh_prevYR + ' Sales] + [ML Q1 ' + @wh_prevYR +'];' ;
             
   	--	     EXEC (@SQLAllQuarter);
			BEGIN 
				 SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_prevYR + ' Sales]  = [Total All Q1 ' + @wh_prevYR + ' Sales] + [CAH Q1 ' + @wh_prevYR + ' AAP Total Sales];';
             
   		     EXEC (@SQLAllQuarter);
             END


	--Q2 Prev
		  IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q2 ' + @wh_prevYR + ' Total Whse') = 'T' 
           BEGIN 
		       SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q2 ' + @wh_prevYR + ' Sales] numeric(18,2) NOT NULL DEFAULT (0)'; 
               EXEC (@SQLAllQuarter);
          END

         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q2 ' + @wh_prevYR + ' Total Whse') = 'T'   
            BEGIN  
			   SET @SQLAllQuarter = ' UPDATE  tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_prevYR + ' Sales]  = [Total All Q2 ' + @wh_prevYR + ' Sales] + [API Q2 ' + @wh_prevYR + ' Total Whse];' ;
               EXEC (@SQLAllQuarter);
            END  
    	

          IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q2 ' + @wh_prevYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q2 ' + @wh_prevYR + ' Total Whse') = 'T'  
			  --  BEGIN 
					--SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_prevYR + ' Sales]  = [Total All Q2 ' + @wh_prevYR + ' Sales] + [CAH Q2 ' + @wh_prevYR + ' AAP Total Sales];' +
					--' UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_prevYR + ' Sales]  = [Total All Q2 ' + @wh_prevYR + ' Sales] + [ML Q2 ' + @wh_prevYR +'];' ;
     --               EXEC (@SQLAllQuarter);
				BEGIN 
					SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_prevYR + ' Sales]  = [Total All Q2 ' + @wh_prevYR + ' Sales] + [CAH Q2 ' + @wh_prevYR + ' AAP Total Sales];';
                    EXEC (@SQLAllQuarter);
			    END
         
         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q2 ' + @wh_prevYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q2 ' + @wh_prevYR + ' Total Whse') = 'F'   
			 BEGIN 
				 SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q2 ' + @wh_prevYR + ' Sales] numeric(18,2)  NOT NULL DEFAULT (0);';
                 EXEC (@SQLAllQuarter);
             END

        IF  dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q2 ' + @wh_prevYR + ' Total Whse') = 'F'  and 
                               dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q2 ' + @wh_prevYR + ' AAP Total Sales') = 'T'   
			 --BEGIN 
				-- SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_prevYR + ' Sales]  = [Total All Q2 ' + @wh_prevYR + ' Sales] + [CAH Q2 ' + @wh_prevYR + ' AAP Total Sales];' +
	   --       '  UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_prevYR + ' Sales]  = [Total All Q2 ' + @wh_prevYR + ' Sales] + [ML Q2 ' + @wh_prevYR +'];' ;
             
   	--	     EXEC (@SQLAllQuarter);
			BEGIN 
				 SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_prevYR + ' Sales]  = [Total All Q2 ' + @wh_prevYR + ' Sales] + [CAH Q2 ' + @wh_prevYR + ' AAP Total Sales];';
             
   		     EXEC (@SQLAllQuarter);
             END
---END Q2 Prev


	--Q3 Prev
		  IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q3 ' + @wh_prevYR + ' Total Whse') = 'T' 
           BEGIN 
		       SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q3 ' + @wh_prevYR + ' Sales] numeric(18,2) NOT NULL DEFAULT (0)'; 
               EXEC (@SQLAllQuarter);
          END

         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q3 ' + @wh_prevYR + ' Total Whse') = 'T'   
            BEGIN  
			   SET @SQLAllQuarter = ' UPDATE  tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_prevYR + ' Sales]  = [Total All Q3 ' + @wh_prevYR + ' Sales] + [API Q3 ' + @wh_prevYR + ' Total Whse];' ;
               EXEC (@SQLAllQuarter);
            END  
    	

          IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q3 ' + @wh_prevYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q3 ' + @wh_prevYR + ' Total Whse') = 'T'  
			  --  BEGIN 
					--SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_prevYR + ' Sales]  = [Total All Q3 ' + @wh_prevYR + ' Sales] + [CAH Q3 ' + @wh_prevYR + ' AAP Total Sales];' +
					--' UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_prevYR + ' Sales]  = [Total All Q3 ' + @wh_prevYR + ' Sales] + [ML Q3 ' + @wh_prevYR +'];' ;
     --               EXEC (@SQLAllQuarter);
				BEGIN 
					SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_prevYR + ' Sales]  = [Total All Q3 ' + @wh_prevYR + ' Sales] + [CAH Q3 ' + @wh_prevYR + ' AAP Total Sales];';
                    EXEC (@SQLAllQuarter);
			    END
         
         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q3 ' + @wh_prevYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q3 ' + @wh_prevYR + ' Total Whse') = 'F'   
			 BEGIN 
				 SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q3 ' + @wh_prevYR + ' Sales] numeric(18,2)  NOT NULL DEFAULT (0);';
                 EXEC (@SQLAllQuarter);
             END

        IF  dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q3 ' + @wh_prevYR + ' Total Whse') = 'F'  and 
                               dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q3 ' + @wh_prevYR + ' AAP Total Sales') = 'T'   
			 --BEGIN 
				-- SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_prevYR + ' Sales]  = [Total All Q3 ' + @wh_prevYR + ' Sales] + [CAH Q3 ' + @wh_prevYR + ' AAP Total Sales];' +
	   --       '  UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_prevYR + ' Sales]  = [Total All Q3 ' + @wh_prevYR + ' Sales] + [ML Q3 ' + @wh_prevYR +'];' ;
             
   	--	     EXEC (@SQLAllQuarter);
			BEGIN 
				 SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_prevYR + ' Sales]  = [Total All Q3 ' + @wh_prevYR + ' Sales] + [CAH Q3 ' + @wh_prevYR + ' AAP Total Sales];';
             
   		     EXEC (@SQLAllQuarter);
             END
---END Q3 Prev

	--Q4 Prev
		  IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q4 ' + @wh_prevYR + ' Total Whse') = 'T' 
           BEGIN 
		       SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q4 ' + @wh_prevYR + ' Sales] numeric(18,2) NOT NULL DEFAULT (0)'; 
               EXEC (@SQLAllQuarter);
          END

         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q4 ' + @wh_prevYR + ' Total Whse') = 'T'   
            BEGIN  
			   SET @SQLAllQuarter = ' UPDATE  tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_prevYR + ' Sales]  = [Total All Q4 ' + @wh_prevYR + ' Sales] + [API Q4 ' + @wh_prevYR + ' Total Whse];' ;
               EXEC (@SQLAllQuarter);
            END  
    	

          IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q4 ' + @wh_prevYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q4 ' + @wh_prevYR + ' Total Whse') = 'T'  
			  --  BEGIN 
					--SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_prevYR + ' Sales]  = [Total All Q4 ' + @wh_prevYR + ' Sales] + [CAH Q4 ' + @wh_prevYR + ' AAP Total Sales];' +
					--' UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_prevYR + ' Sales]  = [Total All Q4 ' + @wh_prevYR + ' Sales] + [ML Q4 ' + @wh_prevYR +'];' ;
     --               EXEC (@SQLAllQuarter);
				BEGIN 
					SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_prevYR + ' Sales]  = [Total All Q4 ' + @wh_prevYR + ' Sales] + [CAH Q4 ' + @wh_prevYR + ' AAP Total Sales];';
                    EXEC (@SQLAllQuarter);
			    END
         
         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q4 ' + @wh_prevYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q4 ' + @wh_prevYR + ' Total Whse') = 'F'   
			 BEGIN 
				 SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q4 ' + @wh_prevYR + ' Sales] numeric(18,2)  NOT NULL DEFAULT (0);';
                 EXEC (@SQLAllQuarter);
             END

        IF  dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q4 ' + @wh_prevYR + ' Total Whse') = 'F'  and 
                               dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q4 ' + @wh_prevYR + ' AAP Total Sales') = 'T'   
			 --BEGIN 
				-- SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_prevYR + ' Sales]  = [Total All Q4 ' + @wh_prevYR + ' Sales] + [CAH Q4 ' + @wh_prevYR + ' AAP Total Sales];' +
	   --       '  UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_prevYR + ' Sales]  = [Total All Q4 ' + @wh_prevYR + ' Sales] + [ML Q4 ' + @wh_prevYR +'];' ;
             
   	--	     EXEC (@SQLAllQuarter);
			BEGIN 
				 SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_prevYR + ' Sales]  = [Total All Q4 ' + @wh_prevYR + ' Sales] + [CAH Q4 ' + @wh_prevYR + ' AAP Total Sales];' ;
             
   		     EXEC (@SQLAllQuarter);
             END
---END Q4 Prev
 --------------------START Genereate Current Quarter Totals

 	--Q1 Curr
		  IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q1 ' + @wh_startYR + ' Total Whse') = 'T' 
           BEGIN 
		       SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q1 ' + @wh_startYR + ' Sales] numeric(18,2) NOT NULL DEFAULT (0)'; 
               EXEC (@SQLAllQuarter);
          END

         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q1 ' + @wh_startYR + ' Total Whse') = 'T'   
            BEGIN  
			   SET @SQLAllQuarter = ' UPDATE  tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_startYR + ' Sales]  = [Total All Q1 ' + @wh_startYR + ' Sales] + [API Q1 ' + @wh_startYR + ' Total Whse];' ;
               EXEC (@SQLAllQuarter);
            END  
    	

          IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q1 ' + @wh_startYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q1 ' + @wh_startYR + ' Total Whse') = 'T'  
			  --  BEGIN 
					--SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_startYR + ' Sales]  = [Total All Q1 ' + @wh_startYR + ' Sales] + [CAH Q1 ' + @wh_startYR + ' AAP Total Sales];' +
					--' UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_startYR + ' Sales]  = [Total All Q1 ' + @wh_startYR + ' Sales] + [ML Q1 ' + @wh_startYR +'];' ;
     --               EXEC (@SQLAllQuarter);
				BEGIN 
					SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_startYR + ' Sales]  = [Total All Q1 ' + @wh_startYR + ' Sales] + [CAH Q1 ' + @wh_startYR + ' AAP Total Sales];';
                    EXEC (@SQLAllQuarter);
			    END
         
         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q1 ' + @wh_startYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q1 ' + @wh_startYR + ' Total Whse') = 'F'   
			 BEGIN 
				 SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q1 ' + @wh_startYR + ' Sales] numeric(18,2)  NOT NULL DEFAULT (0);';
                 EXEC (@SQLAllQuarter);
             END

        IF  dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q1 ' + @wh_startYR + ' Total Whse') = 'F'  and 
                               dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q1 ' + @wh_startYR + ' AAP Total Sales') = 'T'   
			 --BEGIN 
				-- SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_startYR + ' Sales]  = [Total All Q1 ' + @wh_startYR + ' Sales] + [CAH Q1 ' + @wh_startYR + ' AAP Total Sales];' +
	   --       '  UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_startYR + ' Sales]  = [Total All Q1 ' + @wh_startYR + ' Sales] + [ML Q1 ' + @wh_startYR +'];' ;
             
   	--	     EXEC (@SQLAllQuarter);
			BEGIN 
				 SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q1 ' + @wh_startYR + ' Sales]  = [Total All Q1 ' + @wh_startYR + ' Sales] + [CAH Q1 ' + @wh_startYR + ' AAP Total Sales];';
             
   		     EXEC (@SQLAllQuarter);
             END


	--Q2 Curr
		  IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q2 ' + @wh_startYR + ' Total Whse') = 'T' 
           BEGIN 
		       SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q2 ' + @wh_startYR + ' Sales] numeric(18,2) NOT NULL DEFAULT (0)'; 
               EXEC (@SQLAllQuarter);
          END

         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q2 ' + @wh_startYR + ' Total Whse') = 'T'   
            BEGIN  
			   SET @SQLAllQuarter = ' UPDATE  tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_startYR + ' Sales]  = [Total All Q2 ' + @wh_startYR + ' Sales] + [API Q2 ' + @wh_startYR + ' Total Whse];' ;
               EXEC (@SQLAllQuarter);
            END  
    	

          IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q2 ' + @wh_startYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q2 ' + @wh_startYR + ' Total Whse') = 'T'  
			  --  BEGIN 
					--SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_startYR + ' Sales]  = [Total All Q2 ' + @wh_startYR + ' Sales] + [CAH Q2 ' + @wh_startYR + ' AAP Total Sales];' +
					--' UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_startYR + ' Sales]  = [Total All Q2 ' + @wh_startYR + ' Sales] + [ML Q2 ' + @wh_startYR +'];' ;
     --               EXEC (@SQLAllQuarter);
				BEGIN 
					SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_startYR + ' Sales]  = [Total All Q2 ' + @wh_startYR + ' Sales] + [CAH Q2 ' + @wh_startYR + ' AAP Total Sales];';
                    EXEC (@SQLAllQuarter);
			    END
         
         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q2 ' + @wh_startYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q2 ' + @wh_startYR + ' Total Whse') = 'F'   
			 BEGIN 
				 SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q2 ' + @wh_startYR + ' Sales] numeric(18,2)  NOT NULL DEFAULT (0);';
                 EXEC (@SQLAllQuarter);
             END

        IF  dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q2 ' + @wh_startYR + ' Total Whse') = 'F'  and 
                               dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q2 ' + @wh_startYR + ' AAP Total Sales') = 'T'   
			 --BEGIN 
				-- SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_startYR + ' Sales]  = [Total All Q2 ' + @wh_startYR + ' Sales] + [CAH Q2 ' + @wh_startYR + ' AAP Total Sales];' +
	   --       '  UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_startYR + ' Sales]  = [Total All Q2 ' + @wh_startYR + ' Sales] + [ML Q2 ' + @wh_startYR +'];' ;
             
   	--	     EXEC (@SQLAllQuarter);

			BEGIN 
				 SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q2 ' + @wh_startYR + ' Sales]  = [Total All Q2 ' + @wh_startYR + ' Sales] + [CAH Q2 ' + @wh_startYR + ' AAP Total Sales];' ;
             
   		     EXEC (@SQLAllQuarter);
             END
---END Q2 Curr


	--Q3 Curr
		  IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q3 ' + @wh_startYR + ' Total Whse') = 'T' 
           BEGIN 
		       SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q3 ' + @wh_startYR + ' Sales] numeric(18,2) NOT NULL DEFAULT (0)'; 
               EXEC (@SQLAllQuarter);
          END

         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q3 ' + @wh_startYR + ' Total Whse') = 'T'   
            BEGIN  
			   SET @SQLAllQuarter = ' UPDATE  tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_startYR + ' Sales]  = [Total All Q3 ' + @wh_startYR + ' Sales] + [API Q3 ' + @wh_startYR + ' Total Whse];' ;
               EXEC (@SQLAllQuarter);
            END  
    	

          IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q3 ' + @wh_startYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q3 ' + @wh_startYR + ' Total Whse') = 'T'  
			  --  BEGIN 
					--SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_startYR + ' Sales]  = [Total All Q3 ' + @wh_startYR + ' Sales] + [CAH Q3 ' + @wh_startYR + ' AAP Total Sales];' +
					--' UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_startYR + ' Sales]  = [Total All Q3 ' + @wh_startYR + ' Sales] + [ML Q3 ' + @wh_startYR +'];' ;
     --               EXEC (@SQLAllQuarter);
				BEGIN 
					SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_startYR + ' Sales]  = [Total All Q3 ' + @wh_startYR + ' Sales] + [CAH Q3 ' + @wh_startYR + ' AAP Total Sales];';
                    EXEC (@SQLAllQuarter);
			    END
         
         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q3 ' + @wh_startYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q3 ' + @wh_startYR + ' Total Whse') = 'F'   
			 BEGIN 
				 SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q3 ' + @wh_startYR + ' Sales] numeric(18,2)  NOT NULL DEFAULT (0);';
                 EXEC (@SQLAllQuarter);
             END

        IF  dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q3 ' + @wh_startYR + ' Total Whse') = 'F'  and 
                               dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q3 ' + @wh_startYR + ' AAP Total Sales') = 'T'   
			 --BEGIN 
				-- SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_startYR + ' Sales]  = [Total All Q3 ' + @wh_startYR + ' Sales] + [CAH Q3 ' + @wh_startYR + ' AAP Total Sales];' +
	   --       '  UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_startYR + ' Sales]  = [Total All Q3 ' + @wh_startYR + ' Sales] + [ML Q3 ' + @wh_startYR +'];' ;
             
   	--	     EXEC (@SQLAllQuarter);
				BEGIN 
				 SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q3 ' + @wh_startYR + ' Sales]  = [Total All Q3 ' + @wh_startYR + ' Sales] + [CAH Q3 ' + @wh_startYR + ' AAP Total Sales];' ;
             
   		     EXEC (@SQLAllQuarter);

             END
---END Q3 Curr

	--Q4 Curr
		  IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q4 ' + @wh_startYR + ' Total Whse') = 'T' 
           BEGIN 
		       SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q4 ' + @wh_startYR + ' Sales] numeric(18,2) NOT NULL DEFAULT (0)'; 
               EXEC (@SQLAllQuarter);
          END

         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q4 ' + @wh_startYR + ' Total Whse') = 'T'   
            BEGIN  
			   SET @SQLAllQuarter = ' UPDATE  tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_startYR + ' Sales]  = [Total All Q4 ' + @wh_startYR + ' Sales] + [API Q4 ' + @wh_startYR + ' Total Whse];' ;
               EXEC (@SQLAllQuarter);
            END  
    	

          IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q4 ' + @wh_startYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q4 ' + @wh_startYR + ' Total Whse') = 'T'  
			  --  BEGIN 
					--SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_startYR + ' Sales]  = [Total All Q4 ' + @wh_startYR + ' Sales] + [CAH Q4 ' + @wh_startYR + ' AAP Total Sales];' +
					--' UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_startYR + ' Sales]  = [Total All Q4 ' + @wh_startYR + ' Sales] + [ML Q4 ' + @wh_startYR +'];' ;
     --               EXEC (@SQLAllQuarter);
			BEGIN 
					SET @SQLAllQuarter = ' UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_startYR + ' Sales]  = [Total All Q4 ' + @wh_startYR + ' Sales] + [CAH Q4 ' + @wh_startYR + ' AAP Total Sales];';
                    EXEC (@SQLAllQuarter);
			    END
         
         IF dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q4 ' + @wh_startYR + ' AAP Total Sales') = 'T' and  
                        dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q4 ' + @wh_startYR + ' Total Whse') = 'F'   
			 BEGIN 
				 SET @SQLAllQuarter = ' ALTER TABLE tmp_RCVol_jmw_TM   ADD [Total All Q4 ' + @wh_startYR + ' Sales] numeric(18,2)  NOT NULL DEFAULT (0);';
                 EXEC (@SQLAllQuarter);
             END

        IF  dbo.ColumnExists('tmp_RCVol_jmw_TM', 'API Q4 ' + @wh_startYR + ' Total Whse') = 'F'  and 
                               dbo.ColumnExists('tmp_RCVol_jmw_TM', 'CAH Q4 ' + @wh_startYR + ' AAP Total Sales') = 'T'   
			 --BEGIN 
				-- SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_startYR + ' Sales]  = [Total All Q4 ' + @wh_startYR + ' Sales] + [CAH Q4 ' + @wh_startYR + ' AAP Total Sales];' +
	   --       '  UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_startYR + ' Sales]  = [Total All Q4 ' + @wh_startYR + ' Sales] + [ML Q4 ' + @wh_startYR +'];' ;
             
   	--	     EXEC (@SQLAllQuarter);
			BEGIN 
				 SET @SQLAllQuarter =  '  UPDATE tmp_RCVol_jmw_TM set [Total All Q4 ' + @wh_startYR + ' Sales]  = [Total All Q4 ' + @wh_startYR + ' Sales] + [CAH Q4 ' + @wh_startYR + ' AAP Total Sales];';
             
   		     EXEC (@SQLAllQuarter);
             END
---END Q4 Curr
END
END












GO
