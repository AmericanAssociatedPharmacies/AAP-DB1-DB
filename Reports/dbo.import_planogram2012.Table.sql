USE [Reports]
GO
/****** Object:  Table [dbo].[import_planogram2012]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_planogram2012](
	[PMID] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[Address1] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[Zip] [varchar](255) NULL,
	[ype] [varchar](255) NULL,
	[SubType] [varchar](255) NULL,
	[Planogram] [varchar](255) NULL,
	[AAPElite] [varchar](255) NULL,
	[FullName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](50) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[Rebate] [money] NULL
) ON [PRIMARY]
GO
