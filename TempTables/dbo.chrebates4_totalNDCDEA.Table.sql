USE [TempTables]
GO
/****** Object:  Table [dbo].[chrebates4_totalNDCDEA]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrebates4_totalNDCDEA](
	[month] [int] NULL,
	[year] [int] NULL,
	[NDC] [varchar](15) NULL,
	[ITEM_DESCR] [varchar](127) NULL,
	[DEA] [int] NOT NULL,
	[QTY] [numeric](38, 0) NULL,
	[EXT_COST] [float] NULL
) ON [PRIMARY]
GO
