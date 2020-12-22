USE [WebTest]
GO
/****** Object:  Table [dbo].[Relationship]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Relationship](
	[PMID] [int] NULL,
	[CollectionId] [int] NOT NULL,
	[otherownerid] [int] NOT NULL,
	[Location Type] [varchar](5) NOT NULL,
	[NPI] [nvarchar](11) NULL,
	[Owner] [nvarchar](max) NULL,
	[Relationship] [nvarchar](max) NULL,
	[First Name] [nvarchar](max) NULL,
	[Middle Name] [nvarchar](max) NULL,
	[Last Name] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
