USE [Reports]
GO
/****** Object:  Table [dbo].[import_RebatePlanOGram]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_RebatePlanOGram](
	[Year] [varchar](4) NULL,
	[PMID] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Owner] [varchar](255) NULL,
	[Address1] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Zip] [varchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Affiliate] [nvarchar](255) NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[Rebate] [money] NULL
) ON [PRIMARY]
GO
