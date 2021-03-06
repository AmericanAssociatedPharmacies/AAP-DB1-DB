USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_GRProposedReport2_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_GRProposedReport2_del](
	[store] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[eff] [datetime] NULL,
	[acct_no] [varchar](4) NULL,
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
	[ChangePercent] [float] NULL,
	[COGS] [float] NULL,
	[terms] [nvarchar](4000) NULL,
	[ProposedOriginal] [float] NULL,
	[EffPctOriginal] [float] NULL
) ON [PRIMARY]
GO
