USE [WebTest]
GO
/****** Object:  Table [dbo].[Survey_20150327]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey_20150327](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Title] [nvarchar](max) NOT NULL,
	[FormText] [nvarchar](max) NULL,
	[Published] [bit] NOT NULL,
	[StartDate] [datetime] NULL,
	[ExpiredDate] [datetime] NULL,
	[SaveChangeFunction] [nvarchar](max) NULL,
	[CompletedFunction] [nvarchar](max) NULL,
	[ValidateFunction] [nvarchar](max) NULL,
	[DateCreated] [datetime] NULL,
	[IsPrintable] [bit] NULL,
	[SurveyScheduleId] [int] NULL,
	[Emails] [nvarchar](max) NULL,
	[EmailSubject] [nvarchar](350) NULL,
	[EmailTemplate] [nvarchar](max) NULL,
	[NotifyWhenCompleted] [bit] NULL,
	[FlagAction] [nvarchar](50) NULL,
	[FlagEmailSubject] [nvarchar](350) NULL,
	[FlagEmailTemplate] [nvarchar](max) NULL,
	[Template] [nvarchar](max) NULL,
	[ApplyToEntity] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
