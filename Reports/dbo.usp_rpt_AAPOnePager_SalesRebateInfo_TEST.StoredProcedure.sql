USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_rpt_AAPOnePager_SalesRebateInfo_TEST]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO










CREATE PROCEDURE [dbo].[usp_rpt_AAPOnePager_SalesRebateInfo_TEST]
	@PMID INT
	
AS
SET NOCOUNT ON;
	
	/*
	Variables
	*/
	DECLARE @StartDate DATETIME
	, @EndDate DATETIME
	, @APIAccountNumber VARCHAR(15)
	, @Type VARCHAR(15)
	, @InstantRebatePercentage DECIMAL(18,4)
	, @AuditedAPISales DATETIME
	, @AuditedAPIRebates DATETIME
	, @AuditedCAHSales DATETIME
	, @AuditedCAHRebate DATETIME
	, @AuditedBrandCredits DATETIME

	/*
	Set Max dates for sales and rebates
	*/
	SELECT @AuditedAPISales = MAX(Date) FROM PharmacyMaster.dbo.ALL_Volume WHERE WHAPITotal <> 0
	SELECT @AuditedAPIRebates = MAX(Date) FROM PharmacyMaster.dbo.PM_Rebates_APIMonthly
	SELECT @AuditedCAHSales = MAX(Date) FROM PharmacyMaster.dbo.ALL_Volume WHERE AAPTotalRX <> 0
	SELECT @AuditedCAHRebate = MAX(Date) FROM PharmacyMaster.dbo.PM_Rebates_CHAAP
	SELECT @AuditedBrandCredits = MAX(CAST(Date AS DATETIME)) FROM PharmacyMaster.dbo.PM_BrandCredits_APIMonthly

	/*
	Table for linked PMIDs
	*/
	DECLARE @PMIDTable TABLE(PMID INT NOT NULL PRIMARY KEY CLUSTERED)

	/*
	Final Results
	*/
	DECLARE @ResultsTable TABLE (PMID INT NOT NULL, Date DATETIME NOT NULL
		, CAHBrandRx MONEY, CAHExcludedRx MONEY, CAHSourceGenericRx MONEY, CAHNonContractGenericRx MONEY, CAHOTC MONEY, CAHSuppliesOther MONEY, CAHTotalSales MONEY, CAHGCRPercent DECIMAL(18,4), Audited_CAHSales VARCHAR(1)
		, CAHGenericRebate MONEY, CAHGenRebPerc DECIMAL(18,4), Audited_CAHGenReb VARCHAR(1)
		, APIBrandRx MONEY, APIGenericRx MONEY, APIOTC MONEY, APIGACCredit MONEY, APITotalSales MONEY, Audited_APISales VARCHAR(1)
		, APIInstantRebate MONEY, APIGenericRebate MONEY, APIGenRebPerc DECIMAL(18,4), Audited_APIGenReb VARCHAR(1)
		, APIBrandCredit MONEY, Audited_APIBrandCredit VARCHAR(1))

	/*
	SET API Account Number
	*/
	SELECT TOP 1 @ApiAccountNumber = LEFT([APIAccountNo], 8)
	FROM [PharmacyMaster].[dbo].PM_Pharmacy 
	WHERE [PMID] = @PMID

	/*
	SET Start and End Dates
	*/
	IF @APIAccountNumber IS NOT NULL
	BEGIN
		SELECT @EndDate = MAX(InvDate) FROM API.dbo.APISalesDetail WHERE WHAccountID = @APIAccountNumber AND Type in ('Brand', 'Generic', 'OTC')
		SET @StartDate = DATEADD(mm, -3, DATEADD(month, DATEDIFF(month, 0, @EndDate), 0))
	END
	ELSE
	BEGIN
		SELECT @EndDate = MAX(Inv_Date) FROM Purchases.dbo.CHPH_AAP WHERE PMID = @PMID 
		-- TO make this to 4 months change the -2 to -3 
		SET @StartDate = DATEADD(mm, -3, DATEADD(month, DATEDIFF(month, 0, @EndDate), 0))
	END

	/*
	SET Type and Rebate Percent
	*/
	SET @Type = 'Generic'
	SET @InstantRebatePercentage = 0.2

	/*
	Fill the PMID table for Linked PMIDs
	*/
	INSERT INTO @PMIDTable 
	SELECT LinkedPMIDs as PMID
	FROM WebDev.dbo.RebateLinkedPMIDs
	WHERE PMID = @PMID
	UNION ALL 
	SELECT @PMID

	/*
	Populate results table with PMID and dates
	*/
	INSERT INTO @ResultsTable (PMID, Date)
	VALUES (@PMID, @EndDate), (@PMID, DATEADD(mm, -1, DATEADD(month, DATEDIFF(month, 0, @EndDate), 0))), (@PMID, @StartDate)
	

	/*
	CAH Brand Sales
	CAH Generic Sales
	CAH Other Rx
	CAH Total
	*/
	UPDATE rt
	SET CAHBrandRx = ch_sales.BrandRx
		, CAHExcludedRx = ch_sales.ExcludedRx
		, CAHSourceGenericRx = ch_sales.SourceGenericRx
		, CAHNonContractGenericRx = ch_sales.NonContractGenericRx
		, CAHOTC = ch_sales.OTC
		, CAHSuppliesOther = ch_sales.SuppliesOther
		--, CAHTotalSales = ch_sales.AAPTotalSales
		, CAHTotalSales = ch_sales.BrandRx + ch_sales.ExcludedRx + ch_sales.SourceGenericRx + ch_sales.NonContractGenericRx + ch_sales.OTC + ch_sales.SuppliesOther
		, Audited_CAHSales = ch_sales.Audited_CAHSales
	FROM @ResultsTable as rt
	INNER JOIN (SELECT [Date]
				, [AAPBrand] - [AAPExcludedFromTotalRx] AS [BrandRx] --brand rx
				, [AAPExcludedFromTotalRx] AS [ExcludedRx] --excluded rx
				, [AAPGenTotalSrc] AS [SourceGenericRx] --source generic rx
				, AAPTotalRX - AAPBrand - AAPGENTotalSrc AS [NonContractGenericRx]
				, [AAPOTC] AS [OTC]
				, AAPNonRXOTCandHH - AAPOTC AS [SuppliesOther]
				, c.AAPTotalRX as AAPTotalSales
				, 'Y' as Audited_CAHSales
				FROM [PharmacyMaster].[dbo].[ALL_Volume] AS [c]
				WHERE ([c].[Date] >= @StartDate) AND ([c].[Date] <= @EndDate) 
				AND EXISTS (SELECT 1 
									FROM @PMIDTable as p
									WHERE p.PMID = c.PMID
							)
			) as ch_sales
	ON DATEADD(month, DATEDIFF(month, 0, rt.Date), 0) = ch_sales.Date

	/*
	CAH GCR Percent
	*/
	UPDATE rt
	SET rt.CAHGCRPercent = ch_gcr.CAHGCRPercent
	FROM @ResultsTable AS rt
	INNER JOIN (SELECT PMID
					, DATEADD(month, DATEDIFF(month, 0, Date), 0) AS Date
					, AVG(AAPSourceCompliance) AS CAHGCRPercent
				FROM PharmacyMaster.dbo.CH_ALLPVA_SALES 
				WHERE Date >= @StartDate AND Date <= @EndDate
					AND PMID = @PMID
				GROUP BY PMID, DATEADD(month, DATEDIFF(month, 0, Date), 0)
			) AS ch_gcr
	ON rt.PMID = ch_gcr.PMID AND DATEADD(month, DATEDIFF(month, 0, rt.Date), 0) = ch_gcr.Date

	/*
	CAH SOURCE Rebate
	CAH Rebate %
	*/
	UPDATE rt
	SET CAHGenericRebate = ch_reb.GenericRebateAmount
		, CAHGenRebPerc = ch_reb.CAHGenRebPerc
		, Audited_CAHGenReb = ch_reb.Audited_CAHRebate
	FROM @ResultsTable as rt
	INNER JOIN (SELECT [Date]
					, [GenericRebate] + COGRebate - FloridaPhcyAssocDeduct - NCPAMembershipFee AS [GenericRebateAmount]
					, ([GenericRebate] + COGRebate - FloridaPhcyAssocDeduct - NCPAMembershipFee) / NULLIF(SourceGenericSales,0) as CAHGenRebPerc
					, 'Y' as Audited_CAHRebate
				FROM pharmacymaster..PM_Rebates_CHAAP as ch
				WHERE [Date] >= @startDate 
					AND [date] <= @endDate
					AND EXISTS (SELECT 1 
								FROM @PMIDTable as p
								WHERE p.PMID = ch.PMID
						)
			) as ch_reb
	ON DATEADD(month, DATEDIFF(month, 0, rt.Date), 0) = ch_reb.Date

	/*
	API Brand Sales
	API Generic Sales
	API OTC Sales
	API Total Sales
	*/
	UPDATE rt
	SET APIBrandRx = api_sales.APIBrandSales
		, APIGenericRx = api_sales.APIGenericSales
		, APIOTC = api_sales.APIOTCSales
		, APITotalSales = api_sales.APITotalSales
		, APIGACCredit = FLOOR(api_sales.APIGenericSales/ 7000) * 26
		, Audited_APISales = api_sales.Audited_APISales
	FROM @ResultsTable as rt
	INNER JOIN (SELECT ISNULL(dt.CreditFor, f.CreditFor) AS Date
					, ISNULL(dt.APIBrandSales, f.APIBrandSales) AS APIBrandSales
					, ISNULL(dt.APIGenericSales, f.APIGenericSales) as APIGenericSales
					, ISNULL(dt.APIOTCSales, f.APIOTCSales) as APIOTCSales
					, ISNULL(dt.APITotalSales, f.APITotalSales) as APITotalSales
					, ISNULL(dt.Audited_APISales, f.Audited_APISales) as Audited_APISales
				FROM(SELECT Date as [CreditFor]
					, SUM(WHAPIBrand) as [APIBrandSales]
					, SUM(WHAPIGeneric) as APIGenericSales
					, SUM(WHAPIOTC) as APIOTCSales
					, SUM(WHAPITotal) as APITotalSales
					, 'Y' as Audited_APISales
					FROM PharmacyMaster.dbo.ALL_Volume as av
					WHERE Date >= @StartDate 
					AND Date < @EndDate
					AND EXISTS (SELECT 1 
								FROM @PMIDTable as p
								WHERE p.PMID = av.PMID
							)
					GROUP BY Date
					) AS dt
				FULL OUTER JOIN(SELECT SalesFor AS [CreditFor]    
								, SUM(APIBrandRx) as [APIBrandSales]
								, SUM(APIGenericRx) as APIGenericSales
								, SUM(APIOTC) as APIOTCSales
								, SUM(APIBrandRx) + SUM(APIGenericRx) + SUM(APIOTC) as APITotalSales
								, 'N' as Audited_APISales
								FROM (SELECT DATEADD(month, DATEDIFF(month, 0, InvDate), 0) as SalesFor
										, CASE WHEN Type = 'Brand' THEN SUM(ExtSales) ELSE 0 END AS APIBrandRx
										, CASE WHEN Type = 'Generic' THEN SUM(ExtSales) ELSE 0 END AS APIGenericRx
										, CASE WHEN Type = 'OTC' THEN SUM(ExtSales) ELSE 0 END AS APIOTC
										FROM API.dbo.APISalesDetail
										WHERE InvDate >= @startDate AND InvDate <= @endDate
										AND WHAccountID like @ApiAccountNumber + '%'
										GROUP BY DATEADD(month, DATEDIFF(month, 0, InvDate), 0), Type
									) as a
									GROUP BY SalesFor	
								) AS f 
				ON dt.CreditFor = f.CreditFor
			) as api_sales
		ON DATEADD(month, DATEDIFF(month, 0, rt.Date), 0) = api_sales.Date


	/*
	API Generic Rebate %
	API Generic Rebate
	*/
	UPDATE rt
	SET APIInstantRebate = apireb.InstantRebate
		, APIGenericRebate = apireb.RemainingRebate
		, APIGenRebPerc = apireb.APIGenRebPerc
		, Audited_APIGenReb = apireb.Audited_APIRebate
	FROM @ResultsTable as rt
	INNER JOIN (SELECT Date
					, [Sales] * @InstantRebatePercentage AS [InstantRebate]
					, Rebate AS [RemainingRebate]
					, APIGenRebPerc	
					, Audited_APIRebate
				FROM (	SELECT  reb.Date
						, reb.[API Generic Sales] AS [Sales]
						, reb.[Net Rebate to Store] AS [Rebate]
						, reb.CalcAPIRebatePercentage as APIGenRebPerc
						, 'Y' as Audited_APIRebate
						FROM [PharmacyMaster].[dbo].[PM_Rebates_APIMonthly] AS reb
						WHERE (reb.[PMID] = @PMID) 
						AND (reb.[Date] >= @StartDate) 
						AND (reb.[Date] <= @EndDate)
						UNION
						SELECT api.Date
							, api.Sales
							, IIF(api.Date >= '20180101',(Rebate - ISNULL(bc.BrandCredits,0)), Rebate) as Rebate
							, (IIF(api.Date >= '20180101',(api.Rebate + api.InstantRebate - ISNULL(bc.BrandCredits,0)), Rebate)) / NULLIF(api.Sales,0) as APIGenRebPerc
							, 'N' as Audited_APIRebate
						FROM (	SELECT Date
								, Sales
								, [Sales] * (([Rebate] / NULLIF([Sales],0)) - 0.2) as Rebate
								, Sales * 0.2 AS InstantRebate
								FROM (
										SELECT DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS Date
										, SUM(IIF(Type = @Type, [ExtSales], 0)) AS Sales
										, IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM(FinalRebateAmount)) as Rebate
										FROM [API].[dbo].[APISalesDetail] 
										WHERE [WHAccountID] = @ApiAccountNumber
										AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) > (SELECT MAX(Date) FROM [PharmacyMaster].[dbo].[PM_Rebates_APIMonthly]) 
										AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) >= @StartDate 
										AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) <= @EndDate 
										GROUP BY DATEADD(month, DATEDIFF(month, 0, InvDate), 0)
									) as b
							)AS api
					LEFT JOIN ( SELECT Date
									, PMID
									, BrandCredits
								FROM PharmacyMaster.dbo.PM_BrandCredits_APIMonthly as t
								WHERE Date >= @StartDate
								AND Date <= @EndDate
								AND EXISTS (SELECT 1 
											FROM @PMIDTable as p
											WHERE p.PMID = t.PMID
										)
							) as bc
					ON api.Date = bc.Date
				) as api_reb
			) as apireb
	ON DATEADD(month, DATEDIFF(month, 0, rt.Date), 0) = apireb.Date

	/*
	API Brand Credit
	*/
	UPDATE rt
	SET APIBrandCredit = bc.APIBrandRxIncentiveCredit
		, Audited_APIBrandCredit = bc.Audited_BrandCredit
	FROM @ResultsTable as rt
	INNER JOIN (SELECT MAX([Credit For]) AS Date
					, MAX([API Brand Rx Incentive Credit]) [APIBrandRxIncentiveCredit]
					, 'Y' as Audited_BrandCredit
				FROM (
						SELECT  CAST([Date] AS DATETIME2)  as [Credit For]
							, [Brand Credits Disbursed] as [API Brand Rx Incentive Credit]
						FROM pharmacymaster.dbo.v_web_PM_Rebates_APIMonthly as r
						WHERE [date] >= @startDate 
							AND [date] <= @endDate 
							AND EXISTS (SELECT 1 
										FROM @PMIDTable as p
										WHERE p.PMID = r.PMID
									)

						UNION

						SELECT CAST([Date] AS DATETIME2)  as [Credit For],
							[BrandCredits] as [API Brand Rx Incentive Credit]
						FROM pharmacymaster.dbo.PM_BrandCredits_APIMonthly as bc
						WHERE [date] >= @startDate 
							AND [date] <= @endDate 
							AND EXISTS (SELECT 1 
									FROM @PMIDTable as p
									WHERE p.PMID = bc.PMID
								)
					) dt GROUP BY [Credit For] 
				) bc
		ON DATEADD(month, DATEDIFF(month, 0, rt.Date), 0) = bc.Date

		/*
		Set values where NULL
		*/
		UPDATE @ResultsTable SET CAHBrandRx = 0.00 WHERE CAHBrandRx IS NULL 
		UPDATE @ResultsTable SET CAHExcludedRx = 0.00 WHERE CAHExcludedRx IS NULL
		UPDATE @ResultsTable SET CAHSourceGenericRx = 0.00 WHERE CAHSourceGenericRx IS NULL
		UPDATE @ResultsTable SET CAHNonContractGenericRx = 0.00 WHERE CAHNonContractGenericRx IS NULL
		UPDATE @ResultsTable SET CAHOTC = 0.00 WHERE CAHOTC IS NULL
		UPDATE @ResultsTable SET CAHSuppliesOther = 0.00 WHERE CAHSuppliesOther IS NULL
		UPDATE @ResultsTable SET CAHTotalSales = 0.00 WHERE CAHTotalSales IS NULL
		UPDATE @ResultsTable SET CAHGCRPercent = 0.00 WHERE CAHGCRPercent IS NULL
		UPDATE @ResultsTable SET CAHGenericRebate = 0.00 WHERE CAHGenericRebate IS NULL
		UPDATE @ResultsTable SET CAHGenRebPerc = 0.00 WHERE CAHGenRebPerc IS NULL
		UPDATE @ResultsTable SET APIBrandRx = 0.00 WHERE APIBrandRx IS NULL
		UPDATE @ResultsTable SET APIGenericRx = 0.00 WHERE APIGenericRx IS NULL
		UPDATE @ResultsTable SET APIOTC = 0.00 WHERE APIOTC IS NULL
		UPDATE @ResultsTable SET APIGACCredit = 0.00 WHERE APIGACCredit IS NULL
		UPDATE @ResultsTable SET APITotalSales = 0.00 WHERE APITotalSales IS NULL
		UPDATE @ResultsTable SET APIInstantRebate = 0.00 WHERE APIInstantRebate IS NULL
		UPDATE @ResultsTable SET APIGenericRebate = 0.00 WHERE APIGenericRebate IS NULL
		UPDATE @ResultsTable SET APIGenRebPerc = 0.00 WHERE APIGenRebPerc IS NULL
		UPDATE @ResultsTable SET APIBrandCredit = 0.00 WHERE APIBrandCredit IS NULL

		UPDATE @ResultsTable SET Audited_APISales = CASE
														WHEN Date <= @AuditedAPISales THEN 'Y'
														ELSE 'N'
													END
		WHERE Audited_APISales IS NULL

		UPDATE @ResultsTable SET Audited_APIGenReb = CASE
														WHEN Date <= @AuditedAPIRebates THEN 'Y'
														ELSE 'N'
													END
		WHERE Audited_APIGenReb IS NULL

		UPDATE @ResultsTable SET Audited_CAHSales = CASE
														WHEN Date <= @AuditedCAHSales THEN 'Y'
														ELSE 'N'
													END
		WHERE Audited_CAHSales IS NULL

		UPDATE @ResultsTable SET Audited_CAHGenReb = CASE
														WHEN Date <= @AuditedCAHRebate THEN 'Y'
														ELSE 'N'
													END
		WHERE Audited_CAHGenReb IS NULL
		
		UPDATE @ResultsTable SET Audited_APIBrandCredit = CASE
														WHEN Date <= @AuditedBrandCredits THEN 'Y'
														ELSE 'N'
													END
		WHERE Audited_APIBrandCredit IS NULL


	/*
	Display final results
	*/
	SELECT PMID
		, Date
	    , CAHBrandRx
		, CAHExcludedRx
		, CAHSourceGenericRx
		, CAHNonContractGenericRx 
		, CAHOTC
		, CAHSuppliesOther 
		, CAHGCRPercent
		, CAHTotalSales
		, Audited_CAHSales 
		, CAHGenericRebate 
		, CAHGenRebPerc
		, Audited_CAHGenReb  
		, APIBrandRx 
		, APIGenericRx 
		, APIOTC 
		, APIGACCredit
		, APITotalSales 
		, Audited_APISales 
		, APIInstantRebate 
		, APIGenericRebate
		, APIGenRebPerc 
		, Audited_APIGenReb 
		, APIBrandCredit 
		, Audited_APIBrandCredit
	FROM @ResultsTable








GO
