USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_chph_trend_test]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_trend_test](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](5) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[July_2009] [numeric](38, 2) NULL,
	[August_2009] [numeric](38, 2) NULL,
	[September_2009] [numeric](38, 2) NULL,
	[October_2009] [numeric](38, 2) NULL,
	[November_2009] [numeric](38, 2) NULL,
	[December_2009] [numeric](38, 2) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[January_2010] [numeric](38, 2) NULL,
	[AVG_PCT_CHG] [numeric](38, 4) NULL,
	[January_2009] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 4) NULL,
	[Q4_2009] [numeric](38, 2) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 4) NULL,
	[February_2010] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
