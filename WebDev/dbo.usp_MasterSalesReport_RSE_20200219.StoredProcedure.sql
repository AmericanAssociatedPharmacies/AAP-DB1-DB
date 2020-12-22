USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_MasterSalesReport_RSE_20200219]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Chris McKinnie
-- Create date: January 17, 2017
-- Description:	Master Sales Report
-- =============================================
CREATE PROCEDURE [dbo].[usp_MasterSalesReport_RSE_20200219] 
	-- Add the parameters for the stored procedure here
	@PMID INT
	, @PMIDList VARCHAR(50)
	, @StartDate DATETIME2
	, @EndDate DATETIME2

AS

	SET NOCOUNT ON;

BEGIN
	
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
	SELECT TOP 1 @ApiAccountNumber = [APIAccountNo] 
	FROM [PharmacyMaster].[dbo].PM_Pharmacy 
	WHERE [PMID] = @PMID

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
	--DECLARE @tempAPIBrand TABLE([CreditFor] DateTime2,[APIBrandSales] decimal(18,2))
	DECLARE @tempAPI TABLE([CreditFor] DateTime2
							,[APIBrandSales] decimal(18,2)
							, [APIGenericSales] decimal(18,2)
							, [APIOTCSales] decimal(18,2)
							, APIGenericSalesTier1 MONEY
							, APIGenericSalesTier2 MONEY
							, MonthDate INT
							)

	--Cardinal Health Tables
	DECLARE @tempCardinal TABLE([RebateDate] DateTime2
								, [BrandRx] decimal(18,2)
								, [ExcludedRx] decimal(18,2)
								, [SourceGenericRx] decimal(18,2)
								, [NonContractGenericRx] decimal(18,2)
								, [OTC] decimal(18,2)
								, [SuppliesOther] decimal(18,2)
								, MonthDate INT
								, NetSourceGenericRx MONEY
								)
	DECLARE @tempCardinalNonContractGenericRx TABLE ([RebateDate] DateTime2, [NonContractGenericRx] decimal(18,2))

	DECLARE @PMIDTable TABLE(PMID INT NOT NULL PRIMARY KEY CLUSTERED)
	
	INSERT INTO @PMIDTable 
	SELECT LinkedPMIDs as PMID
	FROM WebDev.dbo.RebateLinkedPMIDs
	WHERE PMID = @PMID
	UNION ALL 
	SELECT @PMID

	/*******************************
			  API Sales
	********************************/

	--Brand Rx, Generic Rx, and OTC sales
	INSERT INTO @tempAPI(MonthDate, APIBrandSales, APIGenericSalesTier1, APIGenericSalesTier2, APIOTCSales)
	SELECT DATEPART(MM,[Date]) AS MonthDate, [APIBrandSales], [APIGenericSalesTier1], APIGenericSalesTier2, [APIOTCSales]
	FROM Reports.[dbo].[vw_APISales] AS av
	WHERE Date >= @StartDate
	AND Date <= @EndDate
	AND EXISTS (SELECT 1 
				FROM @PMIDTable as p
				WHERE p.PMID = av.PMID
					)

/************************************************Old SQL code***************************************************************************************************/


----Brand Rx, Generic Rx, and OTC sales
--INSERT INTO @tempAPI
--	SELECT ISNULL(dt.CreditFor, f.CreditFor) AS CreditFor
--	, ISNULL(dt.APIBrandSales, f.APIBrandSales) AS APIBrandSales
--	, ISNULL(dt.APIGenericSales, f.APIGenericSales) as APIGenericSales
--	, ISNULL(dt.APIOTCSales, f.APIOTCSales) as APIOTCSales
--	, ISNULL(DATEPART(MM, dt.CreditFor), DATEPART(MM, f.CreditFor)) AS MonthDate
--	FROM(SELECT Date as [CreditFor]
--		, WHAPIBrand as [APIBrandSales]
--		, WHAPIGeneric as APIGenericSales
--		, WHAPIOTC as APIOTCSales
--		FROM PharmacyMaster.dbo.ALL_Volume as av
--		WHERE Date >= @StartDate AND Date <= @EndDate
--		AND EXISTS (SELECT 1 
--					FROM @PMIDTable as p
--					WHERE p.PMID = av.PMID
--				)
--		) AS dt
--	FULL OUTER JOIN(SELECT SalesFor AS [CreditFor]    
--					, SUM(APIBrandRx) as [APIBrandSales]
--					, SUM(APIGenericRx) as APIGenericSales
--					, SUM(APIOTC) as APIOTCSales
--					FROM (SELECT DATEADD(month, DATEDIFF(month, 0, InvDate), 0) as SalesFor
--							, CASE WHEN Type = 'Brand' THEN SUM(ExtSales) ELSE 0 END AS APIBrandRx
--							, CASE WHEN Type = 'Generic' THEN SUM(ExtSales) ELSE 0 END AS APIGenericRx
--							, CASE WHEN Type = 'OTC' THEN SUM(ExtSales) ELSE 0 END AS APIOTC
--						   FROM API.dbo.APISalesDetail
--						   WHERE InvDate >= @startDate AND InvDate <= @endDate
--						   AND WHAccountID like @ApiAccountNumber + '%'
--						   GROUP BY DATEADD(month, DATEDIFF(month, 0, InvDate), 0), Type
--						) as a
--						GROUP BY SalesFor	
--					) AS f ON dt.CreditFor = f.CreditFor

