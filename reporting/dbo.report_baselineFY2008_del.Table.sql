USE [reporting]
GO
/****** Object:  Table [dbo].[report_baselineFY2008_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[report_baselineFY2008_del](
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
	[pwsname] [varchar](3) NOT NULL,
	[dec07] [numeric](14, 2) NULL,
	[jan08] [numeric](14, 2) NULL,
	[feb08] [numeric](14, 2) NULL,
	[mar08] [numeric](14, 2) NULL,
	[apr08] [numeric](14, 2) NULL,
	[may08] [numeric](14, 2) NULL,
	[avg6mo] [numeric](38, 2) NULL,
	[Anda0408] [numeric](15, 2) NULL,
	[Anda0508] [float] NULL,
	[AndaAvg] [float] NULL,
	[Parmed0508] [numeric](15, 2) NULL,
	[TotalAvg] [float] NULL,
	[owsvol] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
