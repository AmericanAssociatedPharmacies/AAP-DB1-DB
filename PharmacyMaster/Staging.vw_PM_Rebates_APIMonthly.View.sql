USE [PharmacyMaster]
GO
/****** Object:  View [Staging].[vw_PM_Rebates_APIMonthly]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [Staging].[vw_PM_Rebates_APIMonthly]

AS

SELECT [Date]
, [PMID]
, [APIAccountNo]
, [Pharmacy Name]
, [Business Class]
, [Rebate Administrator]
, [API Generic Sales]
, [API Brand Sales]
, [API OTC Sales]
, [API Total Whse Sales]
, [API Whse Gross Rebate]
, [Adjust for Promotions]
, [Adjust for Returns]
, [Adjust for Rebate Errors]
, [Generic Admin Fee]
, [API WHSE REBATE for Payout]
, [Less Negative Rebates]
, [Unpaid Finance Charges]
, [Check Fee]
, [Held Rebate]
, [Rebate to Pay Acct/Admin]
, [Less Group Admin]
, [Net Rebate to Store]
, [Pay Account]
, [Print Rebate Letter]
, [Brand Credits Disbursed]
, [Accelerated Pay Discount]
, [Avg Rebate Percentage]
, [A/P Payment Mode]
, [Previous Month Held Rebate]
, [PostAveRebatePerc]
, [True10Sales]
, [True10Rebate]
, [AreteRebateFee]
, [APIInstantRebate]
, [CalcAPIRebatePercentage]
, [APIGenericSalesTier1]
, [APIGenericSalesTier2]
, APIGenericRebateTier1
, APIGenericRebateTier2
, ConferenceCreditOnePercent
FROM [Staging].[PM_Rebates_APIMonthly_New]




GO
