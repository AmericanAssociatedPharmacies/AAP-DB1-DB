USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vw_ReportCardVolume]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_ReportCardVolume]

AS

SELECT ISNULL(lj1.Date,lj2.Date) AS Date, ISNULL(lj1.PMID,lj2.PMID) AS PMID, ISNULL(lj1.CHAccountNo,lj2.CHAccountNo) AS CHAccountNo, ISNULL(lj1.DCNum,lj2.DCNum) AS DCNum, ISNULL(lj1.DCCity,lj2.DCCity) AS DCCity, ISNULL(lj1.AccountName,lj2.AccountName) AS AccountName
, ISNULL(lj1.Address,lj2.Address) AS Address, ISNULL(lj1.City,lj2.City) AS City, ISNULL(lj1.State,lj2.State) AS State, ISNULL(lj1.ZIP,lj2.ZIP) AS ZIP, ISNULL(lj1.APIAccountNo,lj2.APIAccountNo) AS APIAccountNo, ISNULL(lj1.AAPAccountNo,lj2.AAPAccountNo) AS AAPAccountNo
, ISNULL(lj1.UDAccountNo,lj2.UDAccountNo) AS UDAccountNo, ISNULL(lj1.DEA,lj2.DEA) AS DEA, ISNULL(lj1.APICOGAppliedSales,lj2.APICOGAppliedSales) AS APICOGAppliedSales, ISNULL(lj1.APINetSales,lj2.APINetSales) AS APINetSales, ISNULL(lj1.APIGENRx,lj2.APIGENRx) AS APIGENRx
, ISNULL(lj1.APIGENTotalSrc,lj2.APIGENTotalSrc) AS APIGENTotalSrc, ISNULL(lj1.APIGENTotalP2P3,lj2.APIGENTotalP2P3) AS APIGENTotalP2P3, ISNULL(lj1.APIGENTotal,lj2.APIGENTotal) AS APIGENTotal, ISNULL(lj1.APIBrand,lj2.APIBrand) AS APIBrand, ISNULL(lj1.APIOTC,lj2.APIOTC) AS APIOTC
, ISNULL(lj1.APIOther,lj2.APIOther) AS APIOther, ISNULL(lj1.APIGBRPerc,lj2.APIGBRPerc) AS APIGBRPerc, ISNULL(lj1.AAPCOGAppliedSales,lj2.AAPCOGAppliedSales) AS AAPCOGAppliedSales, ISNULL(lj1.AAPNetSales,lj2.AAPNetSales) AS AAPNetSales, ISNULL(lj1.AAPBrand,lj2.AAPBrand) AS AAPBrand
, ISNULL(lj1.AAPGENTotal,lj2.AAPGENTotal) AS AAPGENTotal, ISNULL(lj1.AAPGENTotalSrc,lj2.AAPGENTotalSrc) AS AAPGENTotalSrc, ISNULL(lj1.AAPGENExcl,lj2.AAPGENExcl) AS AAPGENExcl, ISNULL(lj1.AAPOTC,lj2.AAPOTC) AS AAPOTC, ISNULL(lj1.AAPOther,lj2.AAPOther) AS AAPOther
, ISNULL(lj1.AAPTotalRX,lj2.AAPTotalRX) AS AAPTotalRX, ISNULL(lj1.AAPExcludedFromTotalRX,lj2.AAPExcludedFromTotalRX) AS AAPExcludedFromTotalRX, ISNULL(lj1.AAPNonRXOTCandHH,lj2.AAPNonRXOTCandHH) AS AAPNonRXOTCandHH, ISNULL(lj1.AAPSourceCompliance,lj2.AAPSourceCompliance) AS AAPSourceCompliance
, ISNULL(lj1.UDNetSales,lj2.UDNetSales) AS UDNetSales, ISNULL(lj1.UDBrand,lj2.UDBrand) AS UDBrand, ISNULL(lj1.UDGENTotalSrc,lj2.UDGENTotalSrc) AS UDGENTotalSrc, ISNULL(lj1.UDGENTotal,lj2.UDGENTotal) AS UDGENTotal, ISNULL(lj1.UDOTC,lj2.UDOTC) AS UDOTC
, ISNULL(lj1.UDOther,lj2.UDOther) AS UDOther, ISNULL(lj1.UDAdminOnly,lj2.UDAdminOnly) AS UDAdminOnly, ISNULL(lj1.CombNetSales,lj2.CombNetSales) AS CombNetSales, ISNULL(lj1.CombBrands,lj2.CombBrands) AS CombBrands, ISNULL(lj1.CombOTC,lj2.CombOTC) AS CombOTC
, ISNULL(lj1.CombGENTotal,lj2.CombGENTotal) AS CombGENTotal, ISNULL(lj1.CombGENTotalSrc,lj2.CombGENTotalSrc) AS CombGENTotalSrc, ISNULL(lj1.CombOther,lj2.CombOther) AS CombOther, ISNULL(lj1.CombAdminOnly,lj2.CombAdminOnly) AS CombAdminOnly, ISNULL(lj1.WHAPIBrand,lj2.WHAPIBrand) AS WHAPIBrand
, ISNULL(lj1.WHAPIBrandUnits,lj2.WHAPIBrandUnits) AS WHAPIBrandUnits, ISNULL(lj1.WHAPIGeneric,lj2.WHAPIGeneric) AS WHAPIGeneric, ISNULL(lj1.WHAPIGenericUnits,lj2.WHAPIGenericUnits) AS WHAPIGenericUnits, ISNULL(lj1.WHAPIOTC,lj2.WHAPIOTC) AS WHAPIOTC
, ISNULL(lj1.WHAPIOTCUnits,lj2.WHAPIOTCUnits) AS WHAPIOTCUnits, ISNULL(lj1.WHAPITotal,lj2.WHAPITotal) AS WHAPITotal, ISNULL(lj1.MLTotal,lj2.MLTotal) AS MLTotal, ISNULL(lj1.AndaTotal,lj2.AndaTotal) AS AndaTotal
, ISNULL(lj1.APIGenericSalesTier1,lj2.APIGenericSalesTier1) AS APIGenericSalesTier1, ISNULL(lj1.APIGenericSalesTier2,lj2.APIGenericSalesTier2) AS APIGenericSalesTier2
FROM PharmacyMaster.[dbo].[ALL_Volume_New] AS v
LEFT OUTER JOIN(SELECT Date, PMID, CHAccountNo, DCNum, DCCity, AccountName, Address, City, State, ZIP, APIAccountNo, AAPAccountNo, UDAccountNo, DEA, APICOGAppliedSales
				, APINetSales, APIGENRx, APIGENTotalSrc, APIGENTotalP2P3, APIGENTotal, APIBrand, APIOTC, APIOther, APIGBRPerc, AAPCOGAppliedSales, AAPNetSales, AAPBrand
				, AAPGENTotal, AAPGENTotalSrc, AAPGENExcl, AAPOTC, AAPOther, AAPTotalRX, AAPExcludedFromTotalRX, AAPNonRXOTCandHH, AAPSourceCompliance, UDNetSales
				, UDBrand, UDGENTotalSrc, UDGENTotal, UDOTC, UDOther, UDAdminOnly, CombNetSales, CombBrands, CombOTC, CombGENTotal, CombGENTotalSrc, CombOther, CombAdminOnly
				, WHAPIBrand, WHAPIBrandUnits, WHAPIGeneric, WHAPIGenericUnits, WHAPIOTC, WHAPIOTCUnits, WHAPITotal, MLTotal, AndaTotal, CONVERT(MONEY, [WHAPIGeneric]) AS APIGenericSalesTier1
				, CONVERT(MONEY,0.00) AS APIGenericSalesTier2
				FROM [dbo].[ALL_Volume_New] AS a
				WHERE Date < '20190701'
				) AS lj1 ON v.Date = lj1.Date
							AND v.PMID = lj1.PMID
