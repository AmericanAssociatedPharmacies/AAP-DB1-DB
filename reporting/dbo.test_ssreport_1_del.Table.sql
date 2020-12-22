USE [reporting]
GO
/****** Object:  Table [dbo].[test_ssreport_1_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test_ssreport_1_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[type] [varchar](15) NULL,
	[fytd09ss] [numeric](38, 2) NULL,
	[fytd08ss] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
