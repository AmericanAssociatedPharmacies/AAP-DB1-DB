USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_all_active_compare]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_all_active_compare](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[primaryws] [int] NULL,
	[type] [varchar](15) NULL,
	[July_2008] [numeric](38, 2) NULL,
	[August_2008] [numeric](38, 2) NULL,
	[September_2008] [numeric](38, 2) NULL,
	[October_2008] [numeric](38, 2) NULL,
	[November_2008] [numeric](38, 2) NULL,
	[December_2008] [numeric](38, 2) NULL,
	[currentAvg6mo] [numeric](38, 2) NULL,
	[Anda_July_2008] [numeric](38, 2) NULL,
	[Anda_August_2008] [numeric](38, 2) NULL,
	[Anda_September_2008] [numeric](38, 2) NULL,
	[Anda_October_2008] [numeric](38, 2) NULL,
	[Anda_November_2008] [numeric](38, 2) NULL,
	[Anda_December_2008] [numeric](38, 2) NULL,
	[AndaAvg6mo] [numeric](38, 2) NULL,
	[Par_July_2008] [numeric](38, 2) NULL,
	[Par_August_2008] [numeric](38, 2) NULL,
	[Par_September_2008] [numeric](38, 2) NULL,
	[Par_October_2008] [numeric](38, 2) NULL,
	[Par_November_2008] [numeric](38, 2) NULL,
	[Par_December_2008] [numeric](38, 2) NULL,
	[ParAvg6mo] [numeric](38, 2) NULL,
	[TotalAvg6mo] [numeric](38, 2) NULL,
	[PreAndaAvg] [float] NULL,
	[PreParAvg] [numeric](15, 2) NOT NULL,
	[PreBaseAvg] [numeric](38, 2) NULL,
	[TotalPrevAvg] [numeric](38, 2) NULL,
	[Delta] [numeric](38, 2) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
