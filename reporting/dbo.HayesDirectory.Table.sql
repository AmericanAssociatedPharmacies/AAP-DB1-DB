USE [reporting]
GO
/****** Object:  Table [dbo].[HayesDirectory]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HayesDirectory](
	[PMID] [int] NULL,
	[AccountName] [varchar](150) NULL,
	[Email] [varchar](255) NULL,
	[OwnerName] [varchar](200) NULL,
	[Addr1] [varchar](100) NULL,
	[Addr2] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[MailAddr1] [varchar](100) NULL,
	[MailCity] [varchar](50) NULL,
	[MailState] [varchar](2) NULL,
	[STATE_Hayes] [nvarchar](255) NULL,
	[STATE2_Hayes] [nvarchar](255) NULL,
	[CITY_Hayes] [nvarchar](255) NULL,
	[CITY2_Hayes] [nvarchar](255) NULL,
	[Name_Hayes] [nvarchar](255) NULL,
	[MAIL_Hayes] [nvarchar](255) NULL,
	[FAX_Hayes] [nvarchar](255) NULL,
	[PHONE_Hayes] [nvarchar](255) NULL,
	[_Similarity] [real] NULL,
	[_Confidence] [real] NULL,
	[_Similarity_AccountName] [real] NULL,
	[_Similarity_FAX] [real] NULL,
	[_Similarity_PHONE] [real] NULL,
	[_Similarity_MailAddr1] [real] NULL,
	[_Similarity_State] [real] NULL,
	[_Similarity_City] [real] NULL,
	[_Similarity_MailState] [real] NULL,
	[_Similarity_MailCity] [real] NULL
) ON [PRIMARY]
GO
