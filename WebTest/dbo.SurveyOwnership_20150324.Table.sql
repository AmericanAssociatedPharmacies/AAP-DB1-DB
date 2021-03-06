USE [WebTest]
GO
/****** Object:  Table [dbo].[SurveyOwnership_20150324]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyOwnership_20150324](
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
	[IsActive] [bit] NULL
) ON [PRIMARY]
GO
