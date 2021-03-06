USE [Reports]
GO
/****** Object:  Table [dbo].[import_PlanOGram2011]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_PlanOGram2011](
	[PMID] [int] NULL,
	[AccountName] [nvarchar](255) NULL,
	[Rebate] [money] NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[ST] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Terr] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[Subtype] [nvarchar](255) NULL,
	[Planogram] [nvarchar](255) NULL,
	[AAPAccountNo] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[AAP Elite] [nvarchar](255) NULL,
	[FullName] [nvarchar](255) NULL
) ON [PRIMARY]
GO
