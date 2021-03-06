USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_MasterSalesReport_old20180131]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Chris McKinnie
-- Create date: January 17, 2017
-- Description:	Master Sales Report
-- =============================================
CREATE PROCEDURE [dbo].[usp_MasterSalesReport_old20180131] 
	-- Add the parameters for the stored procedure here
	@PMID Int,
	@PMIDList VARCHAR(50),
	@StartDate DATETIME2,
	@EndDate DATETIME2
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DECLARE @CurrentYear Int = YEAR(@StartDate)
	DECLARE @PreviousYear Int = @CurrentYear - 1
	DECLARE @InstantRebatePercentage decimal(6,2) = 0.20
	DECLARE @Type VarChar(1000) = 'Generic'
	DECLARE @HighVolume decimal(18,2)
	DECLARE @AAPTotal decimal(18,2) = 0
	DECLARE @APITotal decimal(18,2) = 0
	DECLARE @CardinalHealthTotal decimal(18,2) = 0
	DECLARE @ApiAccountNumber VarChar(1000)

	/*SET API Number*/
	SELECT TOP 1 @ApiAccountNumber = [APIAccountNo] FROM [PharmacyMaster].[dbo].PM_Pharmacy WHERE [PMID] = @PMID

	/*---------------------------
		Temp Tables
	----------------------------*/
	--Master Tables
	DECLARE @tempAPITable TABLE ([RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempCardinalHealthTable TABLE ([RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempOverAllMonthlyTotalTable TABLE ([Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempOverAllMonthlyTotalRollUpTable TABLE ([Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempOverAllTotalTable TABLE (APITotal decimal(18,2),CardinalHealthTotal decimal(18,2),Total decimal(18,2))

	--API Tables
	DECLARE @tempAPIBrand TABLE([CreditFor] DateTime2,[APIBrandSales] decimal(18,2))
	DECLARE @tempAPI TABLE([CreditFor] DateTime2,[APIGenericSales] decimal(18,2), [APIOTCSales] decimal(18,2))

	--Cardinal Health Tables
	DECLARE @tempCardinal TABLE([RebateDate] DateTime2, [BrandRx] decimal(18,2), [ExcludedRx] decimal(18,2), [SourceGenericRx] decimal(18,2), [OTC] decimal(18,2), [SuppliesOther] decimal(18,2))
	DECLARE @tempCardinalNonContractGenericRx TABLE ([RebateDate] DateTime2, [NonContractGenericRx] decimal(18,2))
/*******************************
		  API Rebates
********************************/
--Brand Rx
INSERT INTO @tempAPIBrand SELECT
	MAX([Credit For]) [CreditFor],
	MAX([APIBrandSales]) [APIBrandSales]
	FROM (
		SELECT  
		CAST([Date] AS DATETIME2)  as [Credit For],
		[API Brand Sales] as [APIBrandSales]
		FROM pharmacymaster.dbo.v_web_PM_Rebates_APIMonthly
		WHERE [date] >= @startDate AND [date] <= @endDate AND pmid in (select * from dbo.ufn_CommaListToTable(@PMIDList))
		UNION
		SELECT TOP 12
		CAST([Date] AS DATETIME2)  as [Credit For],
		[BrandSales] as [APIBrandSales]
		FROM pharmacymaster.dbo.PM_BrandCredits_APIMonthly
		WHERE [date] >= @startDate AND [date] <= @endDate AND pmid in (select * from dbo.ufn_CommaListToTable(@PMIDList))
	) dt GROUP BY [Credit For] 
	UNION
	SELECT SalesFor AS [CreditFor]    
       , SUM(APIBrandRx) as [APIBrandSales]
	--       , SUM(APIGenericRx) as APIGenericRx
	--       , SUM(APIOTC) as APIOTC
	FROM (
		   SELECT DATEADD(month, DATEDIFF(month, 0, InvDate), 0) as SalesFor
				  , CASE WHEN Type = 'Brand' THEN SUM(ExtSales) ELSE 0 END AS APIBrandRx
				  , CASE WHEN Type = 'Generic' THEN SUM(ExtSales) ELSE 0 END AS APIGenericRx
				  , CASE WHEN Type = 'OTC' THEN SUM(ExtSales) ELSE 0 END AS APIOTC
		   FROM API.dbo.APISalesDetail
		   WHERE InvDate >= @startDate AND InvDate <= @endDate
		   AND WHAccountID like @ApiAccountNumber + '%' --Big C, PMID 106917
		   GROUP BY DATEADD(month, DATEDIFF(month, 0, InvDate), 0), Type) as a
	GROUP BY SalesFor

	INSERT INTO @tempAPITable SELECT 
	'Brand Rx' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 1 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 2 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 3 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 4 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 5 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 6 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 7 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 8 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 9 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 10 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 11 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 12 THEN CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(APIBrandSales,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAPIBrand
	
--Generic Rx and OTC Totals
INSERT INTO @tempAPI SELECT 
	[api].[Date] AS [CreditFor], [api].[API Generic Sales] AS [APIGenericSales], [api].[API OTC Sales] AS [APIOTCSales]
	FROM [PharmacyMaster].[dbo].[v_web_PM_Rebates_APIMonthly] AS [api]
	WHERE ([api].[Date] >= @StartDate) AND ([api].[Date] <= @EndDate) AND ([api].[PMID] = @PMIDList)
	UNION
	SELECT SalesFor AS [CreditFor]    
    --   , SUM(APIBrandRx) as [APIBrandSales]
	       , SUM(APIGenericRx) as [APIGenericSales]
	       , SUM(APIOTC) as [APIOTCSales]
	FROM (
		   SELECT DATEADD(month, DATEDIFF(month, 0, InvDate), 0) as SalesFor
				  , CASE WHEN Type = 'Brand' THEN SUM(ExtSales) ELSE 0 END AS APIBrandRx
				  , CASE WHEN Type = 'Generic' THEN SUM(ExtSales) ELSE 0 END AS APIGenericRx
				  , CASE WHEN Type = 'OTC' THEN SUM(ExtSales) ELSE 0 END AS APIOTC
		   FROM API.dbo.APISalesDetail
		   WHERE InvDate >= @startDate AND InvDate <= @endDate
		   AND WHAccountID like @ApiAccountNumber + '%' --Big C, PMID 106917
		   GROUP BY DATEADD(month, DATEDIFF(month, 0, InvDate), 0), Type) as a
	GROUP BY SalesFor

	INSERT INTO @tempAPITable SELECT 
	'Generic Rx' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 1 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 2 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 3 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 4 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 5 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 6 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 7 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 8 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 9 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 10 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 11 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 12 THEN CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(APIGenericSales,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAPI
	
	INSERT INTO @tempAPITable SELECT 
	'OTC' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 1 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 2 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 3 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 4 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 5 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 6 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 7 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 8 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 9 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 10 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 11 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 12 THEN CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(APIOTCSales,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAPI

/*---------------------------
	API Totals
----------------------------*/
SELECT @APITotal = SUM([Annual]) FROM @tempAPITable

INSERT INTO @tempOverAllMonthlyTotalTable SELECT 
SUM([Jan]) AS [Jan],
SUM([Feb]) AS [Feb],
SUM([Mar]) AS [Mar],
SUM([Apr]) AS [Apr],
SUM([May]) AS [May],
SUM([Jun]) AS [Jun],
SUM([Jul]) AS [Jul],
SUM([Aug]) AS [Aug],
SUM([Sep]) AS [Sep],
SUM([Oct]) AS [Oct],
SUM([Nov]) AS [Nov],
SUM([Dec]) AS [Dec],
SUM([Annual]) AS [Annual]
FROM @tempAPITable

INSERT INTO @tempAPITable SELECT 
'Total Purchases' As [RebateType],
SUM([Jan]) AS [Jan],
SUM([Feb]) AS [Feb],
SUM([Mar]) AS [Mar],
SUM([Apr]) AS [Apr],
SUM([May]) AS [May],
SUM([Jun]) AS [Jun],
SUM([Jul]) AS [Jul],
SUM([Aug]) AS [Aug],
SUM([Sep]) AS [Sep],
SUM([Oct]) AS [Oct],
SUM([Nov]) AS [Nov],
SUM([Dec]) AS [Dec],
SUM([Annual]) AS [Annual]
FROM @tempAPITable


/*******************************
	 Cadinal Health Rebates
********************************/
INSERT INTO @tempCardinal SELECT 
	[Date] AS [RebateDate], [AAPBrand] AS [BrandRx], [AAPExcludedFromTotalRx] AS [ExcludedRx], [AAPGenTotalSrc] AS [SourceGenericRx], [AAPOTC] AS [OTC], [AAPOther] AS [SuppliesOther]
	FROM [PharmacyMaster].[dbo].[ALL_Volume] AS [c]
WHERE ([c].[Date] >= @StartDate) AND ([c].[Date] <= @EndDate) AND ([c].[PMID] = @PMIDList)

--Brand Rx
INSERT INTO @tempCardinalHealthTable SELECT 
	'Brand Rx' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(BrandRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(BrandRx,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempCardinal
--Excluded Rx
INSERT INTO @tempCardinalHealthTable SELECT 
	'Excluded Brand Rx' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(ExcludedRx,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempCardinal

--Source Generic Rx
INSERT INTO @tempCardinalHealthTable SELECT 
	'Source Generic Rx' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(SourceGenericRx,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempCardinal

--Non Contract Generic Rx
INSERT INTO @tempCardinalNonContractGenericRx SELECT DATEADD(month, DATEDIFF(month, 0, Inv_Date), 0) AS RebateDate
       , SUM(EXT_COST) as NonContractGenericRx
FROM Purchases.dbo.CHPH_AAP
WHERE ContractNo = 00000
AND BRAND = 'N'
AND ITEM_TYPE = 'RX'
AND PMID = @PMID
AND Inv_Date >= @StartDate AND Inv_Date <= @EndDate
GROUP BY DATEADD(month, DATEDIFF(month, 0, Inv_Date), 0)

INSERT INTO @tempCardinalHealthTable SELECT 
	'Non Contract Generic Rx' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(NonContractGenericRx,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempCardinalNonContractGenericRx


--OTC
INSERT INTO @tempCardinalHealthTable SELECT 
	'OTC' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(OTC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(OTC,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempCardinal

--Supplies/Other
INSERT INTO @tempCardinalHealthTable SELECT 
	'Other' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(SuppliesOther,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempCardinal
/*---------------------------
	Cardinal Health Totals
----------------------------*/
SELECT @CardinalHealthTotal = SUM([Annual]) FROM @tempCardinalHealthTable

INSERT INTO @tempOverAllMonthlyTotalTable SELECT 
SUM([Jan]) AS [Jan],
SUM([Feb]) AS [Feb],
SUM([Mar]) AS [Mar],
SUM([Apr]) AS [Apr],
SUM([May]) AS [May],
SUM([Jun]) AS [Jun],
SUM([Jul]) AS [Jul],
SUM([Aug]) AS [Aug],
SUM([Sep]) AS [Sep],
SUM([Oct]) AS [Oct],
SUM([Nov]) AS [Nov],
SUM([Dec]) AS [Dec],
SUM([Annual]) AS [Annual]
FROM @tempCardinalHealthTable

INSERT INTO @tempCardinalHealthTable SELECT 
'Total Purchases' As [RebateType],
SUM([Jan]) AS [Jan],
SUM([Feb]) AS [Feb],
SUM([Mar]) AS [Mar],
SUM([Apr]) AS [Apr],
SUM([May]) AS [May],
SUM([Jun]) AS [Jun],
SUM([Jul]) AS [Jul],
SUM([Aug]) AS [Aug],
SUM([Sep]) AS [Sep],
SUM([Oct]) AS [Oct],
SUM([Nov]) AS [Nov],
SUM([Dec]) AS [Dec],
SUM([Annual]) AS [Annual]
FROM @tempCardinalHealthTable
/*---------------------------
  Calculate Additional Totals
----------------------------*/
INSERT INTO @tempOverAllTotalTable (APITotal,CardinalHealthTotal,Total) 
									VALUES(@APITotal,@CardinalHealthTotal,@APITotal + @CardinalHealthTotal)
INSERT INTO @tempOverAllMonthlyTotalRollUpTable SELECT 
SUM([Jan]) AS [Jan],
SUM([Feb]) AS [Feb],
SUM([Mar]) AS [Mar],
SUM([Apr]) AS [Apr],
SUM([May]) AS [May],
SUM([Jun]) AS [Jun],
SUM([Jul]) AS [Jul],
SUM([Aug]) AS [Aug],
SUM([Sep]) AS [Sep],
SUM([Oct]) AS [Oct],
SUM([Nov]) AS [Nov],
SUM([Dec]) AS [Dec],
SUM([Annual]) AS [Annual]
FROM @tempOverAllMonthlyTotalTable
/*---------------------------
	Display Totals
----------------------------*/
SELECT * FROM @tempAPITable AS [API]
SELECT * FROM @tempCardinalHealthTable AS [CardinalHealth]
SELECT * FROM @tempOverAllMonthlyTotalRollUpTable AS [MonthlyOverAllTotal]
SELECT * FROM @tempOverAllTotalTable AS [OverAllTotal]

END
GO