LEFT OUTER JOIN(SELECT a.Date, a.PMID, a.CHAccountNo, a.DCNum, a.DCCity, a.AccountName, a.Address, a.City, a.State, a.ZIP, a.APIAccountNo, a.AAPAccountNo, a.UDAccountNo, a.DEA
				, a.APICOGAppliedSales, a.APINetSales, a.APIGENRx, a.APIGENTotalSrc, a.APIGENTotalP2P3, a.APIGENTotal, a.APIBrand, a.APIOTC, a.APIOther, a.APIGBRPerc, a.AAPCOGAppliedSales, a.AAPNetSales
				, a.AAPBrand, a.AAPGENTotal, a.AAPGENTotalSrc, a.AAPGENExcl, a.AAPOTC, a.AAPOther, a.AAPTotalRX, a.AAPExcludedFromTotalRX, a.AAPNonRXOTCandHH, a.AAPSourceCompliance, a.UDNetSales, a.UDBrand
				, a.UDGENTotalSrc, a.UDGENTotal, a.UDOTC, a.UDOther, a.UDAdminOnly, a.CombNetSales, a.CombBrands, a.CombOTC, a.CombGENTotal, a.CombGENTotalSrc, a.CombOther, a.CombAdminOnly, a.WHAPIBrand, a.WHAPIBrandUnits
				, CONVERT(MONEY,0.00) AS WHAPIGeneric, a.WHAPIGenericUnits, a.WHAPIOTC, a.WHAPIOTCUnits, (ISNULL(a.WHAPIBrand,0.00) + ISNULL(a.WHAPIOTC,0.00) + ISNULL(p.[GenericSalesTier1],0.00) + ISNULL(p.[GenericSalesTier2],0.00)) AS WHAPITotal, a.MLTotal, a.AndaTotal, ISNULL(p.[GenericSalesTier1], 0.00) AS APIGenericSalesTier1, ISNULL(p.[GenericSalesTier2],0.00) AS APIGenericSalesTier2
				FROM [dbo].[ALL_Volume_New] AS a
				LEFT OUTER JOIN Reports.dbo.APISalesUnaudited_Monthly AS p ON a.[PMID] = p.PMID
																	AND a.[Date] = p.[Date]
				WHERE a.Date >= '20190701'
				) AS lj2 ON v.Date = lj2.Date
							AND v.PMID = lj2.PMID
