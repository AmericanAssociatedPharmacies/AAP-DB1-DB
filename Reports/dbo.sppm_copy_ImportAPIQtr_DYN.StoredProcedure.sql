USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_copy_ImportAPIQtr_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/28/2011>
-- Description:	Create table from import to production for API WH Quarterly rebates
-- =============================================
CREATE PROCEDURE [dbo].[sppm_copy_ImportAPIQtr_DYN]
(@period varchar(6))
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Update import_APIQuarterly set   [Adjust for Rebate Errors] = 0 where [Adjust for Rebate Errors] is null;

	INSERT into PharmacyMaster..PM_Rebates_APIQuarterly (
			Period,
			PMID,
			[API Acct#],
			[Pharmacy Name],
			[Business Class],
			[Rebate Administrator],
			[API Generic Sales],
			[API Brand Sales],
			[API OTC Sales],
			[API Total Whse Sales],
			[API Whse Gross Rebate],
			[Generic Admin Fee],
			[API WHSE REBATE for Payout],
			[Less Negative Rebates],
			[Unpaid Finance Charges],
			[Donepezil Rebate on Sales out],
			[Rebate to Pay Acct/Admin],
			[Less Group Admin],
			[Net Rebate to Store],
			[Pay Account],
			[Print Rebate Letter],
			[Brand Credits Disbursed],
			[Brand Credit Potential],
			[Accelerated Pay Discount],
			[Avg Rebate Percentage],
			[Adjust for Returns],
			[Adjust for Promotions],
			[Adjust for Rebate Errors]) 
		SELECT @period, 
            PMID,
			[API Acct#],
			[Pharmacy Name],
			[Business Class],
			[Rebate Administrator],
			[API Generic Sales],
			[API Brand Sales],
			[API OTC Sales],
			[API Total Whse Sales],
			[API Whse Gross Rebate],
			[Generic Admin Fee],
			[API WHSE REBATE for Payout],
			[Less Negative Rebates],
			[Unpaid Finance Charges],
			0,
			[Rebate to Pay Acct/Admin],
			[Less Group Admin],
			[Net Rebate to Store],
			[Pay Account],
			[Print Rebate Letter],
			[Brand Credits Disbursed],
			[Brand Credit Potential],
			[Accelerated Pay Discount],
			[Avg Rebate Percentage],
			[Adjust for Returns],
			[Adjust for Promotions],
			[Adjust for Rebate Errors]
			 FROM import_APIQuarterly where pmid != '' and pmid != 'NON' and period = @period

   
--QA below
	
--select sum([API Generic Sales]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([API Generic Sales]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([API Brand Sales]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([API Brand Sales]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([API OTC Sales]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([API OTC Sales]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([API Total Whse Sales]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([API Total Whse Sales]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([API Whse Gross Rebate]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([API Whse Gross Rebate]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Generic Admin Fee]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Generic Admin Fee]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([API WHSE REBATE for Payout]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([API WHSE REBATE for Payout]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Less Negative Rebates]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Less Negative Rebates]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Unpaid Finance Charges]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Unpaid Finance Charges]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Donepezil Rebate on Sales out]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Donepezil Rebate on Sales out]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Rebate to Pay Acct/Admin]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Rebate to Pay Acct/Admin]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Less Group Admin]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Less Group Admin]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Net Rebate to Store]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Net Rebate to Store]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Brand Credits Disbursed]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Brand Credits Disbursed]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Brand Credit Potential]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Brand Credit Potential]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Accelerated Pay Discount]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Accelerated Pay Discount]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Avg Rebate Percentage]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Avg Rebate Percentage]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
--
--select sum([Adjust for Returns]) from PM_Rebates_APIQuarterly where period = '2011Q2'
--select sum([Adjust for Returns]) from import_API2011Q2  where pmid != '' and pmid != 'NON'
END








GO
