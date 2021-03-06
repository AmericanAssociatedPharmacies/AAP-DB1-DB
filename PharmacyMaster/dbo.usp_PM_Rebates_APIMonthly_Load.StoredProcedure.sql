USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_PM_Rebates_APIMonthly_Load]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[usp_PM_Rebates_APIMonthly_Load]

AS 

SET NOCOUNT ON;

BEGIN

	MERGE PharmacyMaster.[dbo].[PM_Rebates_APIMonthly] AS t
	USING  PharmacyMaster.[Staging].[vw_PM_Rebates_APIMonthly] AS s
	ON(t.Date = s.Date
		AND t.PMID = s.PMID
		--AND t.[APIAccountNo] = s.[APIAccountNo]
		)

	WHEN MATCHED THEN 
	UPDATE 
	SET [API Generic Sales] = s.[API Generic Sales]
		, [API Brand Sales] = s.[API Brand Sales]
		, [API OTC Sales] = s.[API OTC Sales]
		, [API Total Whse Sales] = s.[API Total Whse Sales]
		, [API Whse Gross Rebate] = s.[API Total Whse Sales]
		, [Adjust for Promotions] = s.[Adjust for Promotions]
		, [Adjust for Returns] = s.[Adjust for Returns]
		, [Adjust for Rebate Errors] = s.[Adjust for Rebate Errors]
		, [Generic Admin Fee] = s.[Generic Admin Fee]
		, [API WHSE REBATE for Payout] = s.[API WHSE REBATE for Payout]
		, [Less Negative Rebates] = s.[Less Negative Rebates]
		, [Unpaid Finance Charges] = s.[Unpaid Finance Charges]
		, [Check Fee] = s.[Check Fee]
		, [Held Rebate] = s.[Held Rebate]
		, [Rebate to Pay Acct/Admin] = s.[Rebate to Pay Acct/Admin]
		, [Less Group Admin] = s.[Less Group Admin]
		, [Net Rebate to Store] = s.[Net Rebate to Store]
		, [Brand Credits Disbursed] = s.[Brand Credits Disbursed]
		, [Accelerated Pay Discount] = s.[Accelerated Pay Discount]
		, [Avg Rebate Percentage] = s.[Avg Rebate Percentage]
		, [Previous Month Held Rebate] = s.[Previous Month Held Rebate]
		, [True10Sales] = s.True10Sales
		, [True10Rebate] = s.True10Rebate
		, [AreteRebateFee] = s.AreteRebateFee
		, [APIInstantRebate] = s.[APIInstantRebate]
		, [CalcAPIRebatePercentage] = s.[CalcAPIRebatePercentage]
		, [APIGenericSalesTier1] = s.APIGenericSalesTier1
		, [APIGenericSalesTier2] = s.APIGenericSalesTier2
		, APIGenericRebateTier1 = s.APIGenericRebateTier1
		, APIGenericRebateTier2 = s.APIGenericRebateTier2
		, ConferenceCreditOnePercent = s.ConferenceCreditOnePercent

	WHEN NOT MATCHED THEN
	INSERT([Date], [PMID], [APIAccountNo], [Pharmacy Name], [Business Class], [Rebate Administrator], [API Generic Sales], [API Brand Sales], [API OTC Sales], [API Total Whse Sales]
		, [API Whse Gross Rebate], [Adjust for Promotions], [Adjust for Returns], [Adjust for Rebate Errors], [Generic Admin Fee], [API WHSE REBATE for Payout], [Less Negative Rebates]
		, [Unpaid Finance Charges], [Check Fee], [Held Rebate], [Rebate to Pay Acct/Admin], [Less Group Admin], [Net Rebate to Store], [Pay Account], [Print Rebate Letter]
		, [Brand Credits Disbursed], [Accelerated Pay Discount], [Avg Rebate Percentage], [A/P Payment Mode], [Previous Month Held Rebate], [PostAveRebatePerc], [True10Sales]
		, [True10Rebate], [AreteRebateFee], [APIInstantRebate], [CalcAPIRebatePercentage], [APIGenericSalesTier1], [APIGenericSalesTier2], [APIGenericRebateTier1], [APIGenericRebateTier2]
		, ConferenceCreditOnePercent
		)
	VALUES(s.[Date], s.[PMID], s.[APIAccountNo], s.[Pharmacy Name], s.[Business Class], s.[Rebate Administrator], s.[API Generic Sales], s.[API Brand Sales], s.[API OTC Sales], s.[API Total Whse Sales]
		, s.[API Whse Gross Rebate], s.[Adjust for Promotions], s.[Adjust for Returns], s.[Adjust for Rebate Errors], s.[Generic Admin Fee], s.[API WHSE REBATE for Payout], s.[Less Negative Rebates]
		, s.[Unpaid Finance Charges], s.[Check Fee], s.[Held Rebate], s.[Rebate to Pay Acct/Admin], s.[Less Group Admin], s.[Net Rebate to Store], s.[Pay Account], s.[Print Rebate Letter]
		, s.[Brand Credits Disbursed], s.[Accelerated Pay Discount], s.[Avg Rebate Percentage], s.[A/P Payment Mode], s.[Previous Month Held Rebate], s.[PostAveRebatePerc], s.[True10Sales]
		, s.[True10Rebate], s.[AreteRebateFee], s.[APIInstantRebate], s.[CalcAPIRebatePercentage], s.[APIGenericSalesTier1], s.[APIGenericSalesTier2], s.[APIGenericRebateTier1], s.[APIGenericRebateTier2]
		, s.ConferenceCreditOnePercent
		)
	;

END



GO
