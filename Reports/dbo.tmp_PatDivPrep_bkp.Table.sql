USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PatDivPrep_bkp]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PatDivPrep_bkp](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[Affiliate] [varchar](125) NULL,
	[Is MC] [varchar](3) NOT NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[WH Brand 2010] [float] NULL,
	[WH Gen 2010] [float] NULL,
	[WH OTC 2010] [float] NULL,
	[WH Total 2010] [float] NULL,
	[AAP PVA AdminFee] [float] NULL,
	[UD PVA AdminFee] [float] NULL,
	[API PVA AdminFee] [float] NULL,
	[ML AdminFee] [float] NULL
) ON [PRIMARY]
GO
