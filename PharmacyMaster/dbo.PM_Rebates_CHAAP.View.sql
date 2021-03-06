USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[PM_Rebates_CHAAP]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PM_Rebates_CHAAP]

AS


SELECT Date, PMID, PrimaryCANo, Division, APIAccountNo, AccountName, ExtendedSales, AAPVolumeAdminFee, RxPlusAdminFee, Affiliate, BusCls, AAPVolumeAdminFeePaidToAffiliate
, BrandRxSales, SourceGenericSales, ExcludedGenericSales, TotalGenericSales, AAPGenericAdminFee
, AAPGenericAdminFeePaidToPipco, IPAGenericAdminFee, ContractPerformanceRebate, GenericRebate, LeaderRebate, MSIRebate, PayToStore, PayToAffiliateOffice
, TotalToPayOut, TM, PayAccount, EffRebatePerc, HRTA, SortCode, RebateType, [Check Fee], [A/P Payment Mode], PriceProtectionRebate
, AdjustedExtSales, AdjustedGenericSource, PriceProtection, PrescribedWellnessFee, GenericRebateAdjustment, PriceProtectionAdjustment
, VolAdminFeeAdj, AffilAdminFeeAdj, GenericAdminFeeAdj, NCPAMembershipFee, FloridaPhcyAssocDeduct, AreteEligible, AretePerformanceRebate
, TotalRXlessExcludedItems, COGRebate, [COGRebate%], [COGEligibleSales]
FROM dbo.PM_Rebates_CHAAP_New
GO
