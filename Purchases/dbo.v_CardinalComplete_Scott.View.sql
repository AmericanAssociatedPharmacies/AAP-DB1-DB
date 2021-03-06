USE [Purchases]
GO
/****** Object:  View [dbo].[v_CardinalComplete_Scott]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[v_CardinalComplete_Scott]
AS
SELECT DISTINCT 
                         A.CARDINALITEMNUMBER, A.UNITPRODUCT, A.SCANNEDUNITPRODUCTCODE, 
                         A.NDC, A.RXOTCFLAG, A.BRANDNAME, A.GENERICPRODUCTDESCRIPTION, 
                         A.AWP, A.CONTRACTPRICE, A.INVOICEPRICE, A.BASEPRICE, 
                         A.RETAILPRICE, A.FORM, A.STRENGTH, A.SIZE, 
                         A.UNITOFMEASURE, A.VENDORNAME, A.ACCUNETSIZE, A.CASEQUANTITY, 
                         A.PACKQUANTITY, A.UNITSIZE, A.DISPENSEQUANTITY, 
                         A.THERAPEUTICCLASSCODE, A.CONTRACTNUMBER, A.CONTRACTNAME, 
                         A.CONTRACTSTARTDATE, A.CONTRACTENDDATE, A.INVOICEPRICECHANGEDATE, 
                         A.BASEPRICECHANGEDATE, A.FINELINECODE, A.PREVIOUSINVOICEPRICE, 
                         A.CCAHEADER, A.GENERICCODE, A.GPPCCODE, A.GPI, 
                         A.API_Size, A.[API ITEM], A.[API PRICE], CAST(A.[Adj Rebate] AS numeric(10, 3)) 
                         AS [Adj Rebate], dbo.v_APIPrice_mostrecent2.NDC AS APINDC
FROM [dbo].[CardinalComplete_RSE_20170424] AS A
LEFT OUTER JOIN dbo.v_APIPrice_mostrecent2 ON A.[API ITEM] = dbo.v_APIPrice_mostrecent2.APIItemNbr


GO
