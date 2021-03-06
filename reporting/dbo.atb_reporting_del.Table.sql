USE [reporting]
GO
/****** Object:  Table [dbo].[atb_reporting_del]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[atb_reporting_del](
	[ATB_REPORT_ID] [int] NULL,
	[ACCT_NO] [char](4) NULL,
	[NCPDP] [char](7) NULL,
	[SCRIPT] [char](15) NULL,
	[FILL_DT] [datetime] NULL,
	[BIN] [char](15) NULL,
	[BAL_0_TO_30_AMT] [numeric](10, 2) NULL,
	[BAL_31_TO_60_AMT] [numeric](10, 2) NULL,
	[BAL_61_TO_90_AMT] [numeric](10, 2) NULL,
	[BAL_91_TO_120_AMT] [numeric](10, 2) NULL,
	[BAL_121_TO_150_AMT] [numeric](10, 2) NULL,
	[BAL_151_TO_180_AMT] [numeric](10, 2) NULL,
	[BAL_OVER_180_AMT] [numeric](10, 2) NULL,
	[BALANCE_AMT] [numeric](10, 2) NULL
) ON [PRIMARY]
GO
