USE [Reports]
GO
/****** Object:  StoredProcedure [Staging].[usp_KPIDash_Goal3_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [Staging].[usp_KPIDash_Goal3_DataLoad]
AS

SET NOCOUNT ON;

BEGIN 
	
	TRUNCATE TABLE Reports.staging.KPIDash_Goal3;

	--KPI Dashboard Goal 3
	--Each section is a rebate
	--Audited Rebates are loaded first, 
	--then unaudited data is loaded based off max dates from audited data
	--This dashboard is designed for the years 2016-2018
	--Several Rebate Categories have hardcoded numbers

	DECLARE @StartDate2016 DATE
	, @StartDate2017 DATE
	, @StartDate2018 DATE
	, @StartDateCAHRebate DATE
	, @StartDateAPIRebate DATE
	, @EndDate DATE
	, @EndDateForAnnual DATE
	, @StartDateForUnaudAnnual DATE
	, @EndDateForUnaudAnnual DATE
	, @Unaud_GenericIncentive DECIMAL(18,2)
	, @Unaud_PlanOGram2017 DECIMAL(18,2)
	, @Unaud_PlanOGram2018 DECIMAL(18,2)
	, @Unaud_PatDiv DECIMAL(18,2)
	, @Unaud_PrefPart DECIMAL (18,2)

	SET @StartDate2016 = '20160101'
	SET @StartDate2017 = '20170101'
	SET @StartDate2018 = '20180101'
	SET @EndDate = GETDATE()
	SET @EndDateForAnnual = '20161231'--set to end of the year for the most recent year we have audited annual rebates
	SET @StartDateForUnaudAnnual = '20170101' --first of the year, for the year following the max date for annual rebates
	SET @EndDateForUnaudAnnual = '20171231' --end of the year, for the year following the max date for annual rebates

	SET @Unaud_GenericIncentive = 10000000
	SET @Unaud_PlanOGram2017 = 331000
	SET @Unaud_PlanOGram2018 = 375000
	SET @Unaud_PatDiv = 12360000
	SET @Unaud_PrefPart = 450000


	INSERT INTO Reports.staging.KPIDash_Goal3 (Date, RebateType, Audited, Amount)

	--CAH Rebate (Audited)
	SELECT Date
		, 'CAH Rebate' as RebateType
		, 'Y' as Audited
		, SUM(TotalToPayOut) as Amount
	FROM PharmacyMaster.dbo.PM_Rebates_CHAAP as ch
	WHERE Date >= @StartDate2016 and PayAccount = 1
	GROUP BY Date

	UNION 

	--CAH Direct Pay (Audited)
	SELECT Date	
		, 'CAH Direct Pay Rebate' as RebateType
		, 'Y' as Audited
		, SUM(c.GenericRebate) + SUM(c.COGRebate) + SUM(c.PriceProtectionRebate) + SUM(c.GenericRebateAdj) + SUM(c.LeaderRebate) + SUM(c.MSIRebate) as Amount
	FROM  Reports.dbo.import_Rebates_CAHDirect as c
	WHERE Date >= @StartDate2016
	GROUP BY Date

	UNION

	--API Generic Monthly Rebate (Audited)
	SELECT Date
		, 'API Generic Rebate' as RebateType
		, 'Y' as Audited
		, SUM(api.[Rebate to Pay Acct/Admin]) + SUM(api.[Previous Month Held Rebate]) + SUM(api.True10Rebate) + SUM(api.APIInstantRebate) as Amount
	FROM PharmacyMaster.dbo.PM_Rebates_APIMonthly as api
	WHERE Date >= @StartDate2016 AND [Pay Account] = 1
	GROUP BY Date

	UNION

	--High Volume (Audited)
	SELECT Date
		, 'High Volume Rebate' as RebateType
		, 'Y' as Audited
		,SUM(Cast([high volume incentive] AS decimal(18,2))) AS Amount
	FROM pharmacymaster.dbo.pm_rebates_highvolume
	WHERE Date >= @StartDate2016
	GROUP BY [Date]

	UNION

	--API Brand Rx Credits (Audited)
	SELECT CAST(bc.Date as Date) as Date
		, 'API Brand Credits' as RebateType
		, 'Y' as Audited
		, SUM(bc.BrandCredits) as Amount
	FROM pharmacymaster.dbo.PM_BrandCredits_APIMonthly as bc
	WHERE CAST(bc.[date] as date) >= @StartDate2017
	GROUP BY Cast(bc.[Date] as Date)

	UNION

	--Generic Incentive (Audited)
	SELECT d.Date
		, 'API Generic Incentive' as RebateType
		, 'Y' as Audited
		, p.RebateAmount as Amount
	FROM (SELECT  1 as ID
			, DATEADD(MONTH, x.number, @StartDate2016) as date
			FROM    master.dbo.spt_values x
			WHERE   x.type = 'P'        
			AND     x.number <= DATEDIFF(MONTH, @StartDate2016, @EndDateForAnnual)
		) as d
	INNER JOIN (SELECT 1 as ID
				, [Year]
				, SUM(GenericIncentive) / 12 as [RebateAmount]
				FROM PharmacyMaster.dbo.PM_AnnualRebates
				WHERE [Year] >= Year(@StartDate2016) AND [Year] <= YEAR(@EndDateForAnnual)
				GROUP BY [Year]
		) as p 
	ON d.ID = p.ID AND p.[Year] = YEAR(d.Date) 

	UNION

	--Plan O Gram (Audited)
	SELECT d.Date
		, 'Plan O Gram' as RebateType
		, 'Y' as Audited
		, p.RebateAmount as Amount
	FROM (SELECT  1 as ID
			, DATEADD(MONTH, x.number, @StartDate2016) as date
			FROM    master.dbo.spt_values x
			WHERE   x.type = 'P'        
			AND     x.number <= DATEDIFF(MONTH, @StartDate2016, @EndDateForAnnual)
		) as d
	INNER JOIN (SELECT 1 as ID
				, [Year]
				, SUM([PlanOGramRebate]) / 12 as [RebateAmount]
				FROM PharmacyMaster.dbo.PM_AnnualRebates
				WHERE [Year] >= Year(@StartDate2016) AND [Year] <= YEAR(@EndDateForAnnual)
				GROUP BY [Year]
		) as p 
	ON d.ID = p.ID AND p.[Year] = YEAR(d.Date) 

	UNION

	--Preferred Partner (Audited)
	SELECT d.Date
		, 'Preferred Partner' as RebateType
		, 'Y' as Audited
		, p.RebateAmount as Amount
	FROM (SELECT  1 as ID
			, DATEADD(MONTH, x.number, @StartDate2016) as date
			FROM    master.dbo.spt_values x
			WHERE   x.type = 'P'        
			AND     x.number <= DATEDIFF(MONTH, @StartDate2016, @EndDateForAnnual)
		) as d
	INNER JOIN (SELECT 1 as ID
				, Period
				, (SUM([Paid To Store]) + SUM([Paid To Affiliate])) / 12 as [RebateAmount]
				FROM PharmacyMaster.dbo.PM_Rebates_PPartner
				WHERE Period >= CAST(Year(@StartDate2016) as VARCHAR(4)) 
				AND Period <= CAST(YEAR(@EndDateForAnnual) as VARCHAR(4))
				GROUP BY Period
		) as p 
	ON d.ID = p.ID AND p.Period = YEAR(d.Date)
	UNION

	--Patronage Dividend (Audited)
	SELECT d.Date
		, 'Patronage Dividend' as RebateType
		, 'Y' as Audited
		, p.RebateAmount as Amount
	FROM (SELECT  1 as ID
			, DATEADD(MONTH, x.number, @StartDate2016) as date
			FROM    master.dbo.spt_values x
			WHERE   x.type = 'P'        
			AND     x.number <= DATEDIFF(MONTH, @StartDate2016, @EndDateForAnnual)
		) as d
	INNER JOIN (SELECT 1 as ID
				, [Year]
				, SUM(PatronageDividend) / 12 as [RebateAmount]
				FROM PharmacyMaster.dbo.PM_AnnualRebates
				WHERE [Year] >= Year(@StartDate2016) AND [Year] <= YEAR(@EndDateForAnnual)
				GROUP BY [Year]
		) as p 
	ON d.ID = p.ID AND p.[Year] = YEAR(d.Date) 

	--******************************************************
	--UNAUDITED
	--******************************************************

	--set these variables after the audited data has been loaded
	SELECT @StartDateCAHRebate = DATEADD(month,1,DATEADD(month, DATEDIFF(month, 0, MAX(Date)), 0))
	FROM PharmacyMaster.dbo.PM_Rebates_CHAAP 

	SELECT @StartDateAPIRebate = DATEADD(month,1,DATEADD(month, DATEDIFF(month, 0, MAX(Date)), 0))
	FROM PharmacyMaster.dbo.PM_Rebates_APIMonthly

	INSERT INTO Reports.staging.KPIDash_Goal3(Date, RebateType, Audited, Amount)

	--CAH Monthly Rebate (Unaudited)
	SELECT Date
		, 'CAH Rebate' as RebateType
		, 'N' as Audited
		, SUM(ch.EXT_COST * 0.2) as Amount
	FROM (
		SELECT PMID
			, DATEADD(month, DATEDIFF(month, 0, Inv_Date), 0) as Date
			, SUM(EXT_COST) as EXT_COST
		FROM Purchases.dbo.CHPH_AAP as ch
		WHERE Inv_Date >= @StartDateCAHRebate AND Inv_Date < @EndDate
		AND ITEM_TYPE = 'RX' AND BRAND = 'N'
		GROUP BY PMID
			, DATEADD(month, DATEDIFF(month, 0, Inv_Date), 0)) as ch
	INNER JOIN PharmacyMaster.dbo.PM_Pharmacy as pm
	ON ch.PMID = pm.PMID
	GROUP BY Date

	UNION

	--API Monthly Rebate (Unaudited)
	SELECT api.Date
	, api.RebateType
	, api.Audited
	, api.Amount - ISNULL(b.BrandCredits,0) as Amount
	FROM (
		SELECT DATEADD(month, DATEDIFF(month, 0, InvDate), 0) as Date
			, 'API Generic Rebate' as RebateType
			, 'N' as Audited
			, SUM(FinalRebateAmount) as Amount
		FROM API.dbo.APISalesDetail as api
		WHERE InvDate >= @StartDateAPIRebate AND InvDate < @EndDate
		AND Type = 'Generic'
		GROUP BY  DATEADD(month, DATEDIFF(month, 0, InvDate), 0)
	) as api
	LEFT JOIN (SELECT Date, SUM(BrandCredits) as BrandCredits FROM PharmacyMaster.dbo.PM_BrandCredits_APIMonthly GROUP BY Date) as b
	ON api.Date = b.Date


	--SELECT DATEADD(month, DATEDIFF(month, 0, InvDate), 0) as Date
	--	, 'API Generic Rebate' as RebateType
	--	, 'N' as Audited
	--	, SUM(Rebate) as Amount
	--FROM API.dbo.APISalesDetail as api
	--WHERE InvDate >= @StartDateAPIRebate AND InvDate < @EndDate
	--AND Type = 'Generic'
	--GROUP BY  DATEADD(month, DATEDIFF(month, 0, InvDate), 0)

	UNION

	--Generic Achievement Credit (Unaudited)
	SELECT DATEADD(m, DATEDIFF(m, 0, InvDate), 0) as Date
		, 'Generic Achievement Credit' as RebateType
		, 'N' as Audited
		, FLOOR(SUM(ExtSales) / 7000) * 26 as Amount
	FROM API.dbo.APISalesDetail
	WHERE InvDate >= @StartDate2018
	AND Type = 'Generic'
	GROUP BY DATEADD(m, DATEDIFF(m, 0, InvDate), 0)

	UNION

	--Generic Incentive (UnAudited 2017) -- can be removed when we get 2017 annual rebate loaded
	SELECT d.Date
		, 'API Generic Incentive' as RebateType
		, 'N' as Audited
		, p.RebateAmount as Amount
	FROM (SELECT  1 as ID
			, DATEADD(MONTH, x.number, @StartDateForUnaudAnnual) as date
			FROM    master.dbo.spt_values x
			WHERE   x.type = 'P'        
			AND     x.number <= DATEDIFF(MONTH, @StartDateForUnaudAnnual, @EndDateForUnaudAnnual)
		) as d
	INNER JOIN (SELECT 1 as ID
				, @Unaud_GenericIncentive/12 as RebateAmount
		) as p 
	ON d.ID = p.ID 

	UNION

	--Generic Incentive (Unaudited monthly load from Accountin)
	SELECT RebateDate as Date
		, 'API Generic Incentive' as RebateType
		, 'N' as Audited
		, RebateAmount as Amount
	FROM Reports.dbo.KPIDash_Accounting
	WHERE IsValid = 1 
	AND RebateDate >= @StartDate2018
	AND RebateDate < @EndDate
	AND RebateType = 'Generic Incentive'

	UNION

	--Plan O Gram 2017 (UnAudited) --Can be removed once we get Audited 2017 data
	SELECT d.Date
		, 'Plan O Gram' as RebateType
		, 'N' as Audited
		, p.RebateAmount as Amount
	FROM (SELECT  1 as ID
			, DATEADD(MONTH, x.number, @StartDateForUnaudAnnual) as date
			FROM    master.dbo.spt_values x
			WHERE   x.type = 'P'        
			AND     x.number <= DATEDIFF(MONTH, @StartDateForUnaudAnnual, @EndDateForUnaudAnnual)
		) as d
	INNER JOIN (SELECT 1 as ID
				, @Unaud_PlanOGram2017/12 as RebateAmount
		) as p 
	ON d.ID = p.ID

	UNION

	--Plan O Gram 2018 (UnAudited)
	SELECT d.Date
		, 'Plan O Gram' as RebateType
		, 'N' as Audited
		, p.RebateAmount as Amount
	FROM (SELECT  1 as ID
			, DATEADD(MONTH, x.number, @StartDate2018) as date
			FROM    master.dbo.spt_values x
			WHERE   x.type = 'P'        
			AND     x.number <= DATEDIFF(MONTH, @StartDate2018, @EndDate)
		) as d
	INNER JOIN (SELECT 1 as ID
				, @Unaud_PlanOGram2018/12 as RebateAmount
		) as p 
	ON d.ID = p.ID

	UNION

	--Preferred Partner (UnAudited)
	SELECT d.Date
		, 'Preferred Partner' as RebateType
		, 'N' as Audited
		, p.RebateAmount as Amount
	FROM (SELECT  1 as ID
			, DATEADD(MONTH, x.number, @StartDateForUnaudAnnual) as date
			FROM    master.dbo.spt_values x
			WHERE   x.type = 'P'        
			AND     x.number <= DATEDIFF(MONTH, @StartDateForUnaudAnnual, @EndDateForUnaudAnnual)
		) as d
	INNER JOIN (SELECT 1 as ID
				, @Unaud_PrefPart/12 as RebateAmount
		) as p 
	ON d.ID = p.ID 

	UNION

	--Patronage Dividend (UnAudited)
	SELECT d.Date
		, 'Patronage Dividend' as RebateType
		, 'N' as Audited
		, p.RebateAmount as Amount
	FROM (SELECT  1 as ID
			, DATEADD(MONTH, x.number, @StartDateForUnaudAnnual) as date
			FROM    master.dbo.spt_values x
			WHERE   x.type = 'P'        
			AND     x.number <= DATEDIFF(MONTH, @StartDateForUnaudAnnual, @EndDateForUnaudAnnual)
		) as d
	INNER JOIN (SELECT 1 as ID
				, @Unaud_PatDiv/12 as RebateAmount
		) as p 
	ON d.ID = p.ID

	UNION

	--Patronage Dividend (Unaudited monthly load from Accounting)
	SELECT RebateDate as Date
		, 'Patronage Dividend' as RebateType
		, 'N' as Audited
		, RebateAmount as Amount
	FROM Reports.dbo.KPIDash_Accounting
	WHERE IsValid = 1 
	AND RebateDate >= @StartDate2018
	AND RebateDate < @EndDate
	AND RebateType = 'Patronage Dividend'

END







GO
