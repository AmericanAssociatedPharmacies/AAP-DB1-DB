USE [reporting]
GO
/****** Object:  Table [dbo].[udVolume_jmw_delete]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[udVolume_jmw_delete](
	[FY_END] [varchar](4) NULL,
	[ACCT_NO] [varchar](4) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[FACTOR] [numeric](16, 15) NULL,
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
	[V_PER] [numeric](12, 3) NULL,
	[MONTOT] [numeric](14, 2) NULL
) ON [PRIMARY]
GO