WHERE (lj1.Date IS NOT NULL OR lj2.Date IS NOT NULL)
OR (lj1.PMID IS NOT NULL OR lj2.PMID IS NOT NULL)
OR (lj1.CHAccountNo IS NOT NULL OR lj2.CHAccountNo IS NOT NULL)
OR (lj1.DCNum IS NOT NULL OR lj2.DCNum IS NOT NULL)
OR (lj1.DCCity IS NOT NULL OR lj2.DCCity IS NOT NULL)
OR (lj1.AccountName IS NOT NULL OR lj2.AccountName IS NOT NULL)
OR (lj1.Address IS NOT NULL OR lj2.Address IS NOT NULL)
OR (lj1.City IS NOT NULL OR lj2.City IS NOT NULL)
OR (lj1.State IS NOT NULL OR lj2.State IS NOT NULL)
OR (lj1.ZIP IS NOT NULL OR lj2.ZIP IS NOT NULL)
OR (lj1.APIAccountNo IS NOT NULL OR lj2.APIAccountNo IS NOT NULL)
OR (lj1.AAPAccountNo IS NOT NULL OR lj2.AAPAccountNo IS NOT NULL)
OR (lj1.UDAccountNo IS NOT NULL OR lj2.UDAccountNo IS NOT NULL)
OR (lj1.DEA IS NOT NULL OR lj2.DEA IS NOT NULL)
OR (lj1.APICOGAppliedSales IS NOT NULL OR lj2.APICOGAppliedSales IS NOT NULL)
OR (lj1.APINetSales IS NOT NULL OR lj2.APINetSales IS NOT NULL)
OR (lj1.APIGENRx IS NOT NULL OR lj2.APIGENRx IS NOT NULL)
OR (lj1.APIGENTotalSrc IS NOT NULL OR lj2.APIGENTotalSrc IS NOT NULL)
OR (lj1.APIGENTotalP2P3 IS NOT NULL OR lj2.APIGENTotalP2P3 IS NOT NULL)
OR (lj1.APIGENTotal IS NOT NULL OR lj2.APIGENTotal IS NOT NULL)
OR (lj1.APIBrand IS NOT NULL OR lj2.APIBrand IS NOT NULL)
OR (lj1.APIOTC IS NOT NULL OR lj2.APIOTC IS NOT NULL)
OR (lj1.APIOther IS NOT NULL OR lj2.APIOther IS NOT NULL)
OR (lj1.APIGBRPerc IS NOT NULL OR lj2.APIGBRPerc IS NOT NULL)
OR (lj1.AAPCOGAppliedSales IS NOT NULL OR lj2.AAPCOGAppliedSales IS NOT NULL)
OR (lj1.AAPNetSales IS NOT NULL OR lj2.AAPNetSales IS NOT NULL)
OR (lj1.AAPBrand IS NOT NULL OR lj2.AAPBrand IS NOT NULL)
OR (lj1.AAPGENTotal IS NOT NULL OR lj2.AAPGENTotal IS NOT NULL)
OR (lj1.AAPGENTotalSrc IS NOT NULL OR lj2.AAPGENTotalSrc IS NOT NULL)
OR (lj1.AAPGENExcl IS NOT NULL OR lj2.AAPGENExcl IS NOT NULL)
OR (lj1.AAPOTC IS NOT NULL OR lj2.AAPOTC IS NOT NULL)
OR (lj1.AAPOther IS NOT NULL OR lj2.AAPOther IS NOT NULL)
OR (lj1.AAPTotalRX IS NOT NULL OR lj2.AAPTotalRX IS NOT NULL)
OR (lj1.AAPExcludedFromTotalRX IS NOT NULL OR lj2.AAPExcludedFromTotalRX IS NOT NULL)
OR (lj1.AAPNonRXOTCandHH IS NOT NULL OR lj2.AAPNonRXOTCandHH IS NOT NULL)
OR (lj1.AAPSourceCompliance IS NOT NULL OR lj2.AAPSourceCompliance IS NOT NULL)
OR (lj1.UDNetSales IS NOT NULL OR lj2.UDNetSales IS NOT NULL)
OR (lj1.UDBrand IS NOT NULL OR lj2.UDBrand IS NOT NULL)
OR (lj1.UDGENTotalSrc IS NOT NULL OR lj2.UDGENTotalSrc IS NOT NULL)
OR (lj1.UDGENTotal IS NOT NULL OR lj2.UDGENTotal IS NOT NULL)
OR (lj1.UDOTC IS NOT NULL OR lj2.UDOTC IS NOT NULL)
OR (lj1.UDOther IS NOT NULL OR lj2.UDOther IS NOT NULL)
OR (lj1.UDAdminOnly IS NOT NULL OR lj2.UDAdminOnly IS NOT NULL)
OR (lj1.CombNetSales IS NOT NULL OR lj2.CombNetSales IS NOT NULL)
OR (lj1.CombBrands IS NOT NULL OR lj2.CombBrands IS NOT NULL)
OR (lj1.CombOTC IS NOT NULL OR lj2.CombOTC IS NOT NULL)
OR (lj1.CombGENTotal IS NOT NULL OR lj2.CombGENTotal IS NOT NULL)
OR (lj1.CombGENTotalSrc IS NOT NULL OR lj2.CombGENTotalSrc IS NOT NULL)
OR (lj1.CombOther IS NOT NULL OR lj2.CombOther IS NOT NULL)
OR (lj1.CombAdminOnly IS NOT NULL OR lj2.CombAdminOnly IS NOT NULL)
OR (lj1.WHAPIBrand IS NOT NULL OR lj2.WHAPIBrand IS NOT NULL)
OR (lj1.WHAPIBrandUnits IS NOT NULL OR lj2.WHAPIBrandUnits IS NOT NULL)
OR (lj1.WHAPIGeneric IS NOT NULL OR lj2.WHAPIGeneric IS NOT NULL)
OR (lj1.WHAPIGenericUnits IS NOT NULL OR lj2.WHAPIGenericUnits IS NOT NULL)
OR (lj1.WHAPIOTC IS NOT NULL OR lj2.WHAPIOTC IS NOT NULL)
OR (lj1.WHAPIOTCUnits IS NOT NULL OR lj2.WHAPIOTCUnits IS NOT NULL)
OR (lj1.WHAPITotal IS NOT NULL OR lj2.WHAPITotal IS NOT NULL)
OR (lj1.MLTotal IS NOT NULL OR lj2.MLTotal IS NOT NULL)
OR (lj1.AndaTotal IS NOT NULL OR lj2.AndaTotal IS NOT NULL)
OR (lj1.APIGenericSalesTier1 IS NOT NULL OR lj2.APIGenericSalesTier1 IS NOT NULL)
OR (lj1.APIGenericSalesTier2 IS NOT NULL OR lj2.APIGenericSalesTier2 IS NOT NULL)



GO
