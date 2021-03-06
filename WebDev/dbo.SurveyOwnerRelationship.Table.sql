USE [WebDev]
GO
/****** Object:  Table [dbo].[SurveyOwnerRelationship]    Script Date: 12/22/2020 5:21:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyOwnerRelationship](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyControlEntityId] [int] NOT NULL,
	[Relationship] [nvarchar](150) NULL,
	[FName] [nvarchar](150) NULL,
	[MName] [nvarchar](150) NULL,
	[LName] [nvarchar](150) NULL,
	[IsActive] [bit] NULL,
	[IsSubmitted] [bit] NULL,
 CONSTRAINT [PK_SurveyOwnerRelationship] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveyOwnerRelationship] ADD  CONSTRAINT [DF_SurveyOwnerRelationship_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SurveyOwnerRelationship] ADD  CONSTRAINT [DF_SurveyOwnerRelationship_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
GO
