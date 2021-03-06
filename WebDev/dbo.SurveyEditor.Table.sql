USE [WebDev]
GO
/****** Object:  Table [dbo].[SurveyEditor]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyEditor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Logins] [nvarchar](500) NULL,
	[SurveyId] [int] NULL,
 CONSTRAINT [PK_Editors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveyEditor]  WITH NOCHECK ADD  CONSTRAINT [FK_SurveyEditor_Survey] FOREIGN KEY([SurveyId])
REFERENCES [dbo].[Survey] ([Id])
GO
ALTER TABLE [dbo].[SurveyEditor] CHECK CONSTRAINT [FK_SurveyEditor_Survey]
GO
