USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vw_RebatesCHAAP_PVASales]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_RebatesCHAAP_PVASales]

AS


SELECT pm.Date 
, pm.PMID
, pm.PrimaryCANo
, pm.Division
, pm.APIAccountNo
, pm.AccountName
, pm.ExtendedSales
, pm.AAPVolumeAdminFee
, pm.RxPlusAdminFee
, pm.Affiliate
, pm.BusCls
, pm.AAPVolumeAdminFeePaidToAffiliate
, pm.BrandRxSales
, pm.SourceGenericSales
, pm.ExcludedGenericSales
, pm.TotalGenericSales
, pm.AAPGenericAdminFee
, pm.AAPGenericAdminFeePaidToPipco
, pm.IPAGenericAdminFee
, pm.ContractPerformanceRebate
, pm.GenericRebate
, pm.LeaderRebate
, pm.MSIRebate
, pm.PayToStore
, pm.PayToAffiliateOffice
, pm.TotalToPayOut
, pm.TM, pm.PayAccount
, pm.EffRebatePerc
, pm.HRTA
, pm.SortCode
, pm.RebateType
, pm.[Check Fee]
, pm.[A/P Payment Mode]
, pm.PriceProtectionRebate
, pm.AdjustedExtSales
, pm.AdjustedGenericSource
, pm.PriceProtection
, pm.PrescribedWellnessFee
, pm.GenericRebateAdjustment
, pm.PriceProtectionAdjustment
, pm.VolAdminFeeAdj
, pm.AffilAdminFeeAdj
, pm.GenericAdminFeeAdj
, pm.NCPAMembershipFee
, pm.FloridaPhcyAssocDeduct
, pm.AreteEligible
, pm.AretePerformanceRebate
, pm.TotalRXlessExcludedItems
, pm.COGRebate
, pm.[COGRebate%]
, pm.COGEligibleSales
, c.Date AS PVADate
, ISNULL(c.NetSourceGenerics,0.00) AS NetSourceGenerics
FROM pharmacymaster.dbo.pm_rebates_chaap AS pm
LEFT OUTER JOIN [PharmacyMaster].[dbo].[CH_ALLPVA_SALES] AS c ON pm.PMID = c.PMID			
																AND pm.Date = c.Date
--WHERE pm.Date >= '20190101'
GO
