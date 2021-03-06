USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_all_new_members_1208_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_all_new_members_1208_del](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[primaryws] [int] NULL,
	[type] [varchar](15) NULL,
	[June] [numeric](14, 2) NULL,
	[July] [numeric](14, 2) NULL,
	[August] [numeric](14, 2) NULL,
	[September] [numeric](14, 2) NULL,
	[October] [numeric](14, 2) NULL,
	[November] [numeric](14, 2) NULL,
	[December] [float] NULL,
	[currentAvg6mo] [numeric](38, 2) NULL,
	[Anda_June] [numeric](14, 2) NULL,
	[Anda_July] [numeric](14, 2) NULL,
	[Anda_August] [numeric](14, 2) NULL,
	[Anda_September] [numeric](14, 2) NULL,
	[Anda_October] [numeric](14, 2) NULL,
	[Anda_November] [numeric](14, 2) NULL,
	[Anda_December] [numeric](14, 2) NULL,
	[AndaAvg6mo] [numeric](38, 2) NULL,
	[Par_June] [numeric](14, 2) NULL,
	[Par_July] [numeric](14, 2) NULL,
	[Par_August] [numeric](14, 2) NULL,
	[Par_September] [numeric](14, 2) NULL,
	[Par_October] [numeric](14, 2) NULL,
	[Par_November] [numeric](14, 2) NULL,
	[Par_December] [numeric](14, 2) NULL,
	[ParAvg6mo] [numeric](38, 2) NULL,
	[TotalAvg6mo] [numeric](38, 2) NULL,
	[Delta] [numeric](38, 2) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
