USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_startup_store_rpt_AAP]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_startup_store_rpt_AAP](
	[year] [varchar](4) NULL,
	[store] [varchar](65) NULL,
	[Effective] [varchar](10) NULL,
	[acct_no] [varchar](8) NULL,
	[nsterritory] [varchar](2) NULL,
	[June] [numeric](38, 2) NULL,
	[July] [numeric](38, 2) NULL,
	[August] [numeric](38, 2) NULL,
	[September] [numeric](38, 2) NULL,
	[October] [numeric](38, 2) NULL,
	[November] [numeric](38, 2) NULL,
	[December] [numeric](38, 2) NULL,
	[January] [numeric](38, 2) NULL,
	[February] [numeric](38, 2) NULL,
	[March] [numeric](38, 2) NULL,
	[April] [numeric](38, 2) NULL,
	[May] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
