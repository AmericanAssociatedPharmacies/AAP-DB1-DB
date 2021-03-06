USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_yyreport]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport](
	[Year] [char](4) NOT NULL,
	[vendorid] [int] NULL,
	[vendor] [nvarchar](50) NULL,
	[Rq1] [numeric](38, 2) NULL,
	[Rq2] [numeric](38, 2) NULL,
	[Rq3] [numeric](38, 2) NULL,
	[Rq4] [numeric](38, 2) NULL,
	[Ryeartot] [numeric](38, 2) NULL,
	[Vq1] [numeric](38, 2) NULL,
	[Vq2] [numeric](38, 2) NULL,
	[Vq3] [numeric](38, 2) NULL,
	[Vq4] [numeric](38, 2) NULL,
	[Vyeartot] [numeric](38, 2) NULL,
	[Sq1] [int] NULL,
	[Sq2] [int] NULL,
	[Sq3] [int] NULL,
	[Sq4] [int] NULL,
	[Syeartot] [int] NULL
) ON [PRIMARY]
GO
