USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_trend_SLX]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trend_SLX](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](4) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[Primary_WS_Name] [varchar](15) NULL,
	[July_08] [numeric](14, 2) NULL,
	[August_08] [numeric](14, 2) NULL,
	[September_08] [numeric](14, 2) NULL,
	[October_08] [numeric](14, 2) NULL,
	[November_08] [numeric](14, 2) NULL,
	[December_08] [numeric](14, 2) NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[January_09] [numeric](14, 2) NULL,
	[AVG_PCT_CHG] [numeric](38, 4) NULL,
	[January_08] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 4) NULL,
	[QTR_4_08] [numeric](38, 2) NULL,
	[QTR_4_07] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
