USE [WebTest]
GO
/****** Object:  Table [dbo].[SurveyOwnership]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyOwnership](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SurveyControlEntityId] [int] NOT NULL,
	[OtherLegalName] [nvarchar](250) NULL,
	[OtherNPI] [nvarchar](11) NULL,
	[OtherDBA] [nvarchar](250) NULL,
	[OtherNCPDP] [nvarchar](8) NULL,
	[OtherAddress] [nvarchar](250) NULL,
	[OtherAddress2] [nvarchar](250) NULL,
	[OtherCity] [nvarchar](250) NULL,
	[OtherState] [nvarchar](15) NULL,
	[OtherZip] [nvarchar](15) NULL,
	[IsActive] [bit] NULL,
	[IsSubmitted] [bit] NULL,
 CONSTRAINT [PK_OtherOwnerShipDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SurveyOwnership] ADD  CONSTRAINT [DF_SurveyOwnership_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[SurveyOwnership] ADD  CONSTRAINT [DF_SurveyOwnership_IsSubmitted]  DEFAULT ((0)) FOR [IsSubmitted]
GO
