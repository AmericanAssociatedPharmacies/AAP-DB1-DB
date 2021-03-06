USE [Purchases]
GO
/****** Object:  Table [dbo].[CardinalComplete_bkp040117]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalComplete_bkp040117](
	[CARDINALITEMNUMBER] [nvarchar](50) NULL,
	[UNITPRODUCT] [nvarchar](50) NULL,
	[SCANNEDUNITPRODUCTCODE] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[RXOTCFLAG] [nvarchar](50) NULL,
	[BRANDNAME] [nvarchar](50) NULL,
	[GENERICPRODUCTDESCRIPTION] [nvarchar](50) NULL,
	[AWP] [nvarchar](50) NULL,
	[CONTRACTPRICE] [nvarchar](50) NULL,
	[INVOICEPRICE] [nvarchar](50) NULL,
	[BASEPRICE] [nvarchar](50) NULL,
	[RETAILPRICE] [nvarchar](50) NULL,
	[FORM] [nvarchar](50) NULL,
	[STRENGTH] [nvarchar](50) NULL,
	[SIZE] [nvarchar](50) NULL,
	[UNITOFMEASURE] [nvarchar](50) NULL,
	[VENDORNAME] [nvarchar](50) NULL,
	[ACCUNETSIZE] [nvarchar](50) NULL,
	[CASEQUANTITY] [nvarchar](50) NULL,
	[PACKQUANTITY] [nvarchar](50) NULL,
	[UNITSIZE] [nvarchar](50) NULL,
	[DISPENSEQUANTITY] [nvarchar](50) NULL,
	[THERAPEUTICCLASSCODE] [nvarchar](50) NULL,
	[CONTRACTNUMBER] [nvarchar](50) NULL,
	[CONTRACTNAME] [nvarchar](50) NULL,
	[CONTRACTSTARTDATE] [nvarchar](50) NULL,
	[CONTRACTENDDATE] [nvarchar](50) NULL,
	[INVOICEPRICECHANGEDATE] [nvarchar](50) NULL,
	[BASEPRICECHANGEDATE] [nvarchar](50) NULL,
	[FINELINECODE] [nvarchar](50) NULL,
	[PREVIOUSINVOICEPRICE] [nvarchar](50) NULL,
	[CCAHEADER] [nvarchar](50) NULL,
	[GENERICCODE] [nvarchar](50) NULL,
	[GPPCCODE] [nvarchar](50) NULL,
	[GPI] [nvarchar](50) NULL,
	[API_Size] [nvarchar](50) NULL,
	[API ITEM] [nvarchar](50) NULL,
	[API PRICE] [numeric](28, 4) NULL,
	[Adj Rebate] [nvarchar](50) NULL,
	[APINDC] [nvarchar](50) NULL
) ON [PRIMARY]
GO
