USE [WebTest]
GO
/****** Object:  Table [dbo].[fileSummary]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fileSummary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NULL,
	[format] [varchar](50) NULL,
	[allowNewResourses] [bit] NULL,
	[message] [varchar](max) NULL,
	[categoryAlias] [varchar](max) NULL,
	[ownerEmail] [varchar](max) NULL,
	[staleCycle] [varchar](50) NULL,
	[location] [varchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
