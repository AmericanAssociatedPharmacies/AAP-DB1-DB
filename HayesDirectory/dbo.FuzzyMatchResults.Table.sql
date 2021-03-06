USE [HayesDirectory]
GO
/****** Object:  Table [dbo].[FuzzyMatchResults]    Script Date: 12/22/2020 4:27:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FuzzyMatchResults](
	[PMID] [float] NULL,
	[AccountName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[OwnerName] [nvarchar](255) NULL,
	[Addr1] [nvarchar](255) NULL,
	[Addr2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL,
	[MailAddr1] [nvarchar](255) NULL,
	[MailCity] [nvarchar](255) NULL,
	[MailState] [nvarchar](255) NULL,
	[STATE_Hayes] [nvarchar](255) NULL,
	[STATE2_Hayes] [nvarchar](255) NULL,
	[CITY_Hayes] [nvarchar](255) NULL,
	[CITY2_Hayes] [nvarchar](255) NULL,
	[Name_Hayes] [nvarchar](255) NULL,
	[MAIL_Hayes] [nvarchar](255) NULL,
	[FAX_Hayes] [nvarchar](255) NULL,
	[PHONE_Hayes] [nvarchar](255) NULL,
	[_Similarity] [float] NULL,
	[_Confidence] [float] NULL,
	[_Similarity_AccountName] [float] NULL,
	[_Similarity_FAX] [float] NULL,
	[_Similarity_PHONE] [float] NULL,
	[_Similarity_MailAddr1] [float] NULL,
	[_Similarity_State] [float] NULL,
	[_Similarity_City] [float] NULL,
	[_Similarity_MailState] [float] NULL,
	[_Similarity_MailCity] [float] NULL
) ON [PRIMARY]
GO
