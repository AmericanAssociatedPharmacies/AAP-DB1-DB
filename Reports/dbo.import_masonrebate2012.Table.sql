USE [Reports]
GO
/****** Object:  Table [dbo].[import_masonrebate2012]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_masonrebate2012](
	[AccountName] [varchar](50) NULL,
	[AccountNo] [varchar](50) NULL,
	[PMID] [float] NULL,
	[DCNumber] [float] NULL,
	[Units] [float] NULL,
	[Rebate] [money] NULL,
	[Dollars] [money] NULL,
	[Affiliate] [varchar](50) NULL
) ON [PRIMARY]
GO
