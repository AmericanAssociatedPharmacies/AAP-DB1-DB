USE [Reports]
GO
/****** Object:  Table [dbo].[import_RebateMasonRebate]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_RebateMasonRebate](
	[Year] [varchar](4) NULL,
	[PMID] [varchar](255) NULL,
	[CAAccountNo] [varchar](255) NULL,
	[DC] [varchar](50) NULL,
	[AccountName] [varchar](50) NULL,
	[Dollars] [money] NULL,
	[Rebate] [money] NULL,
	[Affiliate] [varchar](255) NULL
) ON [PRIMARY]
GO
