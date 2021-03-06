USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_CHRebates]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate Rebate from  Import
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_CHRebates]
(@in_date varchar(10))
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
UPDATE import_CHRebate set [Generic Admin Fee -PIPCO only] = 0 where [Generic Admin Fee -PIPCO only] is null;

INSERT INTO PharmacyMaster..pm_rebates_Chaap ( date,pmid,PrimaryCANo,Division,APIAccountNo,AccountName ,
ExtendedSales,AAPVolumeAdminFee,RxPlusAdminFee,BusCls,Affiliate,
AAPVolumeAdminFeePaidToAffiliate,BrandRxSales,SourceGenericSales,
ExcludedGenericSales,TotalGenericSales,
AAPGenericAdminFee,AAPGenericAdminFeePaidToPipco,GenericRebate,
LeaderRebate,MSIRebate,PayToStore,PayToAffiliateOffice,TotalToPayOut,
TM,PayAccount,EffRebatePerc,HRTA,SortCode,RebateType,[Check Fee],[A/P Payment Mode],PriceProtectionRebate,
AdjustedExtSales,AdjustedGenericSource,PriceProtection,PrescribedWellnessFee,GenericRebateAdjustment,
PriceProtectionAdjustment,NCPAMembershipFee,VolAdminFeeAdj,AffilAdminFeeAdj,GenericAdminFeeAdj,FloridaPhcyAssocDeduct,
AreteEligible,AretePerformanceRebate,TotalRXlessExcludedItems, COGRebate, [COGRebate%], [COGEligibleSales]
)  

SELECT Date,[PMID],[Primary CA#],[Division],[API#],[Account Name], 
[SumOfExtended Sales],[AAP Volume Admin Fee],RxPlusAdminFee,[Bs Class],[Affiliation],
[Affiliate Admin Fee],[SumOfBrand Rx Sales],[SumOfCCA = AAP Generics 872, 25676, 25677],
[SumOfCCA = 26776 AAP Excluded Generic Rx Prod],[SumOfTotal Generics], 
[Est Generic Admin Fee],[Generic Admin Fee -PIPCO only],[Calculated generic rebate], 
[Leader Rebate],[MSI Rebate],[Pay to Store],[Pay to Affiliate Office],[Total to Pay Out],
[Territory Manager],[Pay Account],[Effective Rebate%] * 100 as EffRebatePerc,[HRTA] * 100 as HRTA,[Sort Code],
cast('GR' as varchar(20)) as RebateType ,[Check Fee],[A/P Payment Mode],PriceProtectionRebate,
AdjustedExtSales,AdjustedGenericSource ,PriceProtection,PrescribedWellnessFee,GenericRebateAdjustment,
PriceProtectionAdjustment,NCPAMembershipFee,VolAdminFeeAdj,AffilAdminFeeAdj,GenericAdminFeeAdj,FloridaPhcyAssocDeduct,
AreteEligible,AretePerformanceRebate,TotalRXlessExcludedItems, COGRebate, [COGRebate%], ISNULL([COGEligibleSales], 0.00) AS [COGEligibleSales]
from dbo.import_CHRebate where date = @in_date;

UPDATE import_CHRebate set [Generic Admin Fee -PIPCO only] = 0 where [Generic Admin Fee -PIPCO only] is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set AAPGenericAdminFeePaidToPipco = 0 where AAPGenericAdminFeePaidToPipco is null;

UPDATE PharmacyMaster..pm_rebates_Chaap set ExtendedSales = 0 where ExtendedSales is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set AAPVolumeAdminFee = 0 where AAPVolumeAdminFee is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set RxPlusAdminFee  = 0 where RxPlusAdminFee is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set AAPVolumeAdminFeePaidToAffiliate = 0 where AAPVolumeAdminFeePaidToAffiliate is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set BrandRxSales = 0 where BrandRxSales is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set SourceGenericSales = 0 where SourceGenericSales is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set ExcludedGenericSales = 0 where ExcludedGenericSales is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set TotalGenericSales = 0 where TotalGenericSales is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set AAPGenericAdminFee = 0 where AAPGenericAdminFee is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set GenericRebate = 0 where GenericRebate is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set COGRebate = 0 where COGRebate is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set LeaderRebate = 0 where LeaderRebate is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set MSIRebate = 0 where MSIRebate is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set PayToStore = 0 where PayToStore is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set PayToAffiliateOffice = 0 where PayToAffiliateOffice is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set TotalToPayOut = 0 where TotalToPayOut is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set EffRebatePerc = 0 where EffRebatePerc is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set HRTA = 0 where HRTA is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set IPAGenericAdminFee = 0 where IPAGenericAdminFee  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set ContractPerformanceRebate = 0 where ContractPerformanceRebate  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set PriceProtectionRebate = 0 where PriceProtectionRebate  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set PriceProtection = 0 where PriceProtection  is null;

UPDATE PharmacyMaster..pm_rebates_Chaap set AdjustedExtSales = 0 where AdjustedExtSales  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set AdjustedGenericSource = 0 where AdjustedGenericSource  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set [Check Fee] = 0 where [Check Fee]  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set PrescribedWellnessFee = 0 where PrescribedWellnessFee  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set GenericRebateAdjustment = 0 where GenericRebateAdjustment  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set PriceProtectionAdjustment = 0 where PriceProtectionAdjustment  is null;

UPDATE PharmacyMaster..pm_rebates_Chaap set NCPAMembershipFee = 0 where NCPAMembershipFee  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set VolAdminFeeAdj = 0 where VolAdminFeeAdj  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set AffilAdminFeeAdj = 0 where AffilAdminFeeAdj  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set GenericAdminFeeAdj = 0 where GenericAdminFeeAdj  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set FloridaPhcyAssocDeduct = 0 where FloridaPhcyAssocDeduct  is null;
--AreteEligible,AretePerformanceRebate,TotalRXlessExcludedItems

UPDATE PharmacyMaster..pm_rebates_Chaap set AretePerformanceRebate = 0 where AretePerformanceRebate  is null;
UPDATE PharmacyMaster..pm_rebates_Chaap set TotalRXlessExcludedItems = 0 where TotalRXlessExcludedItems  is null;
--EXEC dbo.sppm_populate_Purchases_CHRebates @in_date 

END












GO
