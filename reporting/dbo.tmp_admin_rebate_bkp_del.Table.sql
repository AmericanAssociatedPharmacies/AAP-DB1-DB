USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_admin_rebate_bkp_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_admin_rebate_bkp_del](
	[nsterritory] [varchar](2) NULL,
	[store] [varchar](65) NULL,
	[state] [varchar](2) NULL,
	[type] [varchar](15) NULL,
	[acct_no] [varchar](4) NULL,
	[july_r] [numeric](15, 2) NULL,
	[august_r] [numeric](15, 2) NULL,
	[september_r] [numeric](15, 2) NULL,
	[october_r] [numeric](15, 2) NULL,
	[november_r] [numeric](15, 2) NULL,
	[december_r] [numeric](15, 2) NULL,
	[july_v] [numeric](15, 2) NULL,
	[august_v] [numeric](15, 2) NULL,
	[september_v] [numeric](15, 2) NULL,
	[october_v] [numeric](15, 2) NULL,
	[november_v] [numeric](15, 2) NULL,
	[december_v] [numeric](15, 2) NULL,
	[VolAvg6mo] [numeric](38, 2) NULL,
	[RebAvg6mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
