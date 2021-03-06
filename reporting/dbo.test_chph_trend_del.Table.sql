USE [reporting]
GO
/****** Object:  Table [dbo].[test_chph_trend_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_chph_trend_del](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](50) NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[JUL_2008] [float] NULL,
	[AUG_2008] [float] NULL,
	[SEP_2008] [float] NULL,
	[OCT_2008] [float] NULL,
	[NOV_2008] [float] NULL,
	[DEC_2008] [float] NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[JAN_2009] [float] NULL,
	[AVG_PCT_CHG] [numeric](38, 2) NULL,
	[JAN_2008] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 2) NULL,
	[Q4_2008] [numeric](38, 2) NULL,
	[Q4_2007] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 2) NULL,
	[FCST_FEB_2009] [numeric](38, 2) NULL,
	[FCST_AVG_PCT_CHG] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
