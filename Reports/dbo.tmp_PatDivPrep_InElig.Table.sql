USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PatDivPrep_InElig]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PatDivPrep_InElig](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[Affiliate] [varchar](125) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Is MC] [varchar](3) NOT NULL,
	[MCQuitDate] [datetime] NULL,
	[ML Admin Fee] [numeric](38, 2) NULL,
	[Bashas Admin Fee] [numeric](38, 2) NULL,
	[HIGH VOL INCENTIVE] [numeric](38, 2) NULL,
	[AAP PVA Vol Admin Fee] [numeric](38, 2) NULL,
	[AAP PVA Vol Admin Fee Retained] [numeric](38, 2) NULL,
	[AAP PVA Gen Admin Fee] [numeric](38, 2) NULL,
	[AAP PVA Gen Admin Fee Retained] [numeric](38, 2) NULL,
	[IPA Generic Admin Fee] [numeric](38, 2) NULL,
	[Cardinal Annual Rebate] [numeric](38, 2) NULL,
	[WH Brand 2019] [numeric](38, 2) NULL,
	[WH Gen 2019] [numeric](38, 2) NULL,
	[WH OTC 2019] [numeric](38, 2) NULL,
	[WH Total 2019] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
