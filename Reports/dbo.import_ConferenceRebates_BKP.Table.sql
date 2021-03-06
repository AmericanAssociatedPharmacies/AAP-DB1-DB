USE [Reports]
GO
/****** Object:  Table [dbo].[import_ConferenceRebates_BKP]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_ConferenceRebates_BKP](
	[Date] [datetime] NULL,
	[PMID] [int] NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[AccountName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[TM] [nvarchar](255) NULL,
	[Volume] [money] NULL,
	[Rebate] [money] NULL
) ON [PRIMARY]
GO
