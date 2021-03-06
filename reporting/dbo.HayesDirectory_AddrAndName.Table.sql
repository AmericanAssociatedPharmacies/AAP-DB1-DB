USE [reporting]
GO
/****** Object:  Table [dbo].[HayesDirectory_AddrAndName]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesDirectory_AddrAndName](
	[PMID] [int] NULL,
	[AccountName] [varchar](150) NULL,
	[Email] [varchar](255) NULL,
	[OwnerName] [varchar](200) NULL,
	[ContactFullName] [varchar](255) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Fax] [varchar](50) NULL,
	[MembershipOwner] [varchar](200) NULL,
	[NAME_Hayes] [nvarchar](255) NULL,
	[CITY_Hayes] [nvarchar](255) NULL,
	[STATE_Hayes] [nvarchar](255) NULL,
	[ADDRESS_Hayes] [nvarchar](255) NULL,
	[MAIL_Hayes] [nvarchar](255) NULL,
	[FAX_Hayes] [nvarchar](255) NULL,
	[_Similarity] [real] NULL,
	[_Confidence] [real] NULL,
	[_Similarity_AccountName] [real] NULL,
	[_Similarity_Addr1] [real] NULL,
	[_Similarity_City] [real] NULL,
	[_Similarity_State] [real] NULL,
	[_Similarity_Fax] [real] NULL
) ON [PRIMARY]
GO
