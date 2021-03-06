USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebateReport_backup_RSE_20200502]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		Chris McKinnie
-- Create date: 12/15/2017
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebateReport_backup_RSE_20200502]
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

	--@tempAPIRebate

	/*---------------------------
		Temp Tables
	----------------------------*/
	--Master Tables
	DECLARE @tempAAPTable TABLE ([LastAuditedDate] DATETIME,[RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempAPITable TABLE ([LastAuditedDate] DATETIME,[RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempCardinalHealthTable TABLE ([LastAuditedDate] DATETIME,[RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempOverAllMonthlyTotalTable TABLE ([Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempOverAllMonthlyTotalRollUpTable TABLE ([Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempOverAllTotalTable TABLE (AAPTotal decimal(18,2),APITotal decimal(18,2),CardinalHealthTotal decimal(18,2),Total decimal(18,2))

	--AAP Tables
	DECLARE @tempRebatePreferredPartner TABLE(RebateFor VARCHAR(4),RebateAmount decimal(18,2))
	DECLARE @tempPMAnnualRebate TABLE (Year VARCHAR(4),RebateAmount decimal(18,2))
	DECLARE @tempAreteTable TABLE([RebateDate] DateTime2, [AreteAAPRebate] VARCHAR(50), [AreteAPIRebate] VARCHAR(50))
	DECLARE @tempPatronageDividend TABLE(RebateAmount decimal(18,2))

	--API Tables
	DECLARE @tempAPIRebate TABLE([RebateFor] DateTime2
								, [GAC] decimal(18,2)
								, [InstantRebate] decimal(18,2)
								, [RemainingRebate] decimal(18,2)
								, InstantRebateTier1 MONEY
								, InstantRebateTier2 MONEY
								, RemainingRebateTier1 MONEY
								, RemainingRebateTier2 MONEY
								, ConferenceCredit MONEY
								)
	DECLARE @tempAPIBrand TABLE([CreditFor] DateTime2,[APIBrandRxIncentiveCredit] decimal(18,2))
	DECLARE @tempRebateGenericIncentive TABLE(RebateFor VARCHAR(4),RebateAmount decimal(18,2))
	DECLARE @tempArete2Table TABLE([RebateDate] DateTime2, [AreteAAPRebate] VARCHAR(50), [AreteAPIRebate] VARCHAR(50))

	--Cardinal Health Tables
	DECLARE @tempCardinalHealth TABLE([RebateDate] DateTime2
									, [GenericSales] decimal(18,2)
									, [GenericRebatesAmount] decimal(18,2)
									, LeaderRebate decimal(18,2)
									, CalculatedLeaderRebate decimal(18,2)
									, PriceProtection decimal(18,2)
									, COGRebate MONEY
									)
	DECLARE @tempHighVolumeRebate TABLE([RebateDate] DateTime2, [HighVolumeRebate] decimal(18,2))


	DECLARE @MaxPrefPartnerDate DATETIME
	DECLARE @MaxPlanOGramDate DATETIME
	DECLARE @MaxAAPRebateDate DATETIME
	DECLARE @MaxPatronageDividendDate DATETIME
	DECLARE @MaxBrandCreditsDate DATETIME
	DECLARE @MaxAPIMonthlyRebate DATETIME
	DECLARE @MaxGenericLoyaltyDate DATETIME
	DECLARE @MaxHighVolumeRebate DATETIME

	SELECT @MaxPrefPartnerDate = DATEADD(yy,1,CAST(MAX(Period) + '1201' AS DATETIME))
	FROM pharmacymaster..pm_rebates_ppartner 

	SELECT @MaxPlanOGramDate = DATEADD(yy,1,CAST(MAX(Year) + '1201' AS DATETIME))
		, @MaxPatronageDividendDate = DATEADD(yy,1,CAST(MAX(Year) + '1201' AS DATETIME))
		, @MaxGenericLoyaltyDate = DATEADD(yy,1,CAST(MAX(Year) + '1201' AS DATETIME))
	FROM PharmacyMaster..PM_AnnualRebates

	SELECT @MaxAAPRebateDate = MAX([date])
	FROM pharmacymaster..PM_Rebates_CHAAP

	SELECT @MaxBrandCreditsDate = MAX(CAST(Date AS DATETIME))
	FROM pharmacymaster.dbo.PM_BrandCredits_APIMonthly

	SELECT @MaxAPIMonthlyRebate = MAX(Date)
	FROM pharmacymaster.dbo.PM_Rebates_APIMonthly

	DECLARE @PMIDTable TABLE(PMID INT NOT NULL PRIMARY KEY CLUSTERED)
	
	--
	INSERT INTO @PMIDTable 
	SELECT LinkedPMIDs as PMID
	FROM WebDev.dbo.RebateLinkedPMIDs
	WHERE PMID = @PMID
	UNION ALL 
	SELECT @PMID


	/*******************************
			  AAP Rebates
	********************************/
	/*---------------------------
		Preferred Partners
	----------------------------*/

	--[dbo].[usp_RebatePreferredPartner]
	INSERT INTO @tempRebatePreferredPartner 
	SELECT TOP 1 Period as [RebateFor]
	, CASE 
		WHEN Affiliate = 'PIPCO' THEN ISNULL([PaymentAmt],0) 
		ELSE (ISNULL([Paid To Store],0) + ISNULL([Paid To Affiliate],0)) 
		END as [RebateAmount]
	FROM pharmacymaster..pm_rebates_ppartner AS av
	WHERE EXISTS (SELECT 1 
					FROM @PMIDTable as p
					WHERE p.PMID = av.PMID
				) 
	AND Period = CAST(@previousYear AS VARCHAR(50))
		
	IF ((SELECT COUNT(*) FROM @tempRebatePreferredPartner) > 0)
		BEGIN
			INSERT INTO @tempAAPTable 
			SELECT @MaxPrefPartnerDate AS LastAuditedDate
			, 'Preferred Partner Rebate+' As [RebateType]
			, 0 AS [Jan]
			, 0 AS [Feb]
			, 0 AS [Mar]
			, 0 AS [Apr]
			, 0 AS [May]
			, 0 AS [Jun]
			, 0 AS [Jul]
			, 0 AS [Aug]
			, 0 AS [Sep]
			, 0 AS [Oct]
			, 0 AS [Nov]
			, 0 AS [Dec]
			, CAST(RebateAmount AS decimal(18,2)) AS [Annual]
			FROM @tempRebatePreferredPartner
		END
	ELSE
		BEGIN
			INSERT INTO @tempAAPTable 
			SELECT @MaxPrefPartnerDate AS LastAuditedDate
			, 'Preferred Partner Rebate+' As [RebateType]
			, 0 AS [Jan]
			, 0 AS [Feb]
			, 0 AS [Mar]
			, 0 AS [Apr]
			, 0 AS [May]
			, 0 AS [Jun]
			, 0 AS [Jul]
			, 0 AS [Aug]
			, 0 AS [Sep]
			, 0 AS [Oct]
			, 0 AS [Nov]
			, 0 AS [Dec]
			, 0 AS [Annual]
		END

	/*---------------------------
		Retail Planograms
	----------------------------*/

	--[dbo].[usp_RebatePlanogram]
	INSERT INTO @tempPMAnnualRebate 
	SELECT TOP 1 [Year]
	,[PlanOGramRebate] as [RebateAmount]
	FROM PharmacyMaster..PM_AnnualRebates AS av
	WHERE EXISTS (SELECT 1 
			FROM @PMIDTable as p
			WHERE p.PMID = av.PMID
				) 
	AND [Year] = @previousYear

	IF((SELECT COUNT(*) FROM @tempPMAnnualRebate) > 0)
		BEGIN
			INSERT INTO @tempAAPTable 
			SELECT @MaxPlanOGramDate AS LastAuditedDate
			, 'Retail Planograms Rebate+' As [RebateType]
			, 0 AS [Jan]
			, 0 AS [Feb]
			, 0 AS [Mar]
			, 0 AS [Apr]
			, 0 AS [May]
			, 0 AS [Jun]
			, 0 AS [Jul]
			, 0 AS [Aug]
			, 0 AS [Sep]
			, 0 AS [Oct]
			, 0 AS [Nov]
			, 0 AS [Dec]
			, ISNULL(CAST(RebateAmount AS decimal(18,2)),0) AS [Annual]
			FROM @tempPMAnnualRebate
		END
	ELSE
		BEGIN
			INSERT INTO @tempAAPTable 
			SELECT @MaxPlanOGramDate AS LastAuditedDate
			, 'Retail Planograms Rebate+' As [RebateType]
			, 0 AS [Jan]
			, 0 AS [Feb]
			, 0 AS [Mar]
			, 0 AS [Apr]
			, 0 AS [May]
			, 0 AS [Jun]
			, 0 AS [Jul]
			, 0 AS [Aug]
			, 0 AS [Sep]
			, 0 AS [Oct]
			, 0 AS [Nov]
			, 0 AS [Dec]
			, 0 AS [Annual]
		END

	/*---------------------------
		Arete
	----------------------------*/

	--[dbo].[usp_RebateAretePerformance]
	INSERT INTO @tempAreteTable 
	SELECT [Date] as [RebateDate]
	, CASE 
		WHEN [Arete - AAP Rebate] = -1.0 THEN 0 
		ELSE CAST([Arete - AAP Rebate] AS decimal(18,2)) 
		END AS [AreteAAPRebate]
	, CASE 
		WHEN [Arete - API Rebate] = -1.0 THEN 0 
		ELSE CAST([Arete - AAP Rebate] AS decimal(18,2)) 
		END AS [AreteAPIRebate]
	FROM(SELECT [date]
		,SUM([Arete - AAP Rebate]) AS [Arete - AAP Rebate]
		,SUM([Arete - API Rebate]) AS [Arete - API Rebate]
		FROM(SELECT TOP 12 [date] 
			, ISNULL([AretePerformanceRebate],-1.0) AS [Arete - AAP Rebate] --use negative as a null flag
			, 0 AS [Arete - API Rebate]
			FROM pharmacymaster..PM_Rebates_CHAAP AS av
			WHERE EXISTS (SELECT 1 
						FROM @PMIDTable as p
						WHERE p.PMID = av.PMID
							)  
			AND [date] >= @startDate AND [date] <= @endDate
			ORDER BY [date] DESC

		UNION

		SELECT TOP 12 [date]
		, 0 AS [Arete - AAP Rebate]
		, ISNULL(AreteRebateFee,-1.0) AS [Arete - API Rebate]  --use negative as a null flag
		FROM pharmacymaster..v_web_PM_Rebates_APIMonthly AS av
		WHERE EXISTS (SELECT 1 
						FROM @PMIDTable as p
						WHERE p.PMID = av.PMID
						)  
		AND [date] >= @startDate AND [date] <= @endDate
		ORDER BY [date] DESC
	) dt
		GROUP BY [Date]
	) dt2
		ORDER BY [Date] desc

	INSERT INTO @tempAAPTable 
	SELECT @MaxAAPRebateDate AS [LastAuditedDate]
	, 'Arete Credit' As [RebateType]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Jan]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Feb]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Mar]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Apr]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [May]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Jun]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Jul]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Aug]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Sep]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Oct]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Nov]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Dec]
	, ISNULL(SUM(CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAreteTable


	/*---------------------------
		Patronage Dividend
	----------------------------*/
	INSERT INTO @tempPatronageDividend 
	SELECT SUM([PatronageDividend]) AS PatronageDividend
	FROM dbo.V_PM_AnnualRebates AS av
	WHERE [YEAR] = @previousYear 
	AND EXISTS (SELECT 1 
				FROM @PMIDTable as p
				WHERE p.PMID = av.PMID
				) 

	IF((SELECT COUNT(*) FROM @tempPatronageDividend) > 0)
		BEGIN
			INSERT INTO @tempAAPTable 
			SELECT @MaxPatronageDividendDate AS [LastAuditedDate],
			'Patronage Dividend+' As [RebateType],
			0 AS [Jan],
			0 AS [Feb],
			0 AS [Mar],
			0 AS [Apr],
			0 AS [May],
			0 AS [Jun],
			0 AS [Jul],
			0 AS [Aug],
			0 AS [Sep],
			0 AS [Oct],
			0 AS [Nov],
			0 AS [Dec],
			CAST(RebateAmount AS decimal(18,2)) AS [Annual]
			FROM @tempPatronageDividend
		END
	ELSE
		BEGIN
			INSERT INTO @tempAAPTable SELECT 
			@MaxPatronageDividendDate AS [LastAuditedDate],
			'Patronage Dividend+' As [RebateType],
			0 AS [Jan],
			0 AS [Feb],
			0 AS [Mar],
			0 AS [Apr],
			0 AS [May],
			0 AS [Jun],
			0 AS [Jul],
			0 AS [Aug],
			0 AS [Sep],
			0 AS [Oct],
			0 AS [Nov],
			0 AS [Dec],
			0 AS [Annual]
		END

		
	/*---------------------------
		Totals
	----------------------------*/

	SELECT @AAPTotal =SUM([Annual]) 
	FROM @tempAAPTable

	INSERT INTO @tempOverAllMonthlyTotalTable 
	SELECT 
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
	FROM @tempAAPTable

	INSERT INTO @tempAAPTable 
	SELECT 
	DATEADD(month, DATEDIFF(month, 0, DATEADD(yy, DATEDIFF(yy, 0, @EndDate) + 1, -1)), 0) AS [LastAuditDate],
	'Total Benefits*' As [RebateType],
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
	FROM @tempAAPTable

	--Brand Rx Credit
	INSERT INTO @tempAPIBrand 
	SELECT MAX([Credit For]) [CreditFor]
	, MAX([API Brand Rx Incentive Credit]) AS [APIBrandRxIncentiveCredit]
	FROM (SELECT CAST([Date] AS DATETIME2) as [Credit For]
		, [Brand Credits Disbursed] as [API Brand Rx Incentive Credit]
		FROM pharmacymaster.dbo.v_web_PM_Rebates_APIMonthly AS av
		WHERE [date] >= @startDate 
		AND [date] <= @endDate 
		AND EXISTS (SELECT 1 
					FROM @PMIDTable as p
					WHERE p.PMID = av.PMID
						) 		
		UNION
		SELECT TOP 12 CAST([Date] AS DATETIME2)  as [Credit For]
		, [BrandCredits] as [API Brand Rx Incentive Credit]
		FROM pharmacymaster.dbo.PM_BrandCredits_APIMonthly AS av
		WHERE [date] >= @startDate 
		AND [date] <= @endDate 
		AND EXISTS (SELECT 1 
					FROM @PMIDTable as p
					WHERE p.PMID = av.PMID
						) 
	) dt 
	GROUP BY [Credit For] 
	ORDER BY [Credit For]
	

	/*******************************
			  API Rebates
	********************************/
	--FOR Instant and Monthly Rebates

	--INSERT INTO @tempAPIRebate(RebateFor, GAC, InstantRebate) 
	INSERT INTO @tempAPIRebate(RebateFor, GAC, InstantRebateTier1, InstantRebateTier2, RemainingRebateTier1, ConferenceCredit) 
	SELECT api_reb.Date  As [RebateFor]
	, CASE	
		WHEN @CurrentYear <= '2017' THEN 0 
		ELSE CAST(FLOOR(GAC / 7000) * 26 AS Decimal(18,2)) 
		END  
		AS [GAC]
	, CASE	
		WHEN @CurrentYear <= '2017' THEN 0 
		ELSE APIGenericSalesTier1 * @InstantRebatePercentage 
		END 
		AS [InstantRebateTier1]
	, CASE	
		WHEN @CurrentYear <= '2017' THEN 0 
		ELSE APIGenericSalesTier2 * @InstantRebatePercentage 
		END 
		AS [InstantRebateTier2]
	--, Rebate AS [RemainingRebate]	
	, api_reb.RebateTier1 AS RemainingRebateTier1
	, ISNULL(cc.ConferenceCredit, 0.00) AS ConferenceCredit
	FROM(SELECT  reb.Date
			--, reb.[API Generic Sales] AS [Sales]
			, reb.APIGenericSalesTier1
			, reb.APIGenericSalesTier2
			--, reb.[Net Rebate to Store] AS [Rebate]
			, reb.[Net Rebate to Store] AS RebateTier1 -- Leave this for now until finalzed file from Forrest
			, NULL AS RebateTier2
			, (ISNULL([APIGenericSalesTier1], 0.00) + ISNULL(APIGenericSalesTier2, 0.00)) AS GAC
			FROM [PharmacyMaster].[dbo].[PM_Rebates_APIMonthly] AS reb
			WHERE EXISTS (SELECT 1 
							FROM @PMIDTable as p
							WHERE p.PMID = reb.PMID
								) 
			AND reb.[Date] >= @StartDate 
			AND reb.[Date] <= @EndDate

			UNION

			SELECT api.Date
			, api.APIGenericSalesTier1
			, t2.APIGenericSalesTier2
			, IIF(api.Date >= '20180101',(api.RebateTier1 - ISNULL(bc.APIBrandRxIncentiveCredit,0)), api.RebateTier1) as RebateTier1
			, IIF(t2.Date >= '20180101',(t2.RebateTier2 - ISNULL(bc.APIBrandRxIncentiveCredit,0)), t2.RebateTier2) as RebateTier2
			, ISNULL(api.APIGenericSalesTier1, 0.00) + ISNULL(t2.APIGenericSalesTier2, 0.00) AS GAC
			FROM(SELECT Date
					, APIGenericSalesTier1
					, APIGenericSalesTier1 * (([RebateTier1] / NULLIF(APIGenericSalesTier1,0)) - 0.2) as RebateTier1
					FROM(SELECT DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS Date
							, SUM(IIF(Type = @Type, [ExtSales], 0)) AS APIGenericSalesTier1
							, IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM(FinalRebateAmount)) as RebateTier1
							FROM [API].[dbo].[APISalesDetail] 
							WHERE [WHAccountID] = @ApiAccountNumber
							AND ItemGrp <> 'G06'
							AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) > (SELECT MAX(Date) 
																				   FROM [PharmacyMaster].[dbo].[PM_Rebates_APIMonthly]
																				  ) 
							AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) >= @StartDate 
							AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) <= @EndDate 
							--AND ([Type] = @Type)
							GROUP BY DATEADD(month, DATEDIFF(month, 0, InvDate), 0)
					) as b
				) AS api
			LEFT JOIN @tempAPIBrand as bc ON api.Date = bc.CreditFor
			LEFT OUTER JOIN(SELECT b.Date
							, b.APIGenericSalesTier2
							, b.APIGenericSalesTier2 * (([RebateTier2] / NULLIF(APIGenericSalesTier2,0)) - 0.2) as RebateTier2
							FROM(SELECT DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS Date
									, SUM(IIF(Type = @Type, [ExtSales], 0)) AS APIGenericSalesTier2
									, IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM(FinalRebateAmount)) as RebateTier2
									FROM [API].[dbo].[APISalesDetail] 
									WHERE [WHAccountID] = @ApiAccountNumber
									AND ItemGrp = 'G06'
									AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) > (SELECT MAX(Date) 
																						   FROM [PharmacyMaster].[dbo].[PM_Rebates_APIMonthly]
																						  ) 
									AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) >= @StartDate 
									AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) <= @EndDate 
									--AND ([Type] = @Type)
									GROUP BY DATEADD(month, DATEDIFF(month, 0, InvDate), 0)
								) as b			
							) AS t2 ON api.Date = t2.Date			 
			) as api_reb
	 LEFT OUTER JOIN(SELECT c.Date, CONVERT(MONEY, c.Rebate) AS ConferenceCredit, c.PMID
							FROM PharmacyMaster.dbo.PM_Rebates_Conference AS c
							WHERE Date >= @StartDate
							AND Date <= @EndDate
							AND EXISTS(SELECT 1
										FROM @PMIDTable AS p
										WHERE p.PMID = c.PMID
										)
					) AS cc ON  cc.Date = api_reb.Date

	Order By api_reb.Date ASC

	--Instant Rebate
	INSERT INTO @tempAPITable 
	SELECT @MaxAPIMonthlyRebate AS [LastAuditedDate]
	, 'Generic Rx Instant Rebate Tier 1' AS RebateType
	--'Instant Rebate' As [RebateType],
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 1 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 2 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 3 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 4 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 5 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 6 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 7 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 8 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 9 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 10 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 11 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 12 THEN CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec]
	, ISNULL(SUM(CAST(REPLACE(InstantRebateTier1,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAPIRebate
	--END

	INSERT INTO @tempAPITable 
	SELECT @MaxAPIMonthlyRebate AS [LastAuditedDate]
	, 'Generic Rx Instant Rebate Tier 2' AS RebateType
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 1 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 2 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 3 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 4 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 5 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 6 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 7 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 8 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 9 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 10 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 11 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 12 THEN CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec]
	, ISNULL(SUM(CAST(REPLACE(InstantRebateTier2,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAPIRebate

	--Monthly Rebate
	INSERT INTO @tempAPITable 
	SELECT @MaxAPIMonthlyRebate AS [LastAuditedDate]
	, 'Monthly Rebate Tier 1' As [RebateType]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 1 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 2 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 3 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 4 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 5 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 6 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 7 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 8 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 9 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 10 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 11 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 12 THEN CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec]
	, ISNULL(SUM(CAST(REPLACE(RemainingRebateTier1,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAPIRebate

	--Generic Achievement Credit (GAC)
	IF(@CurrentYear > 2017)
	BEGIN
		INSERT INTO @tempAPITable 
		SELECT @MaxAPIMonthlyRebate AS [LastAuditedDate]
		, 'Generic Achievement Credit (GAC)' As [RebateType]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 1 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 2 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 3 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 4 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 5 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 6 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 7 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 8 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 9 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 10 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 11 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov]
		, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 12 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec]
		, ISNULL(SUM(CAST(REPLACE(GAC,'$','') AS decimal(18,2))), 0) AS [Annual]
		FROM @tempAPIRebate
	END

	INSERT INTO @tempAPITable SELECT 
	@MaxBrandCreditsDate AS [LastAuditDate],
	'Brand Rx Credit' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 1 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 2 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 3 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 4 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 5 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 6 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 7 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 8 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 9 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 10 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 11 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(CreditFor) = 12 THEN CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(APIBrandRxIncentiveCredit,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAPIBrand

	DECLARE @MaxConfCreditDate DATETIME

	SELECT @MaxConfCreditDate = MAX(Date)
	FROM PharmacyMaster.dbo.PM_Rebates_Conference

	INSERT INTO @tempAPITable 
	SELECT @MaxConfCreditDate AS [LastAuditedDate]
	, 'AAP Conference Credit' AS RebateType
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 1 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 2 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 3 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 4 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 5 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 6 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 7 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 8 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 9 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 10 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 11 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov]
	, ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 12 THEN CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec]
	, ISNULL(SUM(CAST(REPLACE(ConferenceCredit,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAPIRebate

	--Generic Loyalty
	INSERT INTO @tempRebateGenericIncentive 
	Select Top 1 [Year] AS [RebateFor],
	[GenericIncentive] as [RebateAmount]
	FROM PharmacyMaster.dbo.PM_AnnualRebates
	WHERE pmid = @PMID 
	AND [Year] = @previousYear

	IF((SELECT COUNT(*) FROM @tempRebateGenericIncentive) > 0)
		BEGIN
			INSERT INTO @tempAPITable SELECT 
			@MaxGenericLoyaltyDate AS [LastAuditedDate],
			'Generic Loyalty Rebate+' As [RebateType],
			0 AS [Jan],
			0 AS [Feb],
			0 AS [Mar],
			0 AS [Apr],
			0 AS [May],
			0 AS [Jun],
			0 AS [Jul],
			0 AS [Aug],
			0 AS [Sep],
			0 AS [Oct],
			0 AS [Nov],
			0 AS [Dec],
			CAST(RebateAmount AS decimal(18,2)) AS [Annual]
			FROM @tempRebateGenericIncentive
		END
	ELSE
		BEGIN
			INSERT INTO @tempAPITable SELECT 
			@MaxGenericLoyaltyDate AS [LastAuditedDate],
			'Generic Loyalty Rebate+' As [RebateType],
			0 AS [Jan],
			0 AS [Feb],
			0 AS [Mar],
			0 AS [Apr],
			0 AS [May],
			0 AS [Jun],
			0 AS [Jul],
			0 AS [Aug],
			0 AS [Sep],
			0 AS [Oct],
			0 AS [Nov],
			0 AS [Dec],
			0 AS [Annual]
		END

	--Arete Credit
	INSERT INTO @tempArete2Table SELECT 
	[Date] as [RebateDate]
	,CASE WHEN [Arete - AAP Rebate] = -1.0 THEN 0 ELSE CAST([Arete - AAP Rebate] AS decimal(18,2)) END AS [AreteAAPRebate]
	,CASE WHEN [Arete - API Rebate] = -1.0 THEN 0 ELSE CAST([Arete - API Rebate] AS decimal(18,2)) END AS [AreteAPIRebate]
	FROM
	(
	SELECT
	[date]
	,SUM([Arete - AAP Rebate]) AS [Arete - AAP Rebate]
	,SUM([Arete - API Rebate]) AS [Arete - API Rebate]

	FROM
	(
		SELECT TOP 12
		[date] 
		,ISNULL([AretePerformanceRebate],-1.0) AS [Arete - AAP Rebate] --use negative as a null flag
		,0 AS [Arete - API Rebate]
		FROM pharmacymaster.dbo.PM_Rebates_CHAAP AS av
		WHERE EXISTS (SELECT 1 
						FROM @PMIDTable as p
						WHERE p.PMID = av.PMID
							) 
		AND [date] >= @startDate AND [date] <= @endDate
		ORDER BY [date] DESC
	UNION

		SELECT TOP 12
		[date]
		,0 AS [Arete - AAP Rebate]
		,ISNULL(AreteRebateFee,-1.0) AS [Arete - API Rebate]  --use negative as a null flag
		FROM
		pharmacymaster.dbo.v_web_PM_Rebates_APIMonthly AS av
		WHERE EXISTS (SELECT 1 
						FROM @PMIDTable as p
						WHERE p.PMID = av.PMID
							) 
		AND [date] >= @startDate AND [date] <= @endDate
		ORDER BY [date] DESC
	) dt
		GROUP BY [Date]
	) dt2
		ORDER BY [Date] desc

	INSERT INTO @tempAPITable 
	SELECT @MaxAPIMonthlyRebate AS [LastAuditedDate],
	'Arete Credit' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(AreteAPIRebate,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempArete2Table

	

	/*---------------------------
		API Totals
	----------------------------*/
	SELECT @APITotal = SUM([Annual]) 
	FROM @tempAPITable

	INSERT INTO @tempOverAllMonthlyTotalTable 
	SELECT 
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

	INSERT INTO @tempAPITable 
	SELECT 
	DATEADD(month, DATEDIFF(month, 0, DATEADD(yy, DATEDIFF(yy, 0, @EndDate) + 1, -1)), 0) AS [LastAuditDate],
	'Total Benefits*' As [RebateType],
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
	--Cardinal Health Data
	INSERT INTO @tempCardinalHealth(RebateDate, GenericSales, GenericRebatesAmount, LeaderRebate, CalculatedLeaderRebate, PriceProtection, COGRebate) 
	SELECT dt.RebateDate, dt.GenericSales, dt.GenericRebateAmount, dt.LeaderRebate, dt.CalculatedLeaderRebate, dt.PriceProtection, dt.COGRebate
	FROM(SELECT top 12
		[Date] AS [RebateDate]
		, [SourceGenericSales] AS [GenericSales]
		--[GenericRebate] AS [GenericRebateAmount]
		--, [GenericRebate] + COGRebate - FloridaPhcyAssocDeduct - NCPAMembershipFee AS [GenericRebateAmount]
		, [GenericRebate] - FloridaPhcyAssocDeduct - NCPAMembershipFee AS [GenericRebateAmount]
		, [LeaderRebate] AS [LeaderRebate]
		, ([SourceGenericSales] / 7000 * 26.00) AS [CalculatedLeaderRebate]
		, isnull([PriceProtectionRebate],0) AS [PriceProtection]
		, ISNULL(COGRebate, 0.00) AS COGRebate
		FROM pharmacymaster..PM_Rebates_CHAAP AS av
		WHERE EXISTS (SELECT 1 
						FROM @PMIDTable as p
						WHERE p.PMID = av.PMID
							) 
		AND [Date] >= @startDate 
		AND [date] <= @endDate
		) AS dt
	--LEFT OUTER JOIN(SELECT cha.Date AS RebateDate, cha.COGEligibleSales, cha.PMID
	--				FROM PharmacyMaster.dbo.CH_ALLPVA_SALES AS cha
	--				WHERE Date >= @StartDate
	--				AND Date <= @EndDate
	--				AND EXISTS(SELECT 1
	--							FROM @PMIDTable AS p
	--							WHERE p.PMID = cha.PMID
	--							)	
	--				) AS pva ON dt.RebateDate = pva.RebateDate

	--Monthly Rebate

	INSERT INTO @tempCardinalHealthTable 
	SELECT
	@MaxAAPRebateDate AS [LastAuditedDate], 
	'Monthly Rebate' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(GenericRebatesAmount,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempCardinalHealth

	--Brand Rx COG Rebate
	INSERT INTO @tempCardinalHealthTable 
	SELECT @MaxAAPRebateDate AS [LastAuditedDate]
	, 'Brand Rx COG Rebate' As [RebateType]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov]
	, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(COGRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec]
	, ISNULL(SUM(CAST(REPLACE(COGRebate,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempCardinalHealth

	--INSERT INTO @tempCardinalHealthTable  
	--SELECT @MaxAPIMonthlyRebate AS [LastAuditedDate]
	--, 'Brand Rx COG Rebate' AS RebateType
	--, ISNULL(p.[1], 0.00) AS Jan
	--, ISNULL(p.[2], 0.00)  AS Feb
	--, ISNULL(p.[3], 0.00)  AS Mar
	--, ISNULL(p.[4], 0.00)  AS Apr
	--, ISNULL(p.[5], 0.00)  AS May
	--, ISNULL(p.[6], 0.00)  AS Jun
	--, ISNULL(p.[7], 0.00)  AS Jul
	--, ISNULL(p.[8], 0.00)  AS Aug
	--, ISNULL(p.[9], 0.00)  AS Sep
	--, ISNULL(p.[10], 0.00)  AS Oct
	--, ISNULL(p.[11], 0.00)  AS Nov
	--, ISNULL(p.[12], 0.00)  AS [Dec]
	--, ISNULL(cj.Annual, 0.00)  AS [Annual]
	--FROM(SELECT DISTINCT MonthOfYear
	--		FROM Reports.dbo.DateDim
	--		WHERE TheDate >= @StartDate
	--		AND TheDate <= @EndDate	
	--	) AS a
	--LEFT OUTER JOIN(SELECT DATEPART(mm, RebateDate) AS MonthDate
	--		, COGRebate
	--		FROM @tempCardinalHealth
	--		) AS dt ON a.MonthOfYear = dt.MonthDate
	--PIVOT(SUM(dt.COGRebate)
	--		FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
	--		) AS p
	--CROSS JOIN(SELECT SUM(COGRebate) AS Annual
	--			FROM @tempCardinalHealth
	--		) AS cj


	--Leader Quarterly Rebate
	INSERT INTO @tempCardinalHealthTable 
	SELECT 
	@MaxAAPRebateDate AS [LastAuditedDate], 
	'Leader Quarterly Rebate' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(LeaderRebate,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempCardinalHealth

	----High Volume Rebate (Hide if no HVR)
	--SELECT  @HighVolume = sum(isnull([high volume incentive],0))
	--FROM pharmacymaster..pm_rebates_highvolume as hv
	--WHERE PMID = @PMID 
	--AND [Date] >= @startDate 
	--AND [Date] <= @endDate
	--AND EXISTS (SELECT 1 
	--					FROM @PMIDTable as p
	--					WHERE p.PMID = hv.PMID
	--						) 
	--GROUP BY [Date]
	--ORDER BY [Date] DESC

	--IF @HighVolume <> 0
	--BEGIN

		--HVR
		INSERT INTO @tempHighVolumeRebate 
		SELECT ISNULL(h.RebateDate, dt.MonthDate) AS RebateDate
		, ISNULL([HighVolumeRebate], dt.HVR) AS HVR
		FROM(SELECT DISTINCT DATEADD(month, DATEDIFF(month, 0, TheDate), 0) AS MonthDate
			, 0.00 AS HVR
			FROM Reports.[dbo].[DateDim]
			WHERE TheDate BETWEEN @StartDate AND @EndDate
		) AS dt
		LEFT OUTER JOIN(SELECT [Date] as [RebateDate]
						, Cast([high volume incentive] AS decimal(18,2)) AS [HighVolumeRebate]
						FROM pharmacymaster.dbo.pm_rebates_highvolume AS av
						WHERE EXISTS (SELECT 1 
										FROM @PMIDTable as p
										WHERE p.PMID = av.PMID
											) 
						AND [Date] >= @startDate 
						AND [Date] <= @endDate
					) AS h ON dt.MonthDate = h.RebateDate
		--ORDER BY [Date]

		SELECT @MaxHighVolumeRebate = MAX(Date)
		FROM pharmacymaster.dbo.pm_rebates_highvolume 

	
		INSERT INTO @tempCardinalHealthTable 
		SELECT @MaxHighVolumeRebate AS [LastAuditedDate]
		, 'High Volume Rebate' As [RebateType]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov]
		, ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec]
		, ISNULL(SUM(CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2))), 0) AS [Annual]
		FROM @tempHighVolumeRebate
	--END

	--Price Protection
	INSERT INTO @tempCardinalHealthTable SELECT 
	@MaxAAPRebateDate AS [LastAuditedDate],
	'Price Protection Rebate' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(PriceProtection,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempCardinalHealth
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
	DATEADD(month, DATEDIFF(month, 0, DATEADD(yy, DATEDIFF(yy, 0, @EndDate) + 1, -1)), 0) AS [LastAuditDate],
	'Total Benefits*' As [RebateType],
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
	INSERT INTO @tempOverAllTotalTable (AAPTotal,APITotal,CardinalHealthTotal,Total) 
										VALUES(@AAPTotal,@APITotal,@CardinalHealthTotal,@AAPTotal + @APITotal + @CardinalHealthTotal)
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
	--SELECT * FROM @tempAAPTable AS AAP
	--SELECT * FROM @tempAPITable AS [API]
	--SELECT * FROM @tempCardinalHealthTable AS [CardinalHealth]
	--SELECT * FROM @tempOverAllMonthlyTotalRollUpTable AS [MonthlyOverAllTotal]
	--SELECT * FROM @tempOverAllTotalTable AS [OverAllTotal]

	SELECT * 
	FROM @tempAAPTable AS AAP

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
