USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_CHRebates_OLD]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate Rebate from Bruces Import
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_CHRebates_OLD]
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
INSERT INTO PharmacyMaster..pm_rebates_Chaap ( date,pmid,PrimaryCANo,Division,APIAccountNo,AccountName ,
ExtendedSales,AAPVolumeAdminFee,BusCls,Affiliate,
AAPVolumeAdminFeePaidToAffiliate,BrandRxSales,SourceGenericSales,
ExcludedGenericSales,TotalGenericSales,
AAPGenericAdminFee,AAPGenericAdminFeePaidToPipco,GenericRebate,
LeaderRebate,MSIRebate,PayToStore,PayToAffiliateOffice,TotalToPayOut,
TM,PayAccount,EffRebatePerc,HRTA,SortCode,RebateType
)  

SELECT cast('05/01/2011' as datetime) as date,[PMID],[Primary CA#],[Division],[API#],[Account Name], 
[SumOfExtended Sales],[AAP Volume Admin Fee],[Bs Class],[Affiliation],
[Affiliate Admin Fee],[SumOfBrand Rx Sales],[SumOfCCA = AAP Generics 872, 25676, 25677],
[SumOfCCA = 26776 AAP Excluded Generic Rx Prod],[SumOfTotal Generics],
[Est Generic Admin Fee],[Generic Admin Fee -PIPCO only],[Calculated generic rebate],
[Leader Rebate],[MSI Rebate],[Pay to Store],[Pay to Affiliate Office],[Total to Pay Out],
[Territory Manager],[Pay Account],[Effective Rebate%] * 100 as EffRebatePerc,[HRTA] * 100 as HRTA,[Sort Code],
cast('GR' as varchar(20)) as RebateType  from import_CHRebate0511 -- replace with new rebate table

END










GO
