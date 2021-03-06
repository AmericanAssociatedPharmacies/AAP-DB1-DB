USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebateReport_Delete]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









-- =============================================
-- Author:		Chris McKinnie
-- Create date: 12/15/2017
-- =============================================
CREATE PROCEDURE [dbo].[usp_RebateReport_Delete]
	-- Add the parameters for the stored procedure here
	@PMID Int,
	@PMIDList VARCHAR(50),
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
    DECLARE @ApiAccountNumber VarChar(1000)

		/*SET API Number*/
	SELECT TOP 1 @ApiAccountNumber = [APIAccountNo] FROM [PharmacyMaster].[dbo].PM_Pharmacy WHERE [PMID] = @PMID

	/*---------------------------
		Temp Tables
	----------------------------*/
	--Master Tables
	DECLARE @tempAAPTable TABLE ([RebateID] INT,[RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempAPITable TABLE ([RebateID] INT,[RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
	DECLARE @tempCardinalHealthTable TABLE ([RebateID] INT,[RebateType] VARCHAR(50),[Jan] decimal(18,2),[Feb] decimal(18,2),[Mar] decimal(18,2),[Apr] decimal(18,2),[May] decimal(18,2),[Jun] decimal(18,2),[Jul] decimal(18,2),[Aug] decimal(18,2),[Sep] decimal(18,2),[Oct] decimal(18,2),[Nov] decimal(18,2),[Dec] decimal(18,2),[Annual] decimal(18,2))
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

	/*---------------------------
		Rebate IDs
	----------------------------*/
	DECLARE @PreferredPartnerID INT = 1
		, @PlanOGramID INT = 2
		, @AAPAreteCreditID INT = 3
		, @PatronageDividendID INT = 4
		, @InstantRebateID INT = 5
		, @APIMonthlyRebateID INT = 5
		, @GACID INT = 5
		, @BrandCreditID INT = 6
		, @GenericLoyaltyID INT = 7
		, @LeaderRebateID INT = 8
		, @PriceProtectionID INT = 3
		, @APIAreteCreditID INT = 5
		, @AAPMonthlyRebate INT = 3
		, @TotalID INT = 99

	/*******************************
			  AAP Rebates
	********************************/
	/*---------------------------
		Preferred Partners
	----------------------------*/

	--[dbo].[usp_RebatePreferredPartner]
	INSERT INTO @tempRebatePreferredPartner SELECT TOP 1
	Period as [RebateFor],CASE WHEN Affiliate = 'PIPCO' THEN ISNULL([PaymentAmt],0) ELSE (ISNULL([Paid To Store],0) + ISNULL([Paid To Affiliate],0)) END as [RebateAmount]
	FROM pharmacymaster..pm_rebates_ppartner
	WHERE pmid = @PMID AND Period = CAST(@previousYear AS VARCHAR(50))
		
	IF ((SELECT COUNT(*) FROM @tempRebatePreferredPartner) > 0)
		BEGIN
			INSERT INTO @tempAAPTable SELECT 
			@PreferredPartnerID AS [RebateID],
			'Preferred Partner Rebate+' As [RebateType],
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
			@PreferredPartnerID AS [RebateID],
			'Preferred Partner Rebate+' As [RebateType],
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
	INSERT INTO @tempPMAnnualRebate SELECT TOP 1 [Year],[PlanOGramRebate] as [RebateAmount]
	FROM PharmacyMaster..PM_AnnualRebates
	WHERE pmid = @PMID AND [Year] = @previousYear

	IF((SELECT COUNT(*) FROM @tempPMAnnualRebate) > 0)
		BEGIN
			INSERT INTO @tempAAPTable SELECT 
			@PlanOGramID  AS [RebateID],
			'Retail Planograms Rebate+' As [RebateType],
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
			@PlanOGramID AS [RebateID],
			'Retail Planograms Rebate+' As [RebateType],
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
	INSERT INTO @tempAreteTable SELECT 
	[Date] as [RebateDate]
	,CASE WHEN [Arete - AAP Rebate] = -1.0 THEN 0 ELSE CAST([Arete - AAP Rebate] AS decimal(18,2)) END AS [AreteAAPRebate]
	,CASE WHEN [Arete - API Rebate] = -1.0 THEN 0 ELSE CAST([Arete - AAP Rebate] AS decimal(18,2)) END AS [AreteAPIRebate]
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
		FROM
		pharmacymaster..PM_Rebates_CHAAP
		WHERE pmid = @PMID AND [date] >= @startDate AND [date] <= @endDate
		ORDER BY [date] DESC
	UNION

		SELECT TOP 12
		[date]
		,0 AS [Arete - AAP Rebate]
		,ISNULL(AreteRebateFee,-1.0) AS [Arete - API Rebate]  --use negative as a null flag
		FROM
		pharmacymaster..v_web_PM_Rebates_APIMonthly
		WHERE pmid = @PMID AND [date] >= @startDate AND [date] <= @endDate
		ORDER BY [date] DESC
	) dt
		GROUP BY [Date]
	) dt2
		ORDER BY [Date] desc

	INSERT INTO @tempAAPTable SELECT 
	@AAPAreteCreditID  AS [RebateID],
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
	INSERT INTO @tempPatronageDividend SELECT [PatronageDividend]
	FROM V_PM_AnnualRebates
	WHERE [YEAR] = @previousYear AND [PMID] = @PMID

	IF((SELECT COUNT(*) FROM @tempPatronageDividend) > 0)
		BEGIN
			INSERT INTO @tempAAPTable SELECT 
			@PatronageDividendID  AS [RebateID],
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
			@PatronageDividendID AS [RebateID],
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

	INSERT INTO @tempAAPTable 
	SELECT 
	@TotalID AS RebateID,
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
	INSERT INTO @tempAPIBrand SELECT
	MAX([Credit For]) [CreditFor],
	MAX([API Brand Rx Incentive Credit]) [APIBrandRxIncentiveCredit]
	FROM (
		SELECT  
		CAST([Date] AS DATETIME2)  as [Credit For],
		[Brand Credits Disbursed] as [API Brand Rx Incentive Credit]
		FROM pharmacymaster.dbo.v_web_PM_Rebates_APIMonthly
		WHERE [date] >= @startDate AND [date] <= @endDate AND pmid in (select * from dbo.ufn_CommaListToTable(@PMIDList))
		UNION
		SELECT TOP 12
		CAST([Date] AS DATETIME2)  as [Credit For],
		[BrandCredits] as [API Brand Rx Incentive Credit]
		FROM pharmacymaster.dbo.PM_BrandCredits_APIMonthly
		WHERE [date] >= @startDate AND [date] <= @endDate AND pmid in (select * from dbo.ufn_CommaListToTable(@PMIDList))
	) dt GROUP BY [Credit For] 
	ORDER BY [Credit For]
	

	/*******************************
			  API Rebates
	********************************/
	--FOR Instant and Monthly Rebates

INSERT INTO @tempAPIRebate 
	SELECT Date  As [RebateFor]
	, CASE	WHEN @CurrentYear <= '2017' THEN 0 
			ELSE CAST(FLOOR([Sales] / 7000) * 26 AS Decimal(18,2)) 
		END  AS [GAC]
	, CASE	WHEN @CurrentYear <= '2017' THEN 0 
			ELSE [Sales] * @InstantRebatePercentage 
		END AS [InstantRebate]
	, Rebate AS [RemainingRebate]	
	FROM (	
			SELECT  reb.Date
			, reb.[API Generic Sales] AS [Sales]
			, reb.[Net Rebate to Store] AS [Rebate]
			FROM [PharmacyMaster].[dbo].[PM_Rebates_APIMonthly] AS reb
			WHERE (reb.[PMID] = @PMID) 
			AND (reb.[Date] >= @StartDate) 
			AND (reb.[Date] <= @EndDate)
			UNION
			SELECT api.Date
				, api.Sales
				, IIF(Date >= '20180101',(Rebate - ISNULL(APIBrandRxIncentiveCredit,0)), Rebate) as Rebate
			FROM (	SELECT Date
					, Sales
					, [Sales] * (([Rebate] / [Sales]) - 0.2) as Rebate
					FROM (
							SELECT DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS Date
							, SUM([ExtSales]) AS Sales
							--, IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM([Rebate])) as Rebate
							, IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM([Rebate])-(0.045 * SUM(ExtSales))) as Rebate
							FROM [API].[dbo].[APISalesDetail] 
							WHERE [WHAccountID] = @ApiAccountNumber
							AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) > (SELECT MAX(Date) FROM [PharmacyMaster].[dbo].[PM_Rebates_APIMonthly]) 
							AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) >= @StartDate 
							AND DATEADD(month, DATEDIFF(month, 0, InvDate), 0) <= @EndDate 
							AND ([Type] = @Type)
							GROUP BY DATEADD(month, DATEDIFF(month, 0, InvDate), 0)
						) as b
				)AS api
			LEFT JOIN @tempAPIBrand as bc
			ON api.Date = bc.CreditFor
		) as api_reb
	Order By Date

	--Instant Rebate
	IF @currentYear >= 2018
	BEGIN
		INSERT INTO @tempAPITable SELECT 
		@InstantRebateID  AS [RebateID],
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
	@APIMonthlyRebateID  AS [RebateID],
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
	IF(@CurrentYear > 2017)
	BEGIN
		INSERT INTO @tempAPITable SELECT 
		@GACID  AS [RebateID],
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
	END

		INSERT INTO @tempAPITable SELECT 
	@BrandCreditID  AS [RebateID],
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
	INSERT INTO @tempRebateGenericIncentive Select Top 1
	[Year] AS [RebateFor],
	[GenericIncentive] as [RebateAmount]
	FROM PharmacyMaster.dbo.PM_AnnualRebates
	WHERE pmid = @PMID AND [Year] = @previousYear

	IF((SELECT COUNT(*) FROM @tempRebateGenericIncentive) > 0)
		BEGIN
			INSERT INTO @tempAPITable SELECT 
			@GenericLoyaltyID  AS [RebateID],
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
			@GenericLoyaltyID  AS [RebateID],
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
		FROM
		pharmacymaster.dbo.PM_Rebates_CHAAP
		WHERE pmid = @PMID AND [date] >= @startDate AND [date] <= @endDate
		ORDER BY [date] DESC
	UNION

		SELECT TOP 12
		[date]
		,0 AS [Arete - AAP Rebate]
		,ISNULL(AreteRebateFee,-1.0) AS [Arete - API Rebate]  --use negative as a null flag
		FROM
		pharmacymaster.dbo.v_web_PM_Rebates_APIMonthly
		WHERE pmid = @PMID AND [date] >= @startDate AND [date] <= @endDate
		ORDER BY [date] DESC
	) dt
		GROUP BY [Date]
	) dt2
		ORDER BY [Date] desc

	INSERT INTO @tempAPITable SELECT 
	@APIAreteCreditID AS [RebateID],
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

	INSERT INTO @tempAPITable
	SELECT 
	@TotalID AS RebateID,
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
	INSERT INTO @tempCardinalHealth SELECT top 12
		[Date] AS [RebateDate],
		[SourceGenericSales] AS [GenericSales],
		--[GenericRebate] AS [GenericRebateAmount],
		[GenericRebate] + COGRebate - FloridaPhcyAssocDeduct - NCPAMembershipFee AS [GenericRebateAmount],
		[LeaderRebate] AS [LeaderRebate],
		([SourceGenericSales] / 7000 * 26.00) AS [CalculatedLeaderRebate],
		isnull([PriceProtectionRebate],0) AS [PriceProtection]
		FROM
		pharmacymaster..PM_Rebates_CHAAP
		WHERE pmid = @PMID AND [Date] >= @startDate AND [date] <= @endDate

	--Monthly Rebate
	INSERT INTO @tempCardinalHealthTable SELECT 
	@AAPMonthlyRebate AS [RebateID],
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
	@LeaderRebateID  AS [RebateID],
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

	--High Volume Rebate (Hide if no HVR)
	SELECT  @HighVolume = sum(isnull([high volume incentive],0))
	FROM pharmacymaster..pm_rebates_highvolume
	WHERE PMID = @PMID AND [Date] >= @startDate AND [Date] <= @endDate
	GROUP BY [Date]
	ORDER BY [Date] DESC

	IF @HighVolume <> 0
	BEGIN
		INSERT INTO @tempHighVolumeRebate SELECT
		[Date] as [RebateDate],
		Cast([high volume incentive] AS decimal(18,2)) AS [HighVolumeRebate]
		FROM
		pharmacymaster..pm_rebates_highvolume
		WHERE PMID = @PMID AND [Date] >= @startDate AND [Date] <= @endDate
		ORDER BY [Date]
	
		INSERT INTO @tempCardinalHealthTable (RebateType, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec, Annual)
		SELECT 
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
	@PriceProtectionID  AS [RebateID],
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

	INSERT INTO @tempCardinalHealthTable 
	SELECT 
	@TotalID AS RebateID,
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
	SELECT * FROM @tempAAPTable AS AAP
	SELECT * FROM @tempAPITable AS [API]
	SELECT * FROM @tempCardinalHealthTable AS [CardinalHealth]
	SELECT * FROM @tempOverAllMonthlyTotalRollUpTable AS [MonthlyOverAllTotal]
	SELECT * FROM @tempOverAllTotalTable AS [OverAllTotal]
END








GO
