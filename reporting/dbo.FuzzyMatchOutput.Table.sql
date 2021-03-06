USE [reporting]
GO
/****** Object:  Table [dbo].[FuzzyMatchOutput]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuzzyMatchOutput](
	[PMID] [int] NULL,
	[AccountDescription] [varchar](200) NULL,
	[AccountName] [varchar](150) NULL,
	[OwnerName] [varchar](200) NULL,
	[ContactFullName] [varchar](255) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[Company] [nvarchar](255) NULL,
	[Primary State/Prov# Code] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL,
	[Primary City] [nvarchar](255) NULL,
	[_Similarity] [real] NULL,
	[_Confidence] [real] NULL,
	[_Similarity_AccountName] [real] NULL,
	[_Similarity_State] [real] NULL,
	[_Similarity_City] [real] NULL
) ON [PRIMARY]
GO
