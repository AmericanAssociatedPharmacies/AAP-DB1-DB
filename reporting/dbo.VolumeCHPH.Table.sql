USE [reporting]
GO
/****** Object:  Table [dbo].[VolumeCHPH]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VolumeCHPH](
	[YEAR] [varchar](4) NULL,
	[ACCT_NO] [varchar](8) NULL,
	[VENDOR_ID] [int] NULL,
	[VENDOR] [varchar](64) NULL,
	[REPORTS] [varchar](1) NULL,
	[JANUARY] [numeric](38, 2) NULL,
	[FEBRUARY] [numeric](38, 2) NULL,
	[MARCH] [numeric](38, 2) NULL,
	[APRIL] [numeric](38, 2) NULL,
	[MAY] [numeric](38, 2) NULL,
	[JUNE] [numeric](38, 2) NULL,
	[JULY] [numeric](38, 2) NULL,
	[AUGUST] [numeric](38, 2) NULL,
	[SEPTEMBER] [numeric](38, 2) NULL,
	[OCTOBER] [numeric](38, 2) NULL,
	[NOVEMBER] [numeric](38, 2) NULL,
	[DECEMBER] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
