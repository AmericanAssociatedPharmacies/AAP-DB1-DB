USE [reporting]
GO
/****** Object:  Table [dbo].[test_Q_2009_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_Q_2009_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FY_Q1_2009] [numeric](38, 2) NULL,
	[FY_Q2_2009] [numeric](38, 2) NULL,
	[FY_Q3_2009] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
