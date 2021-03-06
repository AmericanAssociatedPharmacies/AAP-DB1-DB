USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_admin_rebate_rpt]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_admin_rebate_rpt](
	[nsterritory] [varchar](2) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[acct_no] [varchar](4) NULL,
	[January_r] [numeric](38, 2) NULL,
	[February_r] [numeric](38, 2) NULL,
	[March_r] [numeric](38, 2) NULL,
	[April_r] [numeric](38, 2) NULL,
	[May_r] [numeric](38, 2) NULL,
	[June_r] [numeric](38, 2) NULL,
	[January_v] [numeric](38, 2) NULL,
	[February_v] [numeric](38, 2) NULL,
	[March_v] [numeric](38, 2) NULL,
	[April_v] [numeric](38, 2) NULL,
	[May_v] [numeric](38, 2) NULL,
	[June_v] [numeric](38, 2) NULL,
	[VolAvg6mo] [numeric](38, 2) NULL,
	[RebAvg6mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
