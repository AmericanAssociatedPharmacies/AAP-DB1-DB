USE [Purchases]
GO
/****** Object:  Table [Archive].[APIPrice]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[APIPrice](
	[APIItemNbr] [nvarchar](50) NULL,
	[NDC] [nvarchar](20) NULL,
	[Description] [nvarchar](200) NULL,
	[Unit] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Contract] [nvarchar](50) NULL,
	[APIPrice] [nvarchar](50) NULL,
	[PricePerUnit] [numeric](18, 4) NULL,
	[GPI] [nvarchar](50) NULL,
	[AdjRebate] [numeric](18, 4) NULL,
	[UnitNet] [numeric](18, 6) NULL,
	[BillableSize] [nvarchar](50) NULL,
	[dateloaded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[CardinalComplete]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[CardinalComplete](
	[UNITPRODUCT] [nvarchar](50) NULL,
	[SCANNEDUNITPRODUCTCODE] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[CARDINALITEMNUMBER] [nvarchar](50) NULL,
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
	[Adj Rebate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Archive].[CHPH_AAP]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[CHPH_AAP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL,
	[OrderNo] [varchar](20) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[DEA] [varchar](25) NULL,
	[InvoiceLineNmbr] [int] NULL,
 CONSTRAINT [PK_Archive_CHPH_AAP_] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [psCAH]([DateKey])
) ON [psCAH]([DateKey])
GO
/****** Object:  Table [dbo].[20200519]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[20200519](
	[PMID] [int] NULL,
	[CAHAccountNo] [nvarchar](250) NULL,
	[AAPEffectiveDate] [date] NULL,
	[AAPQuitDate] [date] NOT NULL,
	[AAPEffectiveDateKey] [int] NULL,
	[AAPQuitDateKey] [int] NULL,
	[CorrectedCAHAccountNo] [nvarchar](250) NULL,
	[AAPAccountNo] [nvarchar](100) NULL,
	[PreviousMemberPMID] [int] NULL,
	[IsPVA] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIPrice]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIPrice](
	[APIItemNbr] [nvarchar](50) NULL,
	[NDC] [nvarchar](20) NULL,
	[Description] [nvarchar](200) NULL,
	[Unit] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Contract] [nvarchar](50) NULL,
	[APIPrice] [nvarchar](50) NULL,
	[PricePerUnit] [numeric](18, 4) NULL,
	[GPI] [nvarchar](50) NULL,
	[AdjRebate] [numeric](18, 4) NULL,
	[UnitNet] [numeric](18, 6) NULL,
	[BillableSize] [nvarchar](50) NULL,
	[dateloaded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIPriceAll]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIPriceAll](
	[APIItemNbr] [nvarchar](50) NULL,
	[NDC] [nvarchar](20) NULL,
	[Description] [nvarchar](200) NULL,
	[Unit] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Contract] [nvarchar](50) NULL,
	[APIPrice] [nvarchar](50) NULL,
	[PricePerUnit] [numeric](18, 4) NULL,
	[GPI] [nvarchar](50) NULL,
	[AdjRebate] [numeric](18, 4) NULL,
	[UnitNet] [numeric](18, 6) NULL,
	[BillableSize] [nvarchar](50) NULL,
	[dateloaded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[APIRebatePrice]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIRebatePrice](
	[NDC] [nvarchar](20) NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[WeekNo] [int] NULL,
	[APINetPrice] [numeric](21, 6) NULL,
	[PricePerUnit] [numeric](18, 4) NULL,
	[DrugType] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAH_20191016]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAH_20191016](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL,
	[OrderNo] [varchar](20) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAH_MYLAN_20171219]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAH_MYLAN_20171219](
	[NDC] [varchar](11) NULL,
	[Qty] [numeric](38, 0) NULL,
	[Sales] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAH_NDC]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAH_NDC](
	[MaxDateKey] [int] NULL,
	[NDC] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAH_NDC_2]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAH_NDC_2](
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[Type] [varchar](15) NULL,
	[BRAND] [varchar](31) NULL,
	[MaxDateKey] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAHBrand]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAHBrand](
	[CIN] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[NDC] [nvarchar](20) NULL,
	[Size] [numeric](18, 3) NULL,
	[Strength] [nvarchar](50) NULL,
	[Col1] [nvarchar](50) NULL,
	[CAHPrice] [numeric](18, 4) NULL,
	[Col2] [nvarchar](50) NULL,
	[Col3] [nvarchar](50) NULL,
	[Contract] [nvarchar](50) NULL,
	[Col10] [nvarchar](50) NULL,
	[Col11] [numeric](18, 4) NULL,
	[Col12] [nvarchar](50) NULL,
	[Column 13] [nvarchar](50) NULL,
	[Column 14] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[UnitOfIssue] [nvarchar](50) NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[dateloaded] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAHContract]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAHContract](
	[Change Type] [nvarchar](255) NULL,
	[General Description] [nvarchar](255) NULL,
	[Form] [nvarchar](255) NULL,
	[UM] [nvarchar](255) NULL,
	[Supplier] [nvarchar](255) NULL,
	[NDC] [nvarchar](100) NULL,
	[CIN] [float] NULL,
	[DP] [float] NULL,
	[Old Price] [numeric](18, 6) NULL,
	[New Price] [numeric](18, 6) NULL,
	[WAC] [numeric](18, 6) NULL,
	[F12] [nvarchar](255) NULL,
	[Brand Name] [nvarchar](255) NULL,
	[Reason Code] [nvarchar](255) NULL,
	[Effect Dte] [datetime] NULL,
	[UOM] [nvarchar](255) NULL,
	[Usage] [float] NULL,
	[GCN] [nvarchar](255) NULL,
	[Size] [nvarchar](50) NULL,
	[Old PPU] [numeric](18, 6) NULL,
	[New PPU] [numeric](18, 6) NULL,
	[Loaddate] [smalldatetime] NULL,
	[WS] [int] NULL,
	[20Percent] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAHInvoiceDetailAZ]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAHInvoiceDetailAZ](
	[AZMaxRowversionID] [varchar](25) NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAHstaccount_20190822]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAHstaccount_20190822](
	[new_pmid] [nvarchar](100) NULL,
	[Original_new_cahstaccount] [nvarchar](250) NULL,
	[new_cahstaccount] [nvarchar](250) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardinalComplete]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalComplete](
	[UNITPRODUCT] [nvarchar](50) NULL,
	[SCANNEDUNITPRODUCTCODE] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[CARDINALITEMNUMBER] [nvarchar](50) NULL,
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
	[Adj Rebate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardinalComplete_bkp_032717]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalComplete_bkp_032717](
	[UNITPRODUCT] [nvarchar](50) NULL,
	[SCANNEDUNITPRODUCTCODE] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[CARDINALITEMNUMBER] [nvarchar](50) NULL,
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
	[Adj Rebate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardinalComplete_bkp040117]    Script Date: 12/22/2020 3:43:11 AM ******/
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
/****** Object:  Table [dbo].[CardinalComplete_test]    Script Date: 12/22/2020 3:43:11 AM ******/
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
/****** Object:  Table [dbo].[CardinalCompleteHistory]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalCompleteHistory](
	[UNITPRODUCT] [nvarchar](50) NULL,
	[SCANNEDUNITPRODUCTCODE] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[CARDINALITEMNUMBER] [nvarchar](50) NULL,
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
	[LoadDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CardinalCompleteV1]    Script Date: 12/22/2020 3:43:11 AM ******/
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
/****** Object:  Table [dbo].[CardinalCompleteV2]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CardinalCompleteV2](
	[UNITPRODUCT] [nvarchar](50) NULL,
	[SCANNEDUNITPRODUCTCODE] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[CARDINALITEMNUMBER] [nvarchar](50) NULL,
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
	[API ITEM #] [nvarchar](50) NULL,
	[API PRICE] [float] NULL,
	[Adj Rebate] [nvarchar](50) NULL,
	[GPI] [nvarchar](50) NULL,
	[API_Size] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_Bashas]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Bashas](
	[Customer] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[StoreNo] [varchar](255) NULL,
	[NCPDP] [varchar](255) NULL,
	[CAAcctNo] [varchar](50) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[AdminFee] [numeric](18, 2) NULL,
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_BASHAS_BKP]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_BASHAS_BKP](
	[Customer] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[StoreNo] [varchar](255) NULL,
	[NCPDP] [varchar](255) NULL,
	[CAAcctNo] [varchar](50) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[AdminFee] [numeric](18, 2) NULL,
	[Date] [datetime] NULL,
	[PMID] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CH_PMIDXref]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_PMIDXref](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [int] NULL,
	[IsResearched] [smallint] NULL,
	[AccountName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[address] [varchar](200) NULL,
	[city] [varchar](200) NULL,
	[state] [varchar](200) NULL,
	[zip] [varchar](50) NULL,
 CONSTRAINT [pk_id] PRIMARY KEY NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHAAP_ACCTNO_MISMATCH]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHAAP_ACCTNO_MISMATCH](
	[PMID] [int] NULL,
	[AcctNoCHDetail] [varchar](31) NULL,
	[AcctNoCHAccounts] [varchar](31) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chaap_genrebate_test]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chaap_genrebate_test](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[CHAccountNo] [float] NULL,
	[DCNum] [int] NULL,
	[DCCity] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](50) NULL,
	[ZIP] [varchar](50) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[GENQual] [float] NULL,
	[GENRebate] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPH_AAP]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_AAP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL,
	[OrderNo] [varchar](20) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
	[DEA] [varchar](25) NULL,
	[InvoiceLineNmbr] [int] NULL,
 CONSTRAINT [PK_CHPH_AAP_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [psCAH]([DateKey])
) ON [psCAH]([DateKey])
GO
/****** Object:  Table [dbo].[chph_aap_bkp]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_aap_bkp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPH_AAP_CustomerSummary]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_AAP_CustomerSummary](
	[PMID] [int] NULL,
	[Date] [datetime] NULL,
	[BrandUnits] [numeric](38, 0) NULL,
	[GenericUnits] [numeric](38, 0) NULL,
	[BrandSales] [float] NULL,
	[GenericSales] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPH_AAP_DEXAMETHASONE4MG_March2018]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_AAP_DEXAMETHASONE4MG_March2018](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL,
	[OrderNo] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPH_AAP_ETL]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_AAP_ETL](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[ID] [int] NOT NULL,
	[RowversionID] [timestamp] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[DateKey] [int] NOT NULL,
 CONSTRAINT [CPK_CHPH_AAP_ETL] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPH_AAP_Test]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_AAP_Test](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL,
	[OrderNo] [varchar](20) NULL,
	[RowUpdatedDate] [datetime] NULL,
 CONSTRAINT [CPK_Test] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chph_api_test]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chph_api_test](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPH_loadlog]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_loadlog](
	[filename] [varchar](255) NULL,
	[date_loaded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHPrice]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPrice](
	[NDC] [nvarchar](50) NULL,
	[PricePerUnit] [numeric](19, 4) NULL,
	[DateLoaded] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[WeekNo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHRebates]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHRebates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[PMID] [int] NULL,
	[NCPDP] [varchar](20) NULL,
	[CHRebatePerc] [float] NULL,
 CONSTRAINT [PK_CHRebates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHRebates_Backup_20191218]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHRebates_Backup_20191218](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[PMID] [int] NULL,
	[NCPDP] [varchar](20) NULL,
	[CHRebatePerc] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHRebates_bk20190723]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHRebates_bk20190723](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[PMID] [int] NULL,
	[NCPDP] [varchar](20) NULL,
	[CHRebatePerc] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHRebates_bkp020214]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHRebates_bkp020214](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[PMID] [int] NULL,
	[NCPDP] [varchar](20) NULL,
	[CHRebatePerc] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHSource]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHSource](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ UDS Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](200) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC UPC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 4) NULL,
	[DateLoaded] [smalldatetime] NULL,
	[Wholesaler] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHSourceAll]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHSourceAll](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ UDS Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](200) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC UPC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[Price Per Unit] [numeric](18, 4) NULL,
	[DateLoaded] [smalldatetime] NULL,
	[Wholesaler] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHTop100]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHTop100](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](60) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[Top100Price] [money] NULL,
	[UDSPrice] [money] NULL,
	[PricePerUnit] [money] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](60) NULL,
	[Color] [varchar](60) NULL,
	[NDC] [varchar](15) NULL,
	[CIN] [varchar](15) NOT NULL,
	[DP] [varchar](15) NULL,
	[GPI] [varchar](14) NULL,
	[GCN] [varchar](6) NULL,
	[GCN_SEQNO] [varchar](6) NULL,
	[Filedate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHTop100All]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHTop100All](
	[Description] [nvarchar](255) NULL,
	[Size] [nvarchar](60) NULL,
	[Supplier] [nvarchar](255) NULL,
	[AWP] [money] NULL,
	[Top100Price] [money] NULL,
	[UDSPrice] [money] NULL,
	[PricePerUnit] [money] NULL,
	[BrandName] [varchar](255) NULL,
	[Form] [varchar](60) NULL,
	[Color] [varchar](60) NULL,
	[NDC] [varchar](15) NULL,
	[CIN] [varchar](15) NOT NULL,
	[DP] [varchar](15) NULL,
	[GPI] [varchar](14) NULL,
	[GCN] [varchar](6) NULL,
	[GCN_SEQNO] [varchar](6) NULL,
	[Filedate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_diag032516]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_diag032516](
	[NDC] [nvarchar](50) NULL,
	[PricePerUnit] [numeric](19, 4) NULL,
	[DateLoaded] [datetime] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[WeekNo] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_diag032516b]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_diag032516b](
	[NDC] [nvarchar](50) NULL,
	[030816] [numeric](19, 4) NULL,
	[031516] [numeric](19, 4) NULL,
	[032216] [numeric](19, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[delete_TristateCINs]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_TristateCINs](
	[Tri State CIN] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[import_selected30day_030111]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_selected30day_030111](
	[NDC] [nvarchar](255) NULL,
	[CARDINALITEMNUMBER] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NDC TABLE]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NDC TABLE](
	[brand] [nvarchar](50) NULL,
	[otc] [nvarchar](50) NULL,
	[card says OTC] [nvarchar](50) NULL,
	[dont carry at this time] [nvarchar](50) NULL,
	[generic] [nvarchar](50) NULL,
	[api carries] [nvarchar](50) NULL,
	[ndc] [nvarchar](50) NULL,
	[ndcdot] [nvarchar](50) NULL,
	[description] [nvarchar](500) NULL,
	[um] [nvarchar](50) NULL,
	[strength] [nvarchar](50) NULL,
	[gpi] [nvarchar](50) NULL,
	[size] [nvarchar](50) NULL,
	[size2] [nvarchar](50) NULL,
	[api  ] [nvarchar](50) NULL,
	[api desc] [nvarchar](50) NULL,
	[api mfg] [nvarchar](50) NULL,
	[api price] [nvarchar](50) NULL,
	[TMP SIZE] [nvarchar](50) NULL,
	[Mfg] [nvarchar](50) NULL,
	[MfgCode] [nvarchar](50) NULL,
	[scan code] [nvarchar](50) NULL,
	[cah desc] [nvarchar](50) NULL,
	[cah mfg] [nvarchar](50) NULL,
	[cah cin] [nvarchar](50) NULL,
	[cah size] [nvarchar](50) NULL,
	[cah contract] [nvarchar](50) NULL,
	[cah uoi] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NDCList]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NDCList](
	[ndc] [varchar](11) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OR_Scott_20200624]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OR_Scott_20200624](
	[Customer] [varchar](63) NULL,
	[API ITEM] [varchar](13) NULL,
	[APINDC] [nvarchar](20) NULL,
	[API PRICE] [numeric](28, 4) NULL,
	[APIExt] [numeric](38, 4) NULL,
	[Adj Rebate] [numeric](10, 3) NULL,
	[NDC] [varchar](15) NULL,
	[ItemDesc] [varchar](255) NULL,
	[FDB_PKG_SIZE] [numeric](8, 3) NULL,
	[SHIP_QTY] [numeric](38, 0) NULL,
	[Unit_Cost] [float] NULL,
	[Ext_Cost] [float] NULL,
	[DrugType] [varchar](31) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CH_Bashas]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_Bashas](
	[PMID] [numeric](18, 0) NULL,
	[Date] [datetime] NULL,
	[UDAcctNo] [varchar](255) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[AdminFee] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PM_CH_Bashas_BKP]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_Bashas_BKP](
	[PMID] [numeric](18, 0) NULL,
	[Date] [datetime] NULL,
	[UDAcctNo] [varchar](255) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[AdminFee] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[purchases_work]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchases_work](
	[PMID] [int] NULL,
	[CHAccountNo] [int] NULL,
	[IsResearched] [smallint] NULL,
	[AccountName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[address] [varchar](200) NULL,
	[city] [varchar](200) NULL,
	[state] [varchar](200) NULL,
	[zip] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_NDCList]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_NDCList](
	[NDC] [varchar](11) NOT NULL,
	[NDC11] [varchar](11) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[report_NDCList2]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_NDCList2](
	[NDC] [varchar](11) NOT NULL,
	[NDC11] [varchar](11) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SourceBackup]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SourceBackup](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ PSB Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[PricePerUnit] [nvarchar](50) NULL,
	[dateloaded] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SourceBackupAll]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SourceBackupAll](
	[Description] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Supplier] [nvarchar](50) NULL,
	[ AWP ] [nvarchar](50) NULL,
	[ PSB Sell ] [nvarchar](50) NULL,
	[Brand Name] [nvarchar](50) NULL,
	[Form] [nvarchar](50) NULL,
	[Color] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[CIN] [nvarchar](50) NULL,
	[DP#] [nvarchar](50) NULL,
	[PricePerUnit] [nvarchar](50) NULL,
	[dateloaded] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Brand_CHPrice]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Brand_CHPrice](
	[NDC] [nvarchar](50) NULL,
	[CARDINALITEMNUMBER] [nvarchar](50) NULL,
	[BRANDNAME] [nvarchar](50) NULL,
	[GENERICPRODUCTDESCRIPTION] [nvarchar](50) NULL,
	[INVOICEPRICE] [nvarchar](50) NULL,
	[DrugTypeShort] [varchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CAHBrand]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CAHBrand](
	[CIN] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[NDC] [nvarchar](20) NULL,
	[Size] [numeric](18, 3) NULL,
	[Strength] [nvarchar](50) NULL,
	[Col1] [nvarchar](50) NULL,
	[CAHPrice] [numeric](18, 4) NULL,
	[Col2] [nvarchar](50) NULL,
	[Col3] [nvarchar](50) NULL,
	[Contract] [nvarchar](50) NULL,
	[Col10] [nvarchar](50) NULL,
	[Col11] [numeric](18, 4) NULL,
	[Col12] [nvarchar](50) NULL,
	[Column 13] [nvarchar](50) NULL,
	[Column 14] [nvarchar](50) NULL,
	[Column 15] [nvarchar](50) NULL,
	[UnitOfIssue] [nvarchar](50) NULL,
	[Manufacturer] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CHRebates]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHRebates](
	[Date] [datetime] NULL,
	[month] [int] NULL,
	[year] [int] NULL,
	[PMID] [numeric](18, 0) NULL,
	[NCPDP] [varchar](20) NULL,
	[CalcRebatePerc] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_CHRebates_Active]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_CHRebates_Active](
	[Date] [datetime] NULL,
	[month] [int] NULL,
	[year] [int] NULL,
	[PMID] [numeric](18, 0) NULL,
	[NCPDP] [varchar](20) NULL,
	[CalcRebatePerc] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete](
	[Brand Name] [nvarchar](255) NULL,
	[National Drug Code] [nvarchar](255) NULL,
	[Therapeutic Class GC3 Description] [nvarchar](255) NULL,
	[WAC Unit Price 1] [float] NULL,
	[AWP Unit Price 1] [float] NULL,
	[ndc] [varchar](15) NULL,
	[ncpdp] [varchar](20) NULL,
	[order_qty] [numeric](38, 0) NULL,
	[ship_qty] [numeric](38, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_delete_CHPH_0810]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_delete_CHPH_0810](
	[pmid] [int] NULL,
	[customer_name] [varchar](63) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGeneric] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [numeric](1, 1) NOT NULL,
	[UDAdminOnly] [numeric](1, 1) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_HighVol]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_HighVol](
	[NDC] [varchar](15) NULL,
	[TotalQty] [numeric](38, 0) NULL,
	[VolumeAmt] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_import_SpecialtyList1110]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_import_SpecialtyList1110](
	[Brand Name] [nvarchar](255) NULL,
	[National Drug Code] [nvarchar](255) NULL,
	[Therapeutic Class GC3 Description] [nvarchar](255) NULL,
	[WAC Unit Price 1] [float] NULL,
	[AWP Unit Price 1] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_MylanUse]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_MylanUse](
	[F1] [nvarchar](255) NULL,
	[F2] [nvarchar](255) NULL,
	[NDC] [float] NULL,
	[Size] [nvarchar](255) NULL,
	[Units] [float] NULL,
	[Dollars] [money] NULL,
	[Vendor Description] [nvarchar](255) NULL,
	[Vendor Number] [float] NULL,
	[CIN] [float] NULL,
	[Trade Name] [nvarchar](255) NULL,
	[Generic Name] [nvarchar](255) NULL,
	[Strength] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_Q1_by_NDC_NCPDP]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_by_NDC_NCPDP](
	[ndc] [varchar](15) NULL,
	[ncpdp] [varchar](20) NULL,
	[order_qty] [numeric](38, 0) NULL,
	[ship_qty] [numeric](38, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_report_30dayTest030111]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_30dayTest030111](
	[ndc] [nvarchar](255) NULL,
	[CARDINALITEMNUMBER] [nvarchar](255) NULL,
	[lineitems] [int] NULL,
	[sum_order_qty] [numeric](38, 0) NULL,
	[sum_ship_qty] [numeric](38, 0) NULL,
	[sum_ext_cost] [float] NULL,
	[sum_corp_awp] [float] NULL,
	[sum_wac] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_report1]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report1](
	[NDC] [varchar](11) NULL,
	[pmid] [int] NULL,
	[total_ship_qty] [numeric](38, 0) NULL,
	[total_ext_cost] [float] NULL,
	[total_corp_awp] [float] NULL,
	[total_wac] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_report2]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report2](
	[inputNDC] [varchar](11) NULL,
	[total_ship_qty] [numeric](38, 0) NULL,
	[total_ext_cost] [float] NULL,
	[total_corp_awp] [float] NULL,
	[total_wac] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_report3]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report3](
	[inputNDC] [varchar](11) NULL,
	[total_ship_qty] [numeric](38, 0) NULL,
	[total_ext_cost] [float] NULL,
	[total_corp_awp] [float] NULL,
	[total_wac] [float] NULL,
	[NDC] [varchar](11) NULL,
	[NDCtype] [varchar](5) NULL,
	[GCN_SEQNO] [numeric](6, 0) NULL,
	[GCN] [numeric](5, 0) NULL,
	[type] [varchar](3) NULL,
	[label] [varchar](60) NULL,
	[Standard_TC] [varchar](50) NULL,
	[strength] [varchar](10) NULL,
	[PkgDesc] [varchar](10) NULL,
	[DrugForm] [varchar](12) NULL,
	[PkgSize] [numeric](11, 3) NULL,
	[MFG] [varchar](15) NULL,
	[DEA] [varchar](1) NULL,
	[obsolete_date] [datetime] NULL,
	[RxOTC] [varchar](3) NULL,
	[repack] [varchar](6) NULL,
	[fdb_awp_unit] [float] NULL,
	[fdb_awp_pkg] [float] NULL,
	[fdb_wac_unit] [float] NULL,
	[fdb_wac_pkg] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_report4]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report4](
	[NDC] [varchar](11) NULL,
	[contractno] [varchar](31) NULL,
	[contractdesc] [varchar](255) NULL,
	[total_ship_qty] [numeric](38, 0) NULL,
	[total_ext_cost] [float] NULL,
	[total_corp_awp] [float] NULL,
	[total_wac] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_TriState_081816]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_TriState_081816](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL,
	[OrderNo] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tmp_UPTopGCN]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_UPTopGCN](
	[GCN] [numeric](5, 0) NOT NULL,
	[TradeName] [varchar](127) NULL,
	[Stength] [varchar](127) NULL,
	[UnitCost] [float] NULL,
	[TotalextCost] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[APIPrice]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIPrice](
	[APIItemNbr] [nvarchar](50) NULL,
	[NDC] [nvarchar](20) NULL,
	[Description] [nvarchar](200) NULL,
	[Unit] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Contract] [nvarchar](50) NULL,
	[APIPrice] [nvarchar](50) NULL,
	[PricePerUnit] [numeric](18, 4) NULL,
	[GPI] [nvarchar](50) NULL,
	[AdjRebate] [numeric](18, 4) NULL,
	[UnitNet] [numeric](18, 6) NULL,
	[BillableSize] [nvarchar](50) NULL,
	[dateloaded] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[CAHAccount]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CAHAccount](
	[PMID] [int] NULL,
	[CAHAccountNo] [nvarchar](250) NULL,
	[AAPEffectiveDate] [date] NULL,
	[AAPQuitDate] [date] NOT NULL,
	[AAPEffectiveDateKey] [int] NULL,
	[AAPQuitDateKey] [int] NULL,
	[CorrectedCAHAccountNo] [nvarchar](250) NULL,
	[AAPAccountNo] [nvarchar](100) NULL,
	[PreviousMemberPMID] [int] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[CAHAccounts_old_RSE_20191117]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CAHAccounts_old_RSE_20191117](
	[PMID] [int] NULL,
	[CAHAccountPrimary] [nvarchar](100) NULL,
	[CAHAccount2] [nvarchar](100) NULL,
	[CAHAccount3] [nvarchar](100) NULL,
	[CAHCSOSAccount] [nvarchar](100) NULL,
	[CAHPOSAccount] [nvarchar](100) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[CAHSpecialtyAccount] [nvarchar](100) NULL,
	[CAHOTCAccount] [nvarchar](100) NULL,
	[CAHDMEAccount] [nvarchar](100) NULL,
	[CAHDepositAccount] [nvarchar](100) NULL,
	[CAHScanTossAccount] [nvarchar](250) NULL,
	[APIAccountNo] [nvarchar](100) NULL,
	[AAPStartDate] [date] NULL,
	[AAPEndDate] [date] NULL,
	[CAHComboAccount] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[CardinalComplete]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CardinalComplete](
	[UNITPRODUCT] [nvarchar](50) NULL,
	[SCANNEDUNITPRODUCTCODE] [nvarchar](50) NULL,
	[NDC] [nvarchar](50) NULL,
	[CARDINALITEMNUMBER] [nvarchar](50) NULL,
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
	[Adj Rebate] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[CHPH_AAP]    Script Date: 12/22/2020 3:43:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CHPH_AAP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NOT NULL,
	[DC] [int] NULL,
	[CUSTOMER_NAME] [varchar](63) NULL,
	[CUSTOMER_NO] [varchar](31) NULL,
	[ITEM_NO] [varchar](31) NULL,
	[PMID] [int] NULL,
	[STORE] [varchar](31) NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_TYPE] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[GENERIC_NAME] [varchar](127) NULL,
	[TRADE_NAME] [varchar](127) NULL,
	[INV_DATE] [datetime] NULL,
	[INVOICE_NO] [varchar](15) NULL,
	[TYPE] [varchar](15) NULL,
	[ORDER_QTY] [numeric](18, 0) NULL,
	[SHIP_QTY] [numeric](18, 0) NULL,
	[UNIT_COST] [float] NULL,
	[EXT_COST] [float] NULL,
	[CORP_AWP] [float] NULL,
	[WAC] [float] NULL,
	[VENDOR_NAME] [varchar](127) NULL,
	[UPC] [varchar](127) NULL,
	[CONTRACT_FLAG] [varchar](31) NULL,
	[BRAND] [varchar](31) NULL,
	[GENERIC_CODE] [varchar](31) NULL,
	[STRENGTH] [varchar](127) NULL,
	[SHORT_CODE] [varchar](31) NULL,
	[ENCODING] [varchar](31) NULL,
	[ContractNo] [varchar](31) NULL,
	[ContractDesc] [varchar](255) NULL,
	[MM_DD_YY_LOAD] [datetime] NULL,
	[OrderNo] [varchar](20) NULL,
	[InvoiceLineNmbr] [int] NULL,
	[DEA] [varchar](25) NULL,
 CONSTRAINT [PK_Staging_CHPH_AAP_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [psCAH]([DateKey])
) ON [psCAH]([DateKey])
GO
ALTER TABLE [dbo].[CAHInvoiceDetailAZ] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[CH_PMIDXref] ADD  CONSTRAINT [DF_CH_PMIDXref_IsResearched]  DEFAULT ((0)) FOR [IsResearched]
GO
ALTER TABLE [dbo].[CHPH_AAP] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[CHPH_AAP_ETL] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [dbo].[CHPH_AAP_ETL] ADD  DEFAULT ((0)) FOR [DateKey]
GO
ALTER TABLE [Staging].[CAHAccount] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[CAHAccounts_old_RSE_20191117] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
ALTER TABLE [Staging].[CHPH_AAP] ADD  DEFAULT ((0)) FOR [PMID]
GO
