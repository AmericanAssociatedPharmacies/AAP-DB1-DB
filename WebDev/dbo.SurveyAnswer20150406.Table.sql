USE [WebDev]
GO
/****** Object:  Table [dbo].[SurveyAnswer20150406]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyAnswer20150406](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PMId] [int] NULL,
	[OptionId] [int] NOT NULL,
	[ParticipatorId] [int] NULL,
	[DateTimeEnter] [datetime] NULL,
	[AnswerInput] [nvarchar](500) NULL,
	[ParticipatorLogin] [nvarchar](50) NULL,
	[IsSubmitted] [bit] NULL,
	[CollectionId] [int] NULL,
	[AnswerText] [nvarchar](500) NULL
) ON [PRIMARY]
GO
