USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_baselineReport_vpri]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_baselineReport_vpri](
	[acct_no] [varchar](4) NULL,
	[ncpdp] [varchar](7) NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[terr] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[type] [varchar](15) NULL,
	[primaryws] [int] NULL,
	[Nov07] [numeric](14, 2) NULL,
	[Dec07] [numeric](14, 2) NULL,
	[Jan08] [numeric](14, 2) NULL,
	[Feb08] [numeric](14, 2) NULL,
	[Mar08] [numeric](14, 2) NULL,
	[Apr08] [numeric](14, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[May08] [numeric](14, 2) NULL,
	[pctchangeAvg] [numeric](38, 2) NULL,
	[May07] [numeric](38, 2) NULL,
	[pctchangeYY] [numeric](38, 2) NULL,
	[Q108] [numeric](16, 2) NULL,
	[Q107] [numeric](38, 2) NULL,
	[pctchangeQQ] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
