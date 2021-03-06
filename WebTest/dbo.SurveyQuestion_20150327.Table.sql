USE [WebTest]
GO
/****** Object:  Table [dbo].[SurveyQuestion_20150327]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyQuestion_20150327](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Index] [smallint] NULL,
	[IsEnable] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[IsRequired] [bit] NULL,
	[RequiredValue] [nvarchar](max) NULL,
	[ShowFunction] [nvarchar](max) NULL,
	[ValidateFunction] [nvarchar](200) NULL,
	[ShowSurveyOptionId] [int] NULL,
	[Type] [nvarchar](250) NOT NULL,
	[ChildIds] [nvarchar](550) NULL,
	[ParentId] [int] NULL,
	[IsMultipleAnswers] [bit] NULL,
	[Section] [nvarchar](350) NULL,
	[qHtml] [nvarchar](max) NULL,
	[Source] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
