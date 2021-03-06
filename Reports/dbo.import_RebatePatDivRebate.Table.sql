USE [Reports]
GO
/****** Object:  Table [dbo].[import_RebatePatDivRebate]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_RebatePatDivRebate](
	[Year] [varchar](50) NULL,
	[PMID] [varchar](50) NULL,
	[AccountName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](255) NULL,
	[AAPParentNo] [varchar](255) NULL,
	[UDNo] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[Affiliate] [varchar](255) NULL,
	[AAPEffectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[IsMC] [varchar](255) NULL,
	[MCQuitDate] [datetime] NULL,
	[MCContribution] [money] NULL,
	[MLAdminFee] [money] NULL,
	[HighVolIncentive] [money] NULL,
	[AAPPVAVolAdminFee] [money] NULL,
	[AAPPVAVolAdminFeeRetained] [money] NULL,
	[AAPPVAGenAdminFee] [money] NULL,
	[AAPPVAGenAdminFeeRetained] [money] NULL,
	[CardinalAnnualRebate] [money] NULL,
	[SubtotalCardinal] [money] NULL,
	[CardinalUpfrontAdmin] [money] NULL,
	[CardinalHVTotal] [money] NULL,
	[AAPParentContribution] [money] NULL,
	[WHBrandYear] [money] NULL,
	[WHGenYear] [money] NULL,
	[WHGenContribution] [money] NULL,
	[WHOTCYear] [money] NULL,
	[MCCardinalAPIWhseContribution] [money] NULL,
	[PrelimAllocation] [money] NULL,
	[Under15deleted] [money] NULL,
	[FinalAllocation] [money] NULL,
	[HalfOfAllocation] [money] NULL,
	[PaymentMethod] [varchar](255) NULL,
	[CheckFee] [money] NULL,
	[FirstPayment] [money] NULL,
	[SecondPayment] [money] NULL,
	[PatDivRebate] [money] NULL
) ON [PRIMARY]
GO
