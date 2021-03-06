USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_admin_rebate_rpt_AAP]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_admin_rebate_rpt_AAP](
	[nsterritory] [varchar](2) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[acct_no] [varchar](4) NULL,
	[May_r] [numeric](38, 2) NULL,
	[June_r] [numeric](38, 2) NULL,
	[July_r] [numeric](38, 2) NULL,
	[August_r] [numeric](38, 2) NULL,
	[September_r] [numeric](38, 2) NULL,
	[October_r] [numeric](38, 2) NULL,
	[May_v] [numeric](38, 2) NULL,
	[June_v] [numeric](38, 2) NULL,
	[July_v] [numeric](38, 2) NULL,
	[August_v] [numeric](38, 2) NULL,
	[September_v] [numeric](38, 2) NULL,
	[October_v] [numeric](38, 2) NULL,
	[VolAvg6mo] [numeric](38, 2) NULL,
	[RebAvg6mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
