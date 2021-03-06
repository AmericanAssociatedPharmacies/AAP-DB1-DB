USE [Purchases]
GO
/****** Object:  Table [dbo].[CardinalCompleteV1]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalCompleteV1](
	[UNITPRODUCT] [float] NULL,
	[SCANNEDUNITPRODUCTCODE] [float] NULL,
	[NDC] [nvarchar](255) NULL,
	[CARDINALITEMNUMBER] [nvarchar](255) NULL,
	[RXOTCFLAG] [nvarchar](255) NULL,
	[BRANDNAME] [nvarchar](255) NULL,
	[GENERICPRODUCTDESCRIPTION] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[CONTRACTPRICE] [float] NULL,
	[INVOICEPRICE] [money] NULL,
	[BASEPRICE] [money] NULL,
	[RETAILPRICE] [money] NULL,
	[FORM] [nvarchar](255) NULL,
	[STRENGTH] [nvarchar](255) NULL,
	[SIZE] [nvarchar](255) NULL,
	[UNITOFMEASURE] [nvarchar](255) NULL,
	[VENDORNAME] [nvarchar](255) NULL,
	[ACCUNETSIZE] [float] NULL,
	[CASEQUANTITY] [float] NULL,
	[PACKQUANTITY] [float] NULL,
	[UNITSIZE] [float] NULL,
	[DISPENSEQUANTITY] [float] NULL,
	[THERAPEUTICCLASSCODE] [float] NULL,
	[CONTRACTNUMBER] [nvarchar](255) NULL,
	[CONTRACTNAME] [nvarchar](255) NULL,
	[CONTRACTSTARTDATE] [nvarchar](255) NULL,
	[CONTRACTENDDATE] [nvarchar](255) NULL,
	[INVOICEPRICECHANGEDATE] [float] NULL,
	[BASEPRICECHANGEDATE] [float] NULL,
	[FINELINECODE] [float] NULL,
	[PREVIOUSINVOICEPRICE] [float] NULL,
	[CCAHEADER] [float] NULL,
	[GENERICCODE] [float] NULL,
	[GPPCCODE] [nvarchar](255) NULL,
	[API ITEM #] [nvarchar](255) NULL,
	[API PRICE] [float] NULL,
	[Adj Rebate] [float] NULL,
	[GPI] [nvarchar](255) NULL,
	[API_Size] [nvarchar](255) NULL
) ON [PRIMARY]
GO
