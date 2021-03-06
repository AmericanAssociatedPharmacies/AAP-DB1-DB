USE [WebTest]
GO
/****** Object:  Table [dbo].[SurveyOwnerRelationship_20150324]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyOwnerRelationship_20150324](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyControlEntityId] [int] NOT NULL,
	[Relationship] [nvarchar](150) NULL,
	[FName] [nvarchar](150) NULL,
	[MName] [nvarchar](150) NULL,
	[LName] [nvarchar](150) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]
GO
