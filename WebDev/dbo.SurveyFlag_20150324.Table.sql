USE [WebDev]
GO
/****** Object:  Table [dbo].[SurveyFlag_20150324]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyFlag_20150324](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NULL,
	[FlagName] [nvarchar](50) NULL,
	[OptionIds] [nvarchar](500) NULL,
	[OptionValues] [nvarchar](max) NULL,
	[Emails] [nvarchar](500) NULL,
	[EmailSubject] [nvarchar](350) NULL,
	[EmailContent] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[EntityIds] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
