USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebateReport_AllPharmacies]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Chris McKinnie
-- Create date: 12/15/2017
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebateReport_AllPharmacies]
	-- Add the parameters for the stored procedure here
	@StartDate DATETIME2,
	@EndDate DATETIME2
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @CurrentYear Int = YEAR(@StartDate)
	DECLARE @PreviousYear Int = @CurrentYear - 1
	DECLARE @InstantRebatePercentage decimal(6,2) = 0.20
	DECLARE @Type VarChar(1000) = 'Generic'
	DECLARE @HighVolume decimal(18,2)
	DECLARE @AAPTotal decimal(18,2) = 0
	DECLARE @APITotal decimal(18,2) = 0
	DECLARE @CardinalHealthTotal decimal(18,2) = 0

    
	/*---------------------------
		Temp Tables
	----------------------------*/
	--Master Tables
	DECLARE @tempAAPTable TABLE ([RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempAPITable TABLE ([RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempCardinalHealthTable TABLE ([RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempOverAllMonthlyTotalTable TABLE ([Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempOverAllMonthlyTotalRollUpTable TABLE ([Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempOverAllTotalTable TABLE (AAPTotal decimal(18,2),APITotal decimal(18,2),CardinalHealthTotal decimal(18,2),Total decimal(18,2))

	--AAP Tables
	DECLARE @tempRebatePreferredPartner TABLE(RebateFor VARCHAR(4),RebateAmount decimal(18,2))
	DECLARE @tempPMAnnualRebate TABLE (Year VARCHAR(4),RebateAmount decimal(18,2))
	DECLARE @tempAreteTable TABLE([RebateDate] DateTime2, [AreteAAPRebate] VARCHAR(50), [AreteAPIRebate] VARCHAR(50))
	DECLARE @tempPatronageDividend TABLE(RebateAmount decimal(18,2))

	--API Tables
	DECLARE @tempAPIRebate TABLE([RebateFor] DateTime2,[GAC] decimal(18,2), [InstantRebate] decimal(18,2), [RemainingRebate] decimal(18,2))
	DECLARE @tempAPIBrand TABLE([CreditFor] DateTime2,[APIBrandRxIncentiveCredit] decimal(18,2))
	DECLARE @tempRebateGenericIncentive TABLE(RebateFor VARCHAR(4),RebateAmount decimal(18,2))
	DECLARE @tempArete2Table TABLE([RebateDate] DateTime2, [AreteAAPRebate] VARCHAR(50), [AreteAPIRebate] VARCHAR(50))

	--Cardinal Health Tables
	DECLARE @tempCardinalHealth TABLE([RebateDate] DateTime2, [GenericSales] decimal(18,2), [GenericRebatesAmount] decimal(18,2), LeaderRebate decimal(18,2),CalculatedLeaderRebate decimal(18,2), PriceProtection decimal(18,2))
	DECLARE @tempHighVolumeRebate TABLE([RebateDate] DateTime2, [HighVolumeRebate] decimal(18,2))

	/*******************************
			  AAP Rebates
	********************************/
	/*---------------------------
		Preferred Partners
	----------------------------*/

	--[dbo].[usp_RebatePreferredPartner]
	INSERT INTO @tempRebatePreferredPartner 
	SELECT Period as [RebateFor]
		,SUM(CASE WHEN Affiliate = 'PIPCO' 
				THEN ISNULL([PaymentAmt],0) 
				ELSE (ISNULL([Paid To Store],0) + ISNULL([Paid To Affiliate],0)) 
			END) as [RebateAmount]
	FROM pharmacymaster.dbo.pm_rebates_ppartner
	WHERE Period = CAST(@CurrentYear AS VARCHAR(50))
	Group By Period
		
	IF ((SELECT COUNT(*) FROM @tempRebatePreferredPartner) > 0)
		BEGIN
			INSERT INTO @tempAAPTable SELECT 
			'Preferred Partner' As [RebateType],
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
			FROM @tempRebatePreferredPartner
		END
	ELSE
		BEGIN
			INSERT INTO @tempAAPTable SELECT 
			'Preferred Partner' As [RebateType],
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
		Retail Planograms
	----------------------------*/

	--[dbo].[usp_RebatePlanogram]
	INSERT INTO @tempPMAnnualRebate 
	SELECT [Year]
		, SUM([PlanOGramRebate]) as [RebateAmount]
	FROM PharmacyMaster.dbo.PM_AnnualRebates
	WHERE [Year] = @CurrentYear
	GROUP BY [Year]

	IF((SELECT COUNT(*) FROM @tempPMAnnualRebate) > 0)
		BEGIN
			INSERT INTO @tempAAPTable SELECT 
			'Retailplanograms.com' As [RebateType],
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
			ISNULL(CAST(RebateAmount AS decimal(18,2)),0) AS [Annual]
			FROM @tempPMAnnualRebate
		END
	ELSE
		BEGIN
			INSERT INTO @tempAAPTable SELECT 
			'Retailplanograms.com' As [RebateType],
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
		Arete
	----------------------------*/

	--[dbo].[usp_RebateAretePerformance]
	INSERT INTO @tempAreteTable 
	SELECT [Date] as [RebateDate]
		,CASE WHEN [Arete - AAP Rebate] = -1.0 THEN 0 ELSE CAST([Arete - AAP Rebate] AS decimal(18,2)) END AS [AreteAAPRebate]
		,CASE WHEN [Arete - API Rebate] = -1.0 THEN 0 ELSE CAST([Arete - AAP Rebate] AS decimal(18,2)) END AS [AreteAPIRebate]
	FROM
	(
	SELECT [date]
		,SUM([Arete - AAP Rebate]) AS [Arete - AAP Rebate]
		,SUM([Arete - API Rebate]) AS [Arete - API Rebate]

	FROM
	(
		SELECT
		[date] 
		,SUM(ISNULL([AretePerformanceRebate],-1.0)) AS [Arete - AAP Rebate] --use negative as a null flag
		,0 AS [Arete - API Rebate]
		FROM
		pharmacymaster.dbo.PM_Rebates_CHAAP
		WHERE [date] >= @startDate AND [date] <= @endDate
		GROUP BY [date]
	UNION

		SELECT
		[date]
		,0 AS [Arete - AAP Rebate]
		,SUM(ISNULL(AreteRebateFee,-1.0)) AS [Arete - API Rebate]  --use negative as a null flag
		FROM
		pharmacymaster.dbo.v_web_PM_Rebates_APIMonthly
		WHERE [date] >= @startDate AND [date] <= @endDate
		GROUP BY [Date]
	) dt
		GROUP BY [Date]
	) dt2
		ORDER BY [Date] desc

	INSERT INTO @tempAAPTable SELECT 
	'Arete Credit' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2)) END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(AreteAAPRebate,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAreteTable


	/*---------------------------
		Patronage Dividend
	----------------------------*/
	INSERT INTO @tempPatronageDividend SELECT SUM([PatronageDividend])
	FROM WebDev.dbo.V_PM_AnnualRebates
	WHERE [YEAR] = @CurrentYear

	IF((SELECT COUNT(*) FROM @tempPatronageDividend) > 0)
		BEGIN
			INSERT INTO @tempAAPTable SELECT 
			'Patronage Dividend' As [RebateType],
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
			'Patronage Dividend' As [RebateType],
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

	SELECT @AAPTotal =SUM([Annual]) FROM @tempAAPTable

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
	FROM @tempAAPTable

	INSERT INTO @tempAAPTable SELECT 
	'Total Rebates/Credits' As [RebateType],
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

	/*******************************
			  API Rebates
	********************************/
	--FOR Instant and Monthly Rebates

	INSERT INTO @tempAPIRebate Select 
	Max([Date]) As [RebateFor],
	--Max([Sales]) AS [Sales],
	--Max([Rebate]) AS [Rebate],
	CASE WHEN @CurrentYear <= '2017' THEN 0 ELSE CAST(FLOOR(Max([Sales])) / 7000 * 26 AS Decimal(18,2)) END   AS [GAC],
	CASE WHEN @CurrentYear <= '2017' THEN 0 ELSE Max([Sales]) * @InstantRebatePercentage END AS [InstantRebate],
	CASE WHEN @CurrentYear <= '2017' THEN Max([Rebate]) ELSE Max([Sales]) * ((Max([Rebate]) / Max([Sales])) - @InstantRebatePercentage) END AS [RemainingRebate]	
FROM (SELECT  
DATEFROMPARTS(Year([Date]), Month([Date]),1)AS [Date], [sd1].[API Generic Sales] AS [Sales], [sd1].[Net Rebate to Store] AS [Rebate]
FROM [PharmacyMaster].[dbo].[PM_Rebates_APIMonthly] AS [sd1]
WHERE ([sd1].[Date] >= @StartDate) AND ([sd1].[Date] <= @EndDate)
UNION
SELECT [sd4].[value] AS [Date], [sd4].[value2] AS [Sales], [sd4].[value22] AS [Rebate]
FROM (
    SELECT [sd3].[value3] AS [value], [sd3].[value] AS [value2], [sd3].[value2] AS [value22]
    FROM (
        SELECT SUM([sd2].[ExtSales]) AS [value], SUM([sd2].[Rebate]) AS [value2], [sd2].[value] AS [value3]
        FROM (
            SELECT [sd1].[InvDate], DATEFROMPARTS(Year([sd1].[InvDate]), Month([sd1].[InvDate]),1) AS [value], [sd1].[ExtSales], [sd1].[Rebate], [sd1].[WHAccountID], [sd1].[Type]
            FROM [API].[dbo].[APISalesDetail] AS [sd1]
            ) AS [sd2]
        WHERE ([sd2].[value] >
		(SELECT TOP 1 [Date] FROM [PharmacyMaster].[dbo].[PM_Rebates_APIMonthly] ORDER BY [Date] DESC)
		) AND ([sd2].[value] >= @StartDate) AND ([sd2].[value] <= @EndDate) AND ([sd2].[Type] = @Type)
        GROUP BY [sd2].[value]
        ) AS [sd3]
    ) AS [sd4]) As Data
	Group By Date
	Order By Date

	--Instant Rebate
	IF @currentYear >= 2018
	BEGIN
		INSERT INTO @tempAPITable SELECT 
		'Instant Rebate' As [RebateType],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 1 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 2 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 3 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 4 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 5 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 6 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 7 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 8 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 9 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 10 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 11 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
		ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 12 THEN CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
		ISNULL(SUM(CAST(REPLACE(InstantRebate,'$','') AS decimal(18,2))), 0) AS [Annual]
		FROM @tempAPIRebate
	END
	--Monthly Rebate
	INSERT INTO @tempAPITable SELECT 
	'Monthly Rebate' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 1 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 2 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 3 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 4 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 5 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 6 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 7 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 8 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 9 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 10 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 11 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 12 THEN CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(RemainingRebate,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAPIRebate
	
	--Generic Achievement Credit (GAC)
	INSERT INTO @tempAPITable SELECT 
	'Generic Achievement Credit (GAC)' As [RebateType],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 1 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 2 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 3 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 4 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 5 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 6 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 7 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 8 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 9 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 10 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 11 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
	ISNULL(SUM(CASE WHEN MONTH(RebateFor) = 12 THEN CAST(REPLACE(GAC,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
	ISNULL(SUM(CAST(REPLACE(GAC,'$','') AS decimal(18,2))), 0) AS [Annual]
	FROM @tempAPIRebate

	--Brand Rx Credit
	INSERT INTO @tempAPIBrand SELECT
	MAX([Credit For]) [CreditFor],
	MAX([API Brand Rx Incentive Credit]) [APIBrandRxIncentiveCredit]
	FROM (
		SELECT  
		CAST([Date] AS DATETIME2)  as [Credit For],
		SUM([Brand Credits Disbursed]) as [API Brand Rx Incentive Credit]
		FROM pharmacymaster.dbo.v_web_PM_Rebates_APIMonthly
		WHERE [date] >= @startDate AND [date] <= @endDate
		GROUP BY [Date]
		UNION
		SELECT TOP 12
		CAST([Date] AS DATETIME2)  as [Credit For],
		SUM([BrandCredits]) as [API Brand Rx Incentive Credit]
		FROM pharmacymaster.dbo.PM_BrandCredits_APIMonthly
		WHERE [date] >= @startDate AND [date] <= @endDate
		GROUP BY [Date]
	) dt GROUP BY [Credit For] 
	ORDER BY [Credit For]
	
	INSERT INTO @tempAPITable SELECT 
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

	--Generic Loyalty
	INSERT INTO @tempRebateGenericIncentive Select 
	[Year] AS [RebateFor],
	SUM([GenericIncentive]) as [RebateAmount]
	FROM PharmacyMaster.dbo.PM_AnnualRebates
	WHERE [Year] = @CurrentYear
	GROUP BY [Year]

	IF((SELECT COUNT(*) FROM @tempRebateGenericIncentive) > 0)
		BEGIN
			INSERT INTO @tempAPITable SELECT 
			'Generic Loyalty' As [RebateType],
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
			'Generic Loyalty' As [RebateType],
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
		SELECT
		[date] 
		,SUM(ISNULL([AretePerformanceRebate],-1.0)) AS [Arete - AAP Rebate] --use negative as a null flag
		,0 AS [Arete - API Rebate]
		FROM
		pharmacymaster.dbo.PM_Rebates_CHAAP
		WHERE [date] >= @startDate AND [date] <= @endDate
		GROUP BY [date]
	UNION

		SELECT
		[date]
		,0 AS [Arete - AAP Rebate]
		,SUM(ISNULL(AreteRebateFee,-1.0)) AS [Arete - API Rebate]  --use negative as a null flag
		FROM
		pharmacymaster.dbo.v_web_PM_Rebates_APIMonthly
		WHERE [date] >= @startDate AND [date] <= @endDate
		GROUP BY [date]
	) dt
		GROUP BY [Date]
	) dt2
		ORDER BY [Date] desc

	INSERT INTO @tempAPITable SELECT 
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
	'Total Rebates/Credits' As [RebateType],
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
	INSERT INTO @tempCardinalHealth SELECT
		[Date] AS [RebateDate],
		SUM([SourceGenericSales]) AS [GenericSales],
		SUM([GenericRebate]) AS [GenericRebateAmount],
		SUM([LeaderRebate]) AS [LeaderRebate],
		SUM(([SourceGenericSales] / 7000 * 26.00)) AS [CalculatedLeaderRebate],
		SUM(isnull([PriceProtectionRebate],0)) AS [PriceProtection]
		FROM
		pharmacymaster.dbo.PM_Rebates_CHAAP
		WHERE [Date] >= @startDate AND [date] <= @endDate
		GROUP BY [Date]

	--Monthly Rebate
	INSERT INTO @tempCardinalHealthTable SELECT 
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

	--Leader Quarterly Rebate
	INSERT INTO @tempCardinalHealthTable SELECT 
	'Leader Quaterly Rebate' As [RebateType],
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

	--High Volume Rebate (Hide if no HVR)
	SELECT  @HighVolume = sum(isnull([high volume incentive],0))
	FROM pharmacymaster.dbo.pm_rebates_highvolume
	WHERE [Date] >= @startDate AND [Date] <= @endDate
	GROUP BY [Date]
	ORDER BY [Date] DESC

	IF @HighVolume <> 0
	BEGIN
		INSERT INTO @tempHighVolumeRebate SELECT
		[Date] as [RebateDate],
		Cast([high volume incentive] AS decimal(18,2)) AS [HighVolumeRebate]
		FROM
		pharmacymaster.dbo.pm_rebates_highvolume
		WHERE [Date] >= @startDate AND [Date] <= @endDate
		ORDER BY [Date]
	
		INSERT INTO @tempCardinalHealthTable SELECT 
		'High Volume Rebate' As [RebateType],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 1 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jan],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 2 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Feb],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 3 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Mar],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 4 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Apr],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 5 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [May],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 6 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jun],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 7 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Jul],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 8 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Aug],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 9 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Sep],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 10 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Oct],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 11 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Nov],
		ISNULL(SUM(CASE WHEN MONTH(RebateDate) = 12 THEN CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2)) ELSE 0 END), 0) AS [Dec],
		ISNULL(SUM(CAST(REPLACE(HighVolumeRebate,'$','') AS decimal(18,2))), 0) AS [Annual]
		FROM @tempHighVolumeRebate
	END

	--Price Protection
	INSERT INTO @tempCardinalHealthTable SELECT 
	'Price Protection' As [RebateType],
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
	'Total Rebates/Credits' As [RebateType],
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
	SELECT * FROM @tempAAPTable AS AAP
	SELECT * FROM @tempAPITable AS [API]
	SELECT * FROM @tempCardinalHealthTable AS [CardinalHealth]
	SELECT * FROM @tempOverAllMonthlyTotalRollUpTable AS [MonthlyOverAllTotal]
	SELECT * FROM @tempOverAllTotalTable AS [OverAllTotal]
END


GO
