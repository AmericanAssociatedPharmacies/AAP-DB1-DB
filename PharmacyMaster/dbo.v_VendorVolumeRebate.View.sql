USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_VendorVolumeRebate]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_VendorVolumeRebate]

AS

SELECT vt.PaidDt
, p.VendorName
, vvr.ID
, vvr.VendorID
, vvr.PMID
, vvr.UDNo
, vvr.StoreName
, vvr.VolumeAmt
, vvr.RebateAmt
, vvr.AccruedStartdt
, vvr.AccruedEnddt
, vvr.FileID
, vvr.TransactionID
, vl.FileName
, vl.LoadDate
, vl.LoadedBy
, vvr.Eligibility
, vvr.PayTo
, vvr.StorePaidDt
, vvr.Affiliate
, p.RebateReportDisplayName
FROM dbo.Partners AS p
INNER JOIN dbo.VendorTransaction AS vt ON p.VendorID = vt.VendorID 
INNER JOIN dbo.VendorVolumeRebate AS vvr ON vt.TransactionID = vvr.TransactionID 
LEFT OUTER JOIN dbo.VendorLoad AS vl ON vvr.FileID = vl.FileID

GO