/***************************************************************************************************************************************************/

	--Brand Rx
	INSERT INTO @tempAPITable 
	SELECT 'Brand Rx' As [RebateType]
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT APIBrandSales
		, MonthDate
		FROM @tempAPI
		) AS dt	
	PIVOT(SUM(APIBrandSales)
			FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
			) AS p
	CROSS JOIN(SELECT SUM(APIBrandSales) AS Annual
				FROM @tempAPI	
					) AS cj

	--Generic Rx
	INSERT INTO @tempAPITable 
	SELECT 'Generic Rx Tier 1' As [RebateType]
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT APIGenericSalesTier1
		, MonthDate
		FROM @tempAPI
		) AS dt	
	PIVOT(SUM(APIGenericSalesTier1)
			FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
			) AS p
	CROSS JOIN(SELECT SUM(APIGenericSalesTier1) AS Annual
				FROM @tempAPI	
					) AS cj


	INSERT INTO @tempAPITable 
	SELECT 'Generic Rx Tier 2' As [RebateType]
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT APIGenericSalesTier2
		, MonthDate
		FROM @tempAPI
		) AS dt	
	PIVOT(SUM(APIGenericSalesTier2)
			FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
			) AS p
	CROSS JOIN(SELECT SUM(APIGenericSalesTier2) AS Annual
				FROM @tempAPI	
					) AS cj


	--OTC
	INSERT INTO @tempAPITable 
	SELECT 'OTC' As [RebateType]
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT APIOTCSales
		, MonthDate
		FROM @tempAPI
		) AS dt	
	PIVOT(SUM(APIOTCSales)
			FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
			) AS p
	CROSS JOIN(SELECT SUM(APIOTCSales) AS Annual
				FROM @tempAPI	
					) AS cj
	
	/*---------------------------
		API Totals
	----------------------------*/
	SELECT @APITotal = SUM([Annual]) 
	FROM @tempAPITable

	INSERT INTO @tempOverAllMonthlyTotalTable 
	SELECT SUM([Jan]) AS [Jan],
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

	INSERT INTO @tempAPITable 
	SELECT 'Total Purchases' As [RebateType],
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
		 Cadinal Health Sales
	********************************/

	INSERT INTO @tempCardinal(RebateDate, BrandRx, ExcludedRx, SourceGenericRx, NonContractGenericRx, OTC, SuppliesOther, NetSourceGenericRx, MonthDate)	
	SELECT dt.RebateDate, dt.BrandRx, dt.ExcludedRx
	, CASE
			WHEN YEAR(dt.RebateDate) < 2020 THEN dt.SourceGenericRx
			ELSE pva.RebateEligibleSourceGenerics
			END AS [SourceGenericRx]
	, dt.NonContractGenericRx, dt.OTC
	, dt.SuppliesOther, ISNULL(pva.NetSourceGenerics, 0.00) AS NetSourceGenerics, dt.MonthDate
	FROM(SELECT c.[Date] AS [RebateDate]
		, c.[AAPBrand] - c.[AAPExcludedFromTotalRx] AS [BrandRx] --brand rx
		, c.[AAPExcludedFromTotalRx] AS [ExcludedRx] --excluded rx
		, c.[AAPGenTotalSrc] AS [SourceGenericRx] --source generic rx	
		, c.AAPTotalRX - c.AAPBrand - c.AAPGENTotalSrc AS [NonContractGenericRx]
		, c.[AAPOTC] AS [OTC]
		, c.AAPNonRXOTCandHH - c.AAPOTC AS [SuppliesOther]
		, DATEPART(MM, c.Date) AS MonthDate
		, c.PMID
		FROM [PharmacyMaster].[dbo].[ALL_Volume] AS [c]
		WHERE ([c].[Date] >= @StartDate) AND ([c].[Date] <= @EndDate) 
		AND EXISTS (SELECT 1 
							FROM @PMIDTable as p
							WHERE p.PMID = c.PMID
					)
		) AS dt
	LEFT OUTER JOIN [PharmacyMaster].[dbo].[CH_ALLPVA_SALES] AS pva ON dt.PMID = pva.PMID
																		AND dt.RebateDate = pva.[Date]

	--Brand Rx
	INSERT INTO @tempCardinalHealthTable 
	SELECT 'Brand Rx' As [RebateType]
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT BrandRx
		, MonthDate
		FROM @tempCardinal
		) AS dt	
	PIVOT(SUM(BrandRx)
			FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
			) AS p
	CROSS JOIN(SELECT SUM(BrandRx) AS Annual
				FROM @tempCardinal	
					) AS cj

	--Excluded Rx
	INSERT INTO @tempCardinalHealthTable 
	SELECT 'Excluded Rx' As [RebateType]
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT ExcludedRx
		, MonthDate
		FROM @tempCardinal
		) AS dt	
	PIVOT(SUM(ExcludedRx)
			FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
			) AS p
	CROSS JOIN(SELECT SUM(ExcludedRx) AS Annual
				FROM @tempCardinal	
					) AS cj

	--Source Generic Rx
	INSERT INTO @tempCardinalHealthTable 
	SELECT 'Source Generic Rx' As [RebateType]
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT SourceGenericRx
		, MonthDate
		FROM @tempCardinal
		) AS dt	
	PIVOT(SUM(SourceGenericRx)
			FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
			) AS p
	CROSS JOIN(SELECT SUM(SourceGenericRx) AS Annual
				FROM @tempCardinal	
					) AS cj

	--Non Contract Generic Rx
	INSERT INTO @tempCardinalHealthTable 
	SELECT 'Non Contract Generic Rx' As [RebateType]
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT NonContractGenericRx
		, MonthDate
		FROM @tempCardinal
		) AS dt	
	PIVOT(SUM(NonContractGenericRx)
			FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
			) AS p
	CROSS JOIN(SELECT SUM(NonContractGenericRx) AS Annual
				FROM @tempCardinal	
					) AS cj

	--OTC
	INSERT INTO @tempCardinalHealthTable 
	SELECT 'OTC' As [RebateType]
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT OTC
		, MonthDate
		FROM @tempCardinal
		) AS dt	
	PIVOT(SUM(OTC)
			FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
			) AS p
	CROSS JOIN(SELECT SUM(OTC) AS Annual
				FROM @tempCardinal	
					) AS cj

	--Net Source Generic Rx
	INSERT INTO @tempCardinalHealthTable 
	SELECT 'Net Source Generic Rx' AS RebateType
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT NetSourceGenericRX
			, MonthDate
			FROM @tempCardinal
			) AS dt	
	PIVOT(SUM(NetSourceGenericRX)
		   FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
		  ) AS p
	CROSS JOIN(SELECT SUM(NetSourceGenericRX) AS Annual
				FROM @tempCardinal	
				) AS cj


	--Supplies/Other
	INSERT INTO @tempCardinalHealthTable 
	SELECT 'Other' As [RebateType]
	, p.[1] AS Jan
	, p.[2] AS Feb
	, p.[3] AS Mar
	, p.[4] AS Apr
	, p.[5] AS May
	, p.[6] AS Jun
	, p.[7] AS Jul
	, p.[8] AS Aug
	, p.[9] AS Sep
	, p.[10] AS Oct
	, p.[11] AS Nov
	, p.[12] AS [Dec]
	, cj.Annual
	FROM(SELECT SuppliesOther
		, MonthDate
		FROM @tempCardinal
		) AS dt	
	PIVOT(SUM(SuppliesOther)
			FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
			) AS p
	CROSS JOIN(SELECT SUM(SuppliesOther) AS Annual
				FROM @tempCardinal	
					) AS cj


	/*---------------------------
		Cardinal Health Totals
	----------------------------*/
	SELECT @CardinalHealthTotal = SUM([Annual]) 
	FROM @tempCardinalHealthTable

	INSERT INTO @tempOverAllMonthlyTotalTable 
	SELECT SUM([Jan]) AS [Jan],
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

	INSERT INTO @tempCardinalHealthTable 
	SELECT 'Total Purchases' As [RebateType],
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

	INSERT INTO @tempOverAllMonthlyTotalRollUpTable 
	SELECT SUM([Jan]) AS [Jan],
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
	SELECT * 
	FROM @tempAPITable AS [API]

	SELECT * 
	FROM @tempCardinalHealthTable AS [CardinalHealth]

	SELECT * 
	FROM @tempOverAllMonthlyTotalRollUpTable AS [MonthlyOverAllTotal]

	SELECT * 
	FROM @tempOverAllTotalTable AS [OverAllTotal]

END










GO
