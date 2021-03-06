USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vw_CH_ALLPVA_SALES_old_20190621]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[vw_CH_ALLPVA_SALES_old_20190621]

AS

SELECT CONVERT(DATETIME, RIGHT([Month], 2) + '/01/' + LEFT([Month], 4)) AS Date
, CONVERT(INT, [PMID]) AS PMID
, [NAME] AS AccountName
, [API#] AS APIAccountNo
, [AAP#] AS AAPAccountNo
, [Sales- COG Applied] AS AAPCOGAppliedSales
, [Net Sales] AS AAPNetSales
, [Brand RX Sales] AS AAPBrand
, [Total Src Generics] AS AAPGENTotal 
, [Total Src Generics] AS AAPGENTotalSrc 
, 0.00 AS AAPGENExcl
, CONVERT(MONEY, [OTC]) AS AAPOTC
, CONVERT(MONEY, [Other]) AS AAPOther
, [Net Sales] AS CombNetSales
, [Brand RX Sales] AS CombBrands
, CONVERT(MONEY, OTC + [Non RX- OTC & HH]) AS CombOTC
, CONVERT(MONEY, [Total Src Generics]) AS CombGENTotal
, CONVERT(MONEY, [Total Src Generics]) AS CombGENTotalSrc
, CONVERT(MONEY, [Total RX]) AS AAPTotalRX
, CONVERT(MONEY, [Excluded from Total RX]) AS AAPExcludedFromTotalRX
, CONVERT(MONEY, [Non RX- OTC & HH]) AS AAPNonRXOTCandHH
, CONVERT(MONEY, [Source Compliance]) AS AAPSourceCompliance
, NULL AS [NonContractGenericSales]
, CONVERT(MONEY, [COG Eligible Sales]) AS COGEligibleSales
--, CONVERT(MONEY, [Non-Contract Generic Sales]) AS [NonContractGenericSales]
from OPENROWSET('Microsoft.ACE.OLEDB.12.0'
				, 'Excel 12.0 Xml;Database=C:\data\CardinalAAPVolume\MONTHLY COMBINED CONTRACT REPORT.xlsx;HDR=YES'
				,'select * FROM [Load$]'
				)



GO
