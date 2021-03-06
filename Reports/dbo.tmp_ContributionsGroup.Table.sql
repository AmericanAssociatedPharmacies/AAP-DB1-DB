USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_ContributionsGroup]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ContributionsGroup](
	[PMID] [int] NOT NULL,
	[AAP Acct#] [varchar](20) NULL,
	[AAP Parent#] [varchar](20) NULL,
	[API Acct#] [varchar](20) NULL,
	[Account DBA Name] [varchar](65) NULL,
	[AAP Eff] [datetime] NULL,
	[AAP Quit] [datetime] NULL,
	[Description] [varchar](200) NULL,
	[City] [varchar](50) NULL,
	[ST] [varchar](2) NULL,
	[Affiliate] [varchar](125) NULL,
	[Bus Cls] [varchar](4) NULL,
	[Bashas Volume] [numeric](18, 2) NULL,
	[Bashas Admin Fee] [numeric](18, 2) NULL,
	[ML Volume] [numeric](18, 2) NULL,
	[ML Admin Fee] [numeric](18, 2) NULL,
	[Cardinal Volume] [numeric](18, 2) NULL,
	[AAP Volume Admin Fee Retained] [numeric](18, 2) NULL,
	[Cardinal Generic Src Volume] [numeric](18, 2) NULL,
	[AAP Generic Admin Fee Retained] [numeric](18, 2) NULL,
	[IPA Generic Admin Fee] [numeric](18, 2) NULL,
	[Total Admin Fees Retained] [numeric](18, 2) NULL,
	[API Generic Sales] [numeric](18, 2) NULL,
	[API Generic Contributions] [numeric](18, 2) NULL,
	[API Brand Sales] [numeric](18, 2) NULL,
	[API Brand Contributions] [numeric](18, 2) NULL,
	[API OTC Sales] [numeric](18, 2) NULL,
	[API OTC Contributions] [numeric](18, 2) NULL,
	[Total Account Contributions] [numeric](18, 2) NULL,
	[Total Group Contributions] [numeric](18, 2) NULL,
	[Group #] [varchar](20) NULL,
	[Rank] [int] NULL
) ON [PRIMARY]
GO
