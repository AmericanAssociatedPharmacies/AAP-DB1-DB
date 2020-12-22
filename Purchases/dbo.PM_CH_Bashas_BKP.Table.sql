USE [Purchases]
GO
/****** Object:  Table [dbo].[PM_CH_Bashas_BKP]    Script Date: 12/22/2020 4:55:34 AM ******/
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
