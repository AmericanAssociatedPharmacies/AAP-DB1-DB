USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_PatDivPrep]    Script Date: 12/22/2020 5:00:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_PatDivPrep](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[UDAccountNo] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[Affiliate] [varchar](125) NULL,
	[AAPQuitDate] [datetime] NULL,
	[MCQuitDate] [datetime] NULL,
	[Is MC] [varchar](3) NOT NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[API Brand 2010] [float] NULL,
	[API Gen 2010] [float] NULL,
	[API OTC 2010] [float] NULL,
	[API Total 2010] [float] NULL,
	[ML Vol Admin] [float] NULL,
	[UD PVA Vol Admin] [float] NULL,
	[AAP PVA Vol Admin] [float] NULL,
	[AAP PVA Gen Admin] [float] NULL,
	[UD PVA Gen Admin] [float] NULL,
	[API PVA API Admin] [float] NULL,
	[API PVA Gen Admin] [float] NULL,
	[API PVA Vol Admin] [float] NULL,
	[WH Brand 2010] [float] NULL,
	[WH Gen 2010] [float] NULL,
	[WH OTC 2010] [float] NULL,
	[WH Total 2010] [float] NULL
) ON [PRIMARY]
GO
