USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PatDivPrep_InEligBKP]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PatDivPrep_InEligBKP](
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
	[UD PVA Vol Admin] [numeric](38, 2) NULL,
	[UD PVA Gen Admin] [numeric](38, 2) NULL,
	[Bashas Admin Fee] [numeric](38, 2) NULL,
	[API PVA API Admin] [numeric](38, 2) NULL,
	[API PVA Gen Admin] [numeric](38, 2) NULL,
	[AAP PVA Vol Admin] [numeric](38, 2) NULL,
	[AAP PVA Gen Admin] [numeric](38, 2) NULL,
	[WH Brand 2010] [numeric](38, 2) NULL,
	[WH Gen 2010] [numeric](38, 2) NULL,
	[WH OTC 2010] [numeric](38, 2) NULL,
	[WH Total 2010] [numeric](38, 2) NULL,
	[Cardinal Annual Rebate] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
