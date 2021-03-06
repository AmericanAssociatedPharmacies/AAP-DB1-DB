USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_baseline_compare_test]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_baseline_compare_test](
	[acct_no] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[primaryws] [int] NULL,
	[type] [varchar](15) NULL,
	[January_2008] [numeric](38, 2) NULL,
	[February_2008] [numeric](38, 2) NULL,
	[March_2008] [numeric](38, 2) NULL,
	[April_2008] [numeric](38, 2) NULL,
	[May_2008] [numeric](38, 2) NULL,
	[June_2008] [numeric](38, 2) NULL,
	[currentAvg6mo] [numeric](38, 2) NULL,
	[Anda_January_2008] [numeric](38, 2) NULL,
	[Anda_February_2008] [numeric](38, 2) NULL,
	[Anda_March_2008] [numeric](38, 2) NULL,
	[Anda_April_2008] [numeric](38, 2) NULL,
	[Anda_May_2008] [numeric](38, 2) NULL,
	[Anda_June_2008] [numeric](38, 2) NULL,
	[AndaAvg6mo] [numeric](38, 2) NULL,
	[Par_January_2008] [numeric](38, 2) NULL,
	[Par_February_2008] [numeric](38, 2) NULL,
	[Par_March_2008] [numeric](38, 2) NULL,
	[Par_April_2008] [numeric](38, 2) NULL,
	[Par_May_2008] [numeric](38, 2) NULL,
	[Par_June_2008] [numeric](38, 2) NULL,
	[ParAvg6mo] [numeric](38, 2) NULL,
	[TotalAvg6mo] [numeric](38, 2) NULL,
	[PreAndaAvg] [float] NULL,
	[PreParAvg] [numeric](15, 2) NOT NULL,
	[PreBaseAvg] [numeric](38, 2) NULL,
	[TotalPrevAvg] [numeric](38, 2) NULL,
	[Delta] [numeric](38, 4) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
