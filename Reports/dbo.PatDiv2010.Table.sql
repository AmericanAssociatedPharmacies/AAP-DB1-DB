USE [Reports]
GO
/****** Object:  Table [dbo].[PatDiv2010]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatDiv2010](
	[PMID] [float] NULL,
	[TM] [float] NULL,
	[AccountName] [nvarchar](255) NULL,
	[AAPAccountNo] [float] NULL,
	[AAPParentNo] [float] NULL,
	[UDAccountNo] [float] NULL,
	[APIAccountNo] [float] NULL,
	[Affiliate] [nvarchar](255) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[Is MC] [nvarchar](255) NULL,
	[MCQuitDate] [datetime] NULL,
	[ML Admin Fee] [float] NULL,
	[UD PVA Vol Admin] [float] NULL,
	[Bashas Admin Fee] [float] NULL,
	[API PVA API Admin] [float] NULL,
	[API PVA Gen Admin] [float] NULL,
	[AAP PVA Vol Admin] [float] NULL,
	[AAP PVA Gen Admin] [float] NULL,
	[WH Brand 2010] [float] NULL,
	[F21] [float] NULL,
	[WH Gen 2010] [float] NULL,
	[F23] [float] NULL,
	[WH OTC 2010] [float] NULL,
	[F25] [float] NULL,
	[Cardinal Annual Rebate] [float] NULL,
	[Contribution] [float] NULL,
	[20% MC Participants Only PD] [float] NULL,
	[80% All Participants PD] [float] NULL,
	[Total PD] [float] NULL,
	[Pay Apr 22] [float] NULL,
	[Pay July] [float] NULL
) ON [PRIMARY]
GO
