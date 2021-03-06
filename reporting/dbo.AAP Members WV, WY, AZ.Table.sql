USE [reporting]
GO
/****** Object:  Table [dbo].[AAP Members WV, WY, AZ]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAP Members WV, WY, AZ](
	[PMID] [float] NULL,
	[AAPAccountNo] [float] NULL,
	[AccountName] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[MailAddr1] [nvarchar](255) NULL,
	[MailAddr2] [nvarchar](255) NULL,
	[MailCity] [nvarchar](255) NULL,
	[MailState] [nvarchar](255) NULL,
	[MailZip] [float] NULL,
	[Phone] [nvarchar](255) NULL,
	[Fax] [nvarchar](255) NULL
) ON [PRIMARY]
GO
