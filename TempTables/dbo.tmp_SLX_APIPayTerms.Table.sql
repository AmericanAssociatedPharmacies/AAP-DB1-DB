USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_SLX_APIPayTerms]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SLX_APIPayTerms](
	[PMID] [int] NULL,
	[TM] [varchar](255) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[Zip] [varchar](255) NULL,
	[Status] [varchar](255) NULL,
	[AAPAccountNo] [varchar](255) NULL,
	[DEA] [varchar](255) NULL,
	[PayTerms] [varchar](255) NULL,
	[CreditLimit] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
