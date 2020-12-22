USE [Purchases]
GO
/****** Object:  Table [dbo].[purchases_work]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[purchases_work](
	[PMID] [int] NULL,
	[CHAccountNo] [int] NULL,
	[IsResearched] [smallint] NULL,
	[AccountName] [varchar](255) NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[address] [varchar](200) NULL,
	[city] [varchar](200) NULL,
	[state] [varchar](200) NULL,
	[zip] [varchar](50) NULL
) ON [PRIMARY]
GO
