USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_slximport3]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_slximport3](
	[accountid] [nvarchar](50) NULL,
	[udacctno] [nvarchar](50) NULL,
	[monthvolumeavg] [numeric](38, 2) NOT NULL,
	[Store Number] [nvarchar](50) NULL,
	[Expr1] [int] NULL,
	[payterm] [nvarchar](50) NULL,
	[cogs] [nvarchar](50) NULL,
	[gc] [real] NULL,
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[nsterritory] [varchar](2) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL
) ON [PRIMARY]
GO
