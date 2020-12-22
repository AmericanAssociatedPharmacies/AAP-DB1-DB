USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_chph_test]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_chph_test](
	[Store_Name] [varchar](8000) NULL,
	[Store] [varchar](50) NOT NULL,
	[City] [varchar](20) NULL,
	[State] [varchar](2) NULL,
	[Territory] [varchar](2) NULL,
	[Effective] [varchar](10) NULL,
	[Type] [varchar](15) NULL,
	[DEC_2007] [float] NULL,
	[JAN_2008] [float] NULL,
	[FEB_2008] [float] NULL,
	[MAR_2008] [float] NULL,
	[APR_2008] [float] NULL,
	[MAY_2008] [float] NULL,
	[AVG_6_MO] [numeric](38, 2) NULL,
	[JUN_2008] [float] NULL,
	[AVG_PCT_CHG] [numeric](38, 2) NULL,
	[JUN_2007] [numeric](38, 2) NULL,
	[YY_PCT_CHG] [numeric](38, 2) NULL,
	[Q2_2008] [numeric](38, 2) NULL,
	[Q2_2007] [numeric](38, 2) NULL,
	[QQ_PCT_CHG] [numeric](38, 2) NULL,
	[FCST_JUL_2008] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
