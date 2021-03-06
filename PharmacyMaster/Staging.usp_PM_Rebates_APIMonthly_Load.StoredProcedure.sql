USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [Staging].[usp_PM_Rebates_APIMonthly_Load]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [Staging].[usp_PM_Rebates_APIMonthly_Load]

	@Date VARCHAR(20)


AS

SET NOCOUNT ON;

BEGIN

	DECLARE @Date2 DATETIME

	SET @Date2 = CONVERT(DATETIME,@Date)

	TRUNCATE TABLE [Staging].[PM_Rebates_APIMonthly_New];

	INSERT INTO PharmacyMaster.Staging.vw_PM_Rebates_APIMonthly(Date, PMID, APIAccountNo, [Pharmacy Name], [Business Class], [Rebate Administrator], [Pay Account], [Print Rebate Letter], [A/P Payment Mode], PostAveRebatePerc)
	SELECT dt.Date, dt.PMID, dt.APIAccountNo, dt.[Pharmacy Name], dt.[Business Class], dt.[Rebate Administrator], dt.[Pay Account], dt.[Print Rebate Letter], dt.[A/P Payment Mode], dt.PostAveRebatePerc
	FROM(SELECT [Date]
		, CASE
			WHEN [PMID] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
			ELSE [PMID]
			END AS PMID
		, [APIAccountNo]
		, [Pharmacy Name]
		, [Business Class]
		, [Rebate Administrator]
		, CONVERT(INT,[Pay Account]) AS [Pay Account]
		, CONVERT(INT,[Print Rebate Letter]) AS [Print Rebate Letter]
		, [A/P Payment Mode]
		, [PostAveRebatePerc]
		FROM Reports.[dbo].[Import_APIMonthlyRebates]
		WHERE Date = @Date2
		) AS dt
	WHERE dt.PMID IS NOT NULL
	OR PMID <> ''
	

	UPDATE x
	SET [API Generic Sales] = r.[API Generic Sales]
		, [API Brand Sales] = r.[API Brand Sales]
		, [API OTC Sales] = r.[API OTC Sales]
		, [API Total Whse Sales] = r.[API Total Whse Sales]
		, [API Whse Gross Rebate] = r.[API Total Whse Sales]
		, [Adjust for Promotions] = r.[Adjust for Promotions]
		, [Adjust for Returns] = r.[Adjust for Returns]
		, [Adjust for Rebate Errors] = r.[Adjust for Rebate Errors]
		, [Generic Admin Fee] = r.[Generic Admin Fee]
		, [API WHSE REBATE for Payout] = r.[API WHSE REBATE for Payout]
		, [Less Negative Rebates] = r.[Less Negative Rebates]
		, [Unpaid Finance Charges] = r.[Unpaid Finance Charges]
		, [Check Fee] = r.[Check Fee]
		, [Held Rebate] = r.[Held Rebate]
		, [Rebate to Pay Acct/Admin] = r.[Rebate to Pay Acct/Admin]
		, [Less Group Admin] = r.[Less Group Admin]
		, [Net Rebate to Store] = r.[Net Rebate to Store]
		, [Brand Credits Disbursed] = r.[Brand Credits Disbursed]
		, [Accelerated Pay Discount] = r.[Accelerated Pay Discount]
		, [Avg Rebate Percentage] = r.[Avg Rebate Percentage]
		, [Previous Month Held Rebate] = r.[Previous Month Held Rebate]
		, [True10Sales] = r.True10Sales
		, [True10Rebate] = r.True10Rebate
		, [AreteRebateFee] = r.AreteRebateFee
		, [APIInstantRebate] = r.[InstantRebate]
		, [CalcAPIRebatePercentage] = IIF(r.[API Generic Sales] IS NULL OR r.[API Generic Sales] = 0, 0, ((r.[Net Rebate to Store] + r.InstantRebate) / r.[API Generic Sales]))
		, [APIGenericSalesTier1] = r.APIGenericSalesTier1
		, [APIGenericSalesTier2] = r.APIGenericSalesTier2
		, APIGenericRebateTier1 = r.APIGenericRebateTier1
		, APIGenericRebateTier2 = r.APIGenericRebateTier2
		, ConferenceCreditOnePercent = r.ConferenceCreditOnePercent
	FROM PharmacyMaster.Staging.vw_PM_Rebates_APIMonthly AS x
	INNER JOIN Reports.[dbo].[Import_APIMonthlyRebates] AS r ON x.APIAccountNo = r.APIAccountNo
																AND x.[Date] =  r.[Date]
																AND x.PMID = r.PMID
	WHERE r.Date = @Date2


END






GO
