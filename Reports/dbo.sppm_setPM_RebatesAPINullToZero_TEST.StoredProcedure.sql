USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_setPM_RebatesAPINullToZero_TEST]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/07/2015>
-- Description:	When Insertimg the PM_Rebates_APIMonthly_Test through UI need to set null to zero
-- =============================================
CREATE PROCEDURE [dbo].[sppm_setPM_RebatesAPINullToZero_TEST]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
UPDATE Reports..PM_Rebates_APIMonthly_Test set [API Generic Sales] = 0 where [API Generic Sales] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [API Brand Sales] = 0  where [API Brand Sales]  is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [API OTC Sales]   = 0 where [API OTC Sales]  is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [API Total Whse Sales]  = 0 where [API Total Whse Sales] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [API Whse Gross Rebate]  = 0 where [API Whse Gross Rebate] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Adjust for Promotions]  = 0 where [Adjust for Promotions] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Adjust for Returns]  = 0 where  [Adjust for Returns]  is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Adjust for Rebate Errors]  = 0  where  [Adjust for Rebate Errors]  is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Generic Admin Fee]  = 0 where [Generic Admin Fee] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [API WHSE REBATE for Payout] = 0  where [API WHSE REBATE for Payout] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Less Negative Rebates]  = 0 where [Less Negative Rebates]  is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Unpaid Finance Charges]  = 0 where [Unpaid Finance Charges]  is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Check Fee]  = 0 where [Check Fee] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Held Rebate]  = 0 where [Held Rebate]  is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Rebate to Pay Acct/Admin] = 0  where [Rebate to Pay Acct/Admin] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Less Group Admin]  = 0 where [Less Group Admin] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Net Rebate to Store]  = 0 where  [Net Rebate to Store] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Brand Credits Disbursed]  = 0 where  [Brand Credits Disbursed] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Accelerated Pay Discount]  = 0 where [Accelerated Pay Discount]  is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Avg Rebate Percentage]  = 0 where  [Avg Rebate Percentage] is null;
UPDATE Reports..PM_Rebates_APIMonthly_Test set [Previous Month Held Rebate]  = 0 where [Previous Month Held Rebate]  is null;

END








GO
