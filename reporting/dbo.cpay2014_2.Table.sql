USE [reporting]
GO
/****** Object:  Table [dbo].[cpay2014_2]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cpay2014_2](
	[PLAN_ID] [int] NULL,
	[NAME] [varchar](50) NULL,
	[YR] [numeric](4, 0) NULL,
	[MO] [numeric](2, 0) NULL,
	[AMT_PAID] [float] NULL,
	[CLAIMS] [float] NULL,
	[RECEIPTS] [numeric](10, 0) NULL
) ON [PRIMARY]
GO
