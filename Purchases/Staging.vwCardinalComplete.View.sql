USE [Purchases]
GO
/****** Object:  View [Staging].[vwCardinalComplete]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--USE Purchases;


CREATE VIEW [Staging].[vwCardinalComplete]

AS

SELECT LEFT(UNITPRODUCT, 50) AS UNITPRODUCT
, LEFT(SCANNEDUNITPRODUCTCODE, 50) AS SCANNEDUNITPRODUCTCODE
, LEFT(NDC, 50) AS NDC
, LEFT(CARDINALITEMNUMBER, 50) AS CARDINALITEMNUMBER
, LEFT(RXOTCFLAG, 50) AS RXOTCFLAG
, LEFT(BRANDNAME, 50) AS BRANDNAME
, LEFT(GENERICPRODUCTDESCRIPTION, 50) AS GENERICPRODUCTDESCRIPTION
, LEFT(AWP, 50) AS AWP
, LEFT(CONTRACTPRICE, 50) AS CONTRACTPRICE
, LEFT(INVOICEPRICE, 50) AS INVOICEPRICE
, LEFT(BASEPRICE, 50) AS BASEPRICE
, LEFT(RETAILPRICE, 50) AS RETAILPRICE
, LEFT(FORM, 50) AS FORM
, LEFT(STRENGTH, 50) AS STRENGTH
, LEFT(SIZE, 50) AS SIZE
, LEFT(UNITOFMEASURE, 50) AS UNITOFMEASURE
, LEFT(VENDORNAME, 50) AS VENDORNAME
, LEFT(ACCUNETSIZE, 50) AS ACCUNETSIZE
, LEFT(CASEQUANTITY, 50) AS CASEQUANTITY
, LEFT(PACKQUANTITY, 50) AS PACKQUANTITY
, LEFT(UNITSIZE, 50) AS UNITSIZE
, LEFT(DISPENSEQUANTITY, 50) AS DISPENSEQUANTITY
, LEFT(THERAPEUTICCLASSCODE, 50) AS THERAPEUTICCLASSCODE
, LEFT(CONTRACTNUMBER, 50) AS CONTRACTNUMBER
, LEFT(CONTRACTNAME, 50) AS CONTRACTNAME
, LEFT(CONTRACTSTARTDATE, 50) AS CONTRACTSTARTDATE
, LEFT(CONTRACTENDDATE, 50) AS CONTRACTENDDATE
, LEFT(INVOICEPRICECHANGEDATE, 50) AS INVOICEPRICECHANGEDATE
, LEFT(BASEPRICECHANGEDATE, 50) AS BASEPRICECHANGEDATE
, LEFT(FINELINECODE, 50) AS FINELINECODE
, LEFT(PREVIOUSINVOICEPRICE, 50) AS PREVIOUSINVOICEPRICE
, LEFT(CCAHEADER, 50) AS CCAHEADER
, LEFT(GENERICCODE, 50) AS GENERICCODE
, LEFT(GPPCCODE, 50) AS GPPCCODE
, LEFT(GPI, 50) AS GPI
, LEFT(API_Size, 50) AS API_Size
, LEFT([API ITEM], 50) AS [API ITEM]
, CONVERT(NUMERIC(28,4), REPLACE([API PRICE], '$', '')) AS [API PRICE]
, LEFT([Adj Rebate], 50) AS [Adj Rebate]
FROM ODSIntake.[Staging].[CardinalComplete]		
WHERE [API PRICE] LIKE '%.%'

UNION ALL

SELECT LEFT(UNITPRODUCT, 50) AS UNITPRODUCT
, LEFT(SCANNEDUNITPRODUCTCODE, 50) AS SCANNEDUNITPRODUCTCODE
, LEFT(NDC, 50) AS NDC
, LEFT(CARDINALITEMNUMBER, 50) AS CARDINALITEMNUMBER
, LEFT(RXOTCFLAG, 50) AS RXOTCFLAG
, LEFT(BRANDNAME, 50) AS BRANDNAME
, LEFT(GENERICPRODUCTDESCRIPTION, 50) AS GENERICPRODUCTDESCRIPTION
, LEFT(AWP, 50) AS AWP
, LEFT(CONTRACTPRICE, 50) AS CONTRACTPRICE
, LEFT(INVOICEPRICE, 50) AS INVOICEPRICE
, LEFT(BASEPRICE, 50) AS BASEPRICE
, LEFT(RETAILPRICE, 50) AS RETAILPRICE
, LEFT(FORM, 50) AS FORM
, LEFT(STRENGTH, 50) AS STRENGTH
, LEFT(SIZE, 50) AS SIZE
, LEFT(UNITOFMEASURE, 50) AS UNITOFMEASURE
, LEFT(VENDORNAME, 50) AS VENDORNAME
, LEFT(ACCUNETSIZE, 50) AS ACCUNETSIZE
, LEFT(CASEQUANTITY, 50) AS CASEQUANTITY
, LEFT(PACKQUANTITY, 50) AS PACKQUANTITY
, LEFT(UNITSIZE, 50) AS UNITSIZE
, LEFT(DISPENSEQUANTITY, 50) AS DISPENSEQUANTITY
, LEFT(THERAPEUTICCLASSCODE, 50) AS THERAPEUTICCLASSCODE
, LEFT(CONTRACTNUMBER, 50) AS CONTRACTNUMBER
, LEFT(CONTRACTNAME, 50) AS CONTRACTNAME
, LEFT(CONTRACTSTARTDATE, 50) AS CONTRACTSTARTDATE
, LEFT(CONTRACTENDDATE, 50) AS CONTRACTENDDATE
, LEFT(INVOICEPRICECHANGEDATE, 50) AS INVOICEPRICECHANGEDATE
, LEFT(BASEPRICECHANGEDATE, 50) AS BASEPRICECHANGEDATE
, LEFT(FINELINECODE, 50) AS FINELINECODE
, LEFT(PREVIOUSINVOICEPRICE, 50) AS PREVIOUSINVOICEPRICE
, LEFT(CCAHEADER, 50) AS CCAHEADER
, LEFT(GENERICCODE, 50) AS GENERICCODE
, LEFT(GPPCCODE, 50) AS GPPCCODE
, LEFT(GPI, 50) AS GPI
, LEFT(API_Size, 50) AS API_Size
, LEFT([API ITEM], 50) AS [API ITEM]
, CONVERT(NUMERIC(28,4), REPLACE([API PRICE], '', NULL)) AS [API PRICE]
, LEFT([Adj Rebate], 50) AS [Adj Rebate]
FROM ODSIntake.[Staging].[CardinalComplete]		
WHERE [API PRICE] NOT LIKE '%.%'

GO
