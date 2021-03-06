USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_trend_test_ADMIN]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trend_test_ADMIN](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](5) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[primaryws] [int] NULL,
	[primarywsname] [varchar](15) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[July_2008] [numeric](38, 2) NULL,
	[August_2008] [numeric](38, 2) NULL,
	[September_2008] [numeric](38, 2) NULL,
	[October_2008] [numeric](38, 2) NULL,
	[November_2008] [numeric](38, 2) NULL,
	[December_2008] [numeric](38, 2) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[January_2009] [numeric](38, 2) NULL,
	[AVG_PCT_CHG] [numeric](38, 4) NULL,
	[January_2008] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 4) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[Q4_2007] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 4) NULL,
	[February_2009] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 4) NULL,
	[Delta] [numeric](38, 4) NULL,
	[inCHPH] [int] NOT NULL
) ON [PRIMARY]
GO
