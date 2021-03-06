USE [WebDev]
GO
/****** Object:  Table [dbo].[SurveyDocument_20150324]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyDocument_20150324](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyId] [int] NULL,
	[QuestionId] [int] NULL,
	[OptionId] [int] NULL,
	[Source] [nvarchar](max) NULL,
	[DocumentName] [nvarchar](150) NULL,
	[FieldNumber] [nvarchar](50) NULL,
	[FieldName] [nvarchar](250) NULL,
	[Format] [nvarchar](150) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
