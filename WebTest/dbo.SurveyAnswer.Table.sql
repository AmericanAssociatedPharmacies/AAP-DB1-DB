USE [WebTest]
GO
/****** Object:  Table [dbo].[SurveyAnswer]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyAnswer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NULL,
	[OptionId] [int] NOT NULL,
	[ParticipatorId] [int] NULL,
	[DateTimeEnter] [datetime] NULL,
	[AnswerInput] [nvarchar](500) NULL,
	[ParticipatorLogin] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[CollectionId] [int] NULL,
	[AnswerText] [nvarchar](500) NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveyAnswer] ADD  CONSTRAINT [DF_SurveyAnswer_IsSubmited]  DEFAULT ((0)) FOR [IsSubmitted]
GO
ALTER TABLE [dbo].[SurveyAnswer] ADD  CONSTRAINT [DF_SurveyAnswer_CollectionId]  DEFAULT ((0)) FOR [CollectionId]
GO
ALTER TABLE [dbo].[SurveyAnswer]  WITH NOCHECK ADD  CONSTRAINT [FK_OptionAnswer] FOREIGN KEY([OptionId])
REFERENCES [dbo].[SurveyOption] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SurveyAnswer] CHECK CONSTRAINT [FK_OptionAnswer]
GO
