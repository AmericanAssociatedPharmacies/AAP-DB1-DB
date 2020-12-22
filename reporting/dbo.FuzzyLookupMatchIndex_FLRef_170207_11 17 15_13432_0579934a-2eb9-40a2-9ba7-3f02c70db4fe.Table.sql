USE [reporting]
GO
/****** Object:  Table [dbo].[FuzzyLookupMatchIndex_FLRef_170207_11:17:15_13432_0579934a-2eb9-40a2-9ba7-3f02c70db4fe]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuzzyLookupMatchIndex_FLRef_170207_11:17:15_13432_0579934a-2eb9-40a2-9ba7-3f02c70db4fe](
	[Company] [nvarchar](255) NULL,
	[Primary State/Prov# Code] [nvarchar](255) NULL,
	[Primary City] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[RID_170207_11:17:15_13432_0579934a-2eb9-40a2-9ba7-3f02c70db4fe] [int] IDENTITY(1,1) NOT NULL
) ON [PRIMARY]
GO
