USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_GRProposedReport1_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GRProposedReport1_del](
	[ud_acct] [char](4) NULL,
	[totalvol] [float] NULL,
	[rxvol] [numeric](38, 2) NULL,
	[genvol] [numeric](38, 2) NULL,
	[GCRate] [numeric](38, 6) NULL,
	[CalcRebate] [float] NULL,
	[RebatePercent] [float] NULL,
	[ProposedRebate] [float] NULL,
	[EffectivePercent] [float] NULL,
	[Change] [float] NULL,
	[ChangePercent] [float] NULL
) ON [PRIMARY]
GO
