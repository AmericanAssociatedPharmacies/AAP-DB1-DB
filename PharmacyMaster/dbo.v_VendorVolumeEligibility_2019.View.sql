USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_VendorVolumeEligibility_2019]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[v_VendorVolumeEligibility_2019]
AS
SELECT dbo.VendorVolumeRebate.ID, dbo.VendorVolumeRebate.VendorID, dbo.VendorVolumeRebate.PMID, dbo.VendorVolumeRebate.UDNo, dbo.VendorVolumeRebate.StoreName, dbo.VendorVolumeRebate.VolumeAmt, 
dbo.VendorVolumeRebate.RebateAmt, dbo.VendorVolumeRebate.AccruedStartdt, dbo.VendorVolumeRebate.AccruedEnddt, dbo.VendorVolumeRebate.FileID, dbo.VendorVolumeRebate.TransactionID, 
dbo.VendorVolumeRebate.Eligibility, dbo.VendorVolumeRebate.PayTo, dbo.PPStores.AAPAccountNo, dbo.PPStores.NCPDP, dbo.PPStores.DEA, dbo.PPStores.AccountName, dbo.PPStores.Addr1, 
dbo.PPStores.Addr2, dbo.PPStores.City, dbo.PPStores.State, CONVERT(varchar, dbo.PPStores.AAPQuitDate, 101) AS AAPQuitDate, dbo.PPStores.PMParentID, dbo.PPStores.Zip, dbo.PPStores.AAPParentNo, 
dbo.VendorVolumeRebate.Affiliate, dbo.VendorVolumeRebate.StorePaidDt, dbo.PPStores.Affiliate AS PMAffiliate, dbo.Partners.VendorName, CASE WHEN RebateReportDisplayName IS NULL 
THEN VendorName ELSE RebateReportDisplayName END AS ReportVendorName, dbo.PPStores.PMID AS PMPMID
FROM dbo.VendorVolumeRebate 
LEFT OUTER JOIN dbo.Partners ON dbo.VendorVolumeRebate.VendorID = dbo.Partners.VendorID 
LEFT OUTER JOIN dbo.PPStores ON dbo.VendorVolumeRebate.PMID = dbo.PPStores.PMID
WHERE        (dbo.VendorVolumeRebate.StorePaidDt is null) AND (dbo.VendorVolumeRebate.PMID IS NOT NULL)
--WHERE        (YEAR(dbo.VendorVolumeRebate.AccruedStartdt) = 2018) AND (dbo.VendorVolumeRebate.PMID IS NOT NULL)





GO
