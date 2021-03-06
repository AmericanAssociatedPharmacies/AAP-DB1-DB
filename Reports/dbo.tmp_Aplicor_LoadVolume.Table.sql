USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_Aplicor_LoadVolume]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Aplicor_LoadVolume](
	[PMID] [int] NOT NULL,
	[APIACCOUNTNO] [varchar](20) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[PVA Monthly Average (BusinessAccount.Account0813)] [numeric](38, 2) NULL,
	[AVG Comb Volume  (BusinessAccount.Account0812)] [numeric](38, 2) NULL,
	[Monthly Vol (BusinessAccount.Account0817] [numeric](38, 2) NULL,
	[Brand Rx (BusinessAccount.Account0816)] [numeric](38, 2) NULL,
	[Generic Rx (BusinessAccount.Account0815)] [numeric](38, 2) NULL,
	[OTC (BusinessAccount.Account0814)] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
