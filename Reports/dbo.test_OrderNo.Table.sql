USE [Reports]
GO
/****** Object:  Table [dbo].[test_OrderNo]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_OrderNo](
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
