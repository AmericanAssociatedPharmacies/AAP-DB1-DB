USE [WebTest]
GO
/****** Object:  View [dbo].[v_PM_APIMonthlyRebateLetter]    Script Date: 12/22/2020 9:42:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PM_APIMonthlyRebateLetter]
AS
SELECT APIAccountNo,Date,[Rebate Administrator] as Affiliate,
[API Generic Sales] as [API Generic Rx Purchases],[Net Rebate to Store] as [API Generic Rebate],
[API Brand Sales] as [API Brand Rx Purchases],[Brand Credits Disbursed] as [API Brand Rx Incentive Credit Earned],
[Avg Rebate Percentage] as [API Average Generic Rebate],[Check Fee],[A/P Payment Mode] from 
pharmacymaster..PM_Rebates_APIMonthly where date = (select max(date) from pharmacymaster..PM_Rebates_APIMonthly)
GO
