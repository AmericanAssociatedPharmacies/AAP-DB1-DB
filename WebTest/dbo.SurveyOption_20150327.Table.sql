USE [WebTest]
GO
/****** Object:  Table [dbo].[SurveyOption_20150327]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyOption_20150327](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[Index] [smallint] NULL,
	[Html] [nvarchar](max) NULL,
	[Name] [nvarchar](50) NULL,
	[IsActive] [bit] NULL,
	[IsTrackChange] [bit] NULL,
	[IsReadOnly] [bit] NULL,
	[DefaultValue] [nvarchar](max) NULL,
	[EnableQIds] [nvarchar](50) NULL,
	[DisableQIds] [nvarchar](50) NULL,
	[ScopeName] [nvarchar](250) NULL,
	[opFormat] [nvarchar](50) NULL,
	[MaxLength] [smallint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
