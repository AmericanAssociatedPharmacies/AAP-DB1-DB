USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_trendreport0708_vpri_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0708_vpri_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[Jan08] [numeric](14, 2) NULL,
	[Feb08] [numeric](14, 2) NULL,
	[Mar08] [numeric](14, 2) NULL,
	[Apr08] [numeric](14, 2) NULL,
	[May08] [numeric](14, 2) NULL,
	[Jun08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Jul08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Jul07] [numeric](14, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q208] [numeric](38, 2) NULL,
	[Q207] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
