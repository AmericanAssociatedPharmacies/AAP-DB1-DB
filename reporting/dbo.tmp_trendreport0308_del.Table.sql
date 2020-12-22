USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_trendreport0308_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_trendreport0308_del](
	[ACCT_NO] [varchar](4) NULL,
	[NCPDP] [varchar](7) NULL,
	[STORE] [varchar](65) NULL,
	[CITY] [varchar](20) NULL,
	[STATE] [varchar](2) NULL,
	[NSTERRITORY] [varchar](2) NULL,
	[EFFECTIVE] [datetime] NULL,
	[type] [varchar](15) NULL,
	[Sep07] [numeric](38, 2) NULL,
	[Oct07] [numeric](38, 2) NULL,
	[Nov07] [numeric](38, 2) NULL,
	[Dec07] [numeric](38, 2) NULL,
	[Jan08] [numeric](38, 2) NULL,
	[Feb08] [numeric](38, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Mar08] [numeric](38, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[Mar07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q108] [numeric](38, 2) NULL,
	[Q107] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
