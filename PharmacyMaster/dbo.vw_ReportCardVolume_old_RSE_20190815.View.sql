USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vw_ReportCardVolume_old_RSE_20190815]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[vw_ReportCardVolume_old_RSE_20190815]

AS

SELECT a.Date
, a.PMID
, a.CHAccountNo
, a.DCNum
, a.DCCity
, a.AccountName
, a.Address
, a.City
, a.State
, a.ZIP
, a.APIAccountNo
, a.AAPAccountNo
, a.UDAccountNo
, a.DEA
, a.APICOGAppliedSales
, a.APINetSales
, a.APIGENRx
, a.APIGENTotalSrc
, a.APIGENTotalP2P3
, a.APIGENTotal
, a.APIBrand
, a.APIOTC
, a.APIOther
, a.APIGBRPerc
, a.AAPCOGAppliedSales
, a.AAPNetSales
, a.AAPBrand
, a.AAPGENTotal
, a.AAPGENTotalSrc
, a.AAPGENExcl
, a.AAPOTC
, a.AAPOther
, a.AAPTotalRX
, a.AAPExcludedFromTotalRX
, a.AAPNonRXOTCandHH
, a.AAPSourceCompliance
, a.UDNetSales
, a.UDBrand
, a.UDGENTotalSrc
, a.UDGENTotal
, a.UDOTC
, a.UDOther
, a.UDAdminOnly
, a.CombNetSales
, a.CombBrands
, a.CombOTC
, a.CombGENTotal
, a.CombGENTotalSrc
, a.CombOther
, a.CombAdminOnly
, a.WHAPIBrand
, a.WHAPIBrandUnits
, a.WHAPIGeneric
, a.WHAPIGenericUnits
, a.WHAPIOTC
, a.WHAPIOTCUnits
, a.WHAPITotal
, a.MLTotal
, a.AndaTotal
, ISNULL(p.[APIGenericSalesTier1], 0.00) AS APIGenericSalesTier1
, ISNULL(p.[APIGenericSalesTier2],0.00) AS APIGenericSalesTier2
FROM [dbo].[ALL_Volume_New] AS a
LEFT OUTER JOIN dbo.PM_Rebates_APIMonthly AS p ON a.[PMID] = p.PMID
													AND a.[Date] = p.[Date]

GO
