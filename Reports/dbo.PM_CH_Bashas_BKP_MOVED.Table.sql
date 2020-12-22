USE [Reports]
GO
/****** Object:  Table [dbo].[PM_CH_Bashas_BKP_MOVED]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CH_Bashas_BKP_MOVED](
	[PMID] [numeric](18, 0) NULL,
	[Date] [datetime] NULL,
	[UDAcctNo] [varchar](255) NULL,
	[ExtSales] [numeric](18, 2) NULL,
	[AdminFee] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
