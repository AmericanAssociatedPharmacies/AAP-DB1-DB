USE [WebTest]
GO
/****** Object:  Table [dbo].[SurveySchedule]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveySchedule](
	[Id] [int] NOT NULL,
	[SurveyIds] [nvarchar](300) NULL,
	[ParticipatorPMId] [int] NULL,
	[IsCompleted] [bit] NULL,
	[IsStarted] [bit] NULL,
	[NotifyStartDate] [datetime] NULL,
	[NotifyEndDate] [datetime] NULL,
 CONSTRAINT [PK_SurveySchedule] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveySchedule]  WITH CHECK ADD  CONSTRAINT [FK_SurveySchedule_Participators] FOREIGN KEY([ParticipatorPMId])
REFERENCES [dbo].[SurveyParticipator] ([PMId])
GO
ALTER TABLE [dbo].[SurveySchedule] CHECK CONSTRAINT [FK_SurveySchedule_Participators]
GO
