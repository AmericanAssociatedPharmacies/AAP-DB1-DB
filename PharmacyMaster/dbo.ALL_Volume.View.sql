USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[ALL_Volume]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ALL_Volume]

AS

SELECT Date, PMID, CHAccountNo, DCNum, DCCity, AccountName, Address, City, State, ZIP, APIAccountNo, AAPAccountNo, UDAccountNo, DEA, APICOGAppliedSales, APINetSales, APIGENRx, APIGENTotalSrc, APIGENTotalP2P3, APIGENTotal, APIBrand, APIOTC, APIOther, APIGBRPerc, AAPCOGAppliedSales, AAPNetSales, AAPBrand, AAPGENTotal, AAPGENTotalSrc, AAPGENExcl, AAPOTC, AAPOther, AAPTotalRX, AAPExcludedFromTotalRX, AAPNonRXOTCandHH, AAPSourceCompliance, UDNetSales, UDBrand, UDGENTotalSrc, UDGENTotal, UDOTC, UDOther, UDAdminOnly, CombNetSales, CombBrands, CombOTC, CombGENTotal, CombGENTotalSrc, CombOther, CombAdminOnly, WHAPIBrand, WHAPIBrandUnits, WHAPIGeneric, WHAPIGenericUnits, WHAPIOTC, WHAPIOTCUnits, WHAPITotal, MLTotal, AndaTotal
FROM [dbo].[ALL_Volume_New]
GO
