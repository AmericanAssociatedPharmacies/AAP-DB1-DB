USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_yyreport_stepA]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_yyreport_stepA](
	[vendorname] [nvarchar](25) NOT NULL,
	[status] [int] NULL,
	[oldvendorid] [int] NULL,
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](4) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](14, 2) NULL,
	[FEBRUARY] [numeric](14, 2) NULL,
	[MARCH] [numeric](14, 2) NULL,
	[APRIL] [numeric](14, 2) NULL,
	[MAY] [numeric](14, 2) NULL,
	[JUNE] [numeric](14, 2) NULL,
	[JULY] [numeric](14, 2) NULL,
	[AUGUST] [numeric](14, 2) NULL,
	[SEPTEMBER] [numeric](14, 2) NULL,
	[OCTOBER] [numeric](14, 2) NULL,
	[NOVEMBER] [numeric](14, 2) NULL,
	[DECEMBER] [numeric](14, 2) NULL,
	[MONTOT] [numeric](14, 2) NULL,
	[vendorpair] [int] NULL,
	[fy_end1] [varchar](4) NULL,
	[acct_no1] [varchar](4) NULL,
	[reports1] [varchar](1) NULL,
	[JANUARY1] [numeric](14, 2) NULL,
	[FEBRUARY1] [numeric](14, 2) NULL,
	[MARCH1] [numeric](14, 2) NULL,
	[APRIL1] [numeric](14, 2) NULL,
	[MAY1] [numeric](14, 2) NULL,
	[JUNE1] [numeric](14, 2) NULL,
	[JULY1] [numeric](14, 2) NULL,
	[AUGUST1] [numeric](14, 2) NULL,
	[SEPTEMBER1] [numeric](14, 2) NULL,
	[OCTOBER1] [numeric](14, 2) NULL,
	[NOVEMBER1] [numeric](14, 2) NULL,
	[DECEMBER1] [numeric](14, 2) NULL,
	[MONTOT1] [numeric](14, 2) NULL,
	[Filled] [int] NULL
) ON [PRIMARY]
GO
