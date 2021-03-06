USE [Purchases]
GO
/****** Object:  Table [dbo].[OR_Scott_20200624]    Script Date: 12/22/2020 4:55:34 AM ******/
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
