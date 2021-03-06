USE [WebDev]
GO
/****** Object:  Table [dbo].[Survey]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Survey](
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
	[ApplyToEntity] [nvarchar](50) NULL,
 CONSTRAINT [PK_Surveys] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Survey] ADD  CONSTRAINT [DF_Survey_Published]  DEFAULT ((0)) FOR [Published]
GO
ALTER TABLE [dbo].[Survey] ADD  CONSTRAINT [DF_Survey_NotifyWhenCompleted]  DEFAULT ((1)) FOR [NotifyWhenCompleted]
GO
ALTER TABLE [dbo].[Survey] ADD  CONSTRAINT [DF_Survey_FlagAction]  DEFAULT (N'email') FOR [FlagAction]
GO
ALTER TABLE [dbo].[Survey]  WITH NOCHECK ADD  CONSTRAINT [FK_Survey_SurveySchedule] FOREIGN KEY([SurveyScheduleId])
REFERENCES [dbo].[SurveySchedule] ([Id])
GO
ALTER TABLE [dbo].[Survey] CHECK CONSTRAINT [FK_Survey_SurveySchedule]
GO
