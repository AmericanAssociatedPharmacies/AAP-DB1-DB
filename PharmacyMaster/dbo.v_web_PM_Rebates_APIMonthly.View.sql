USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_web_PM_Rebates_APIMonthly]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE view [dbo].[v_web_PM_Rebates_APIMonthly]
--sum multiple API account numbers
as
select
[Date]
,[PMID]
--      ,[APIAccountNo]
--      ,[Pharmacy Name]
--      ,[Business Class]
--      ,[Rebate Administrator]
,sum([API Generic Sales]) as [API Generic Sales]
,sum([API Brand Sales]) as [API Brand Sales]
,sum([API OTC Sales]) as [API OTC Sales]
,sum([API Total Whse Sales]) as [API Total Whse Sales]
,sum([API Whse Gross Rebate]) as [API Whse Gross Rebate]
,sum([Adjust for Promotions]) as [Adjust for Promotions]
,sum([Adjust for Returns]) as [Adjust for Returns]
,sum([Adjust for Rebate Errors]) as [Adjust for Rebate Errors]
,sum([Generic Admin Fee]) as [Generic Admin Fee]
,sum([API WHSE REBATE for Payout]) as [API WHSE REBATE for Payout]
,sum([Less Negative Rebates]) as [Less Negative Rebates]
,sum([Unpaid Finance Charges]) as [Unpaid Finance Charges]
,sum([Check Fee]) as [Check Fee]
,sum([Held Rebate]) as [Held Rebate]
,sum([Rebate to Pay Acct/Admin]) as [Rebate to Pay Acct/Admin]
,sum([Less Group Admin]) as [Less Group Admin]
,sum([Net Rebate to Store]) as [Net Rebate to Store]
--,sum([Pay Account]) as [Pay Account]
--,sum([Print Rebate Letter]) as [Print Rebate Letter]
,sum([Brand Credits Disbursed]) as [Brand Credits Disbursed]
,sum([Accelerated Pay Discount]) as [Accelerated Pay Discount]
--,avg([Avg Rebate Percentage]) as [Avg Rebate Percentage] --replaced with the following 6/16 per IT Help
,max(case when PostAveRebatePerc like '0.%' then convert(varchar,round(cast(PostAveRebatePerc as float)*100.0,2,1)) else PostAveRebatePerc  end) as [Avg Rebate Percentage]

--,sum([A/P Payment Mode]) as [A/P Payment Mode]
,sum([Previous Month Held Rebate]) as [Previous Month Held Rebate]
,sum([True10Sales]) as [True10Sales]
,sum([True10Rebate]) as [True10Rebate]
,sum([AreteRebateFee]) as [AreteRebateFee]
from dbo.PM_Rebates_APIMonthly
group by [Date],[PMID]



GO
