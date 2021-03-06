USE [Reports]
GO
/****** Object:  Table [dbo].[import_3MRebate2012]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_3MRebate2012](
	[PMID] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[Affiliate] [varchar](255) NULL,
	[CAHAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](255) NULL,
	[Contact] [varchar](255) NULL,
	[ItemCINNo] [varchar](50) NULL,
	[QtyOrdered] [float] NULL,
	[Territory] [varchar](50) NULL,
	[Rebate] [money] NULL
) ON [PRIMARY]
GO
