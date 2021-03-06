USE [WebTest]
GO
/****** Object:  Table [dbo].[SurveyDownloadOpts_20150324]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyDownloadOpts_20150324](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[jsonOptions] [nvarchar](max) NULL,
	[ParentEntityId] [nvarchar](50) NULL,
	[EntityType] [nvarchar](350) NULL,
	[EntityIdName] [nvarchar](350) NULL,
	[EntityId] [nvarchar](50) NULL,
	[Section] [nvarchar](350) NULL,
	[SurveyId] [int] NULL,
	[QuestionId] [int] NULL,
	[PMId] [int] NULL,
	[IsActive] [bit] NULL,
	[DefaultColumns] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
