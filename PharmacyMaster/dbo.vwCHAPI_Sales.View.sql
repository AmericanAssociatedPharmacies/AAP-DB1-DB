USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vwCHAPI_Sales]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [dbo].[vwCHAPI_Sales]	

AS

										
SELECT CONVERT(DATETIME, RIGHT([Month], 2) + '/01/' + LEFT([Month], 4)) AS [DATE]
, CONVERT(INT,[PMID]) AS PMID
, [NAME] AS AccountName
, CASE 
       WHEN [API#] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
       ELSE LTRIM(RTRIM([API#]))
       END AS APIAccountNo
, CASE 
       WHEN [AAP#] NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
       ELSE LTRIM(RTRIM([AAP#]))
       END AS AAPAccountNo
, [Sales- COG Applied] AS AAPCOGAppliedSales
, [Net Sales] AS AAPNetSales
, [Brand RX Sales] AS AAPBrand
, [Total Src Generics] AS AAPGENTotal 
, [Total Src Generics] AS AAPGENTotalSrc 
, [OTC] AS AAPOTC
, [Other] AS AAPOther
, [Net Sales] AS CombNetSales
, [Brand RX Sales] AS CombBrands
, 0.00 AS AAPGENExcl
, CONVERT(MONEY, OTC + [Non RX- OTC & HH]) AS CombOTC
, CONVERT(MONEY, [Total Src Generics]) AS CombGENTotal
, CONVERT(MONEY, [Total Src Generics]) AS CombGENTotalSrc
, CONVERT(MONEY, [COG Eligible Sales]) AS COGEligibleSales 
, CONVERT(MONEY, [Net Source Generics]) AS NetSourceGenerics
, CONVERT(MONEY, [Rebate Eligible Source Generics]) AS RebateEligibleSourceGenerics
FROM OPENROWSET('Microsoft.ACE.OLEDB.12.0'
				, 'Excel 12.0 Xml;Database=C:\data\CardinalAAPVolume\MONTHLY COMBINED CONTRACT REPORT.xlsx;HDR=YES'
				,'select * FROM [Load$]'
				)
WHERE [MONTH] IS NOT NULL





GO
