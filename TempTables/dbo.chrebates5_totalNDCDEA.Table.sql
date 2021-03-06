USE [TempTables]
GO
/****** Object:  Table [dbo].[chrebates5_totalNDCDEA]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrebates5_totalNDCDEA](
	[year] [int] NULL,
	[month] [int] NULL,
	[NDC] [varchar](15) NULL,
	[GPI] [varchar](14) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[DEA] [int] NOT NULL,
	[SR] [varchar](6) NOT NULL,
	[QTY_SUM] [numeric](38, 0) NULL,
	[EXT_COST_SUM] [float] NULL
) ON [PRIMARY]
GO
