USE [Purchases]
GO
/****** Object:  Table [dbo].[CardinalComplete_test]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalComplete_test](
	[UNITPRODUCT] [varchar](50) NULL,
	[SCANNEDUNITPRODUCTCODE] [varchar](50) NULL,
	[NDC] [varchar](50) NULL,
	[CARDINALITEMNUMBER] [varchar](50) NULL,
	[RXOTCFLAG] [varchar](50) NULL,
	[BRANDNAME] [varchar](50) NULL,
	[GENERICPRODUCTDESCRIPTION] [varchar](50) NULL,
	[AWP] [varchar](50) NULL,
	[CONTRACTPRICE] [varchar](50) NULL,
	[INVOICEPRICE] [varchar](50) NULL,
	[BASEPRICE] [varchar](50) NULL,
	[RETAILPRICE] [varchar](50) NULL,
	[FORM] [varchar](50) NULL,
	[STRENGTH] [varchar](50) NULL,
	[SIZE] [varchar](50) NULL,
	[UNITOFMEASURE] [varchar](50) NULL,
	[VENDORNAME] [varchar](50) NULL,
	[ACCUNETSIZE] [varchar](50) NULL,
	[CASEQUANTITY] [varchar](50) NULL,
	[PACKQUANTITY] [varchar](50) NULL,
	[UNITSIZE] [varchar](50) NULL,
	[DISPENSEQUANTITY] [varchar](50) NULL,
	[THERAPEUTICCLASSCODE] [varchar](50) NULL,
	[CONTRACTNUMBER] [varchar](50) NULL,
	[CONTRACTNAME] [varchar](50) NULL,
	[CONTRACTSTARTDATE] [varchar](50) NULL,
	[CONTRACTENDDATE] [varchar](50) NULL,
	[INVOICEPRICECHANGEDATE] [varchar](50) NULL,
	[BASEPRICECHANGEDATE] [varchar](50) NULL,
	[FINELINECODE] [varchar](50) NULL,
	[PREVIOUSINVOICEPRICE] [varchar](50) NULL,
	[CCAHEADER] [varchar](50) NULL,
	[GENERICCODE] [varchar](50) NULL,
	[GPPCCODE] [varchar](50) NULL,
	[GPI] [varchar](50) NULL,
	[API_Size] [varchar](50) NOT NULL,
	[API ITEM  ] [varchar](50) NOT NULL,
	[API PRICE] [varchar](50) NOT NULL,
	[Adj Rebate] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
