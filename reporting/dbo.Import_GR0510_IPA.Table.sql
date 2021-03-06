USE [reporting]
GO
/****** Object:  Table [dbo].[Import_GR0510_IPA]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Import_GR0510_IPA](
	[PMID] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[CA Store number] [nvarchar](255) NULL,
	[Generic Volume] [money] NULL,
	[Highest Tier achieved] [float] NULL,
	[Average Rebate] [float] NULL,
	[Generic Rebate] [money] NULL
) ON [PRIMARY]
GO
