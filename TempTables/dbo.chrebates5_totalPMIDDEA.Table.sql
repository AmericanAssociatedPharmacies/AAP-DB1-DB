USE [TempTables]
GO
/****** Object:  Table [dbo].[chrebates5_totalPMIDDEA]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chrebates5_totalPMIDDEA](
	[year] [int] NULL,
	[month] [int] NULL,
	[PMID] [int] NULL,
	[DEA] [int] NOT NULL,
	[SR] [varchar](6) NOT NULL,
	[QTY_SUM] [numeric](38, 0) NULL,
	[EXT_COST_SUM] [float] NULL
) ON [PRIMARY]
GO
