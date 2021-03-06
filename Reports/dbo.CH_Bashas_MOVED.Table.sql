USE [Reports]
GO
/****** Object:  Table [dbo].[CH_Bashas_MOVED]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CH_Bashas_MOVED](
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
