USE [Reports]
GO
/****** Object:  Table [dbo].[PMGroupNoExceptions]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PMGroupNoExceptions](
	[PMID] [int] NOT NULL,
	[AccountName] [varchar](65) NULL,
	[AAPEFfectiveDate] [datetime] NULL,
	[AAPQuitDate] [datetime] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[AAPParentNo] [varchar](20) NULL,
	[APIAccountNo] [varchar](20) NULL,
	[APIStatus] [varchar](20) NULL,
	[BusinessClass] [varchar](20) NULL,
	[PM GroupNo] [varchar](20) NULL,
	[CHAccounts GroupNo] [varchar](50) NULL,
	[Reason] [varchar](200) NULL,
	[VerifiedAsOK] [varchar](200) NULL
) ON [PRIMARY]
GO
