USE [Reports]
GO
/****** Object:  Table [dbo].[import_MasonRebate2014]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_MasonRebate2014](
	[PMID] [varchar](50) NULL,
	[CardinalNo] [varchar](255) NULL,
	[DC] [varchar](50) NULL,
	[AccountName] [varchar](255) NULL,
	[SumOfDollars] [money] NULL,
	[Rebate] [money] NULL
) ON [PRIMARY]
GO
