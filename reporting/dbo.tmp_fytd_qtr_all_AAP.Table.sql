USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_fytd_qtr_all_AAP]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_fytd_qtr_all_AAP](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](5) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[effective] [datetime] NULL,
	[quitdate] [datetime] NULL,
	[Q1_FY_2009] [numeric](38, 2) NULL,
	[Q2_FY_2009] [numeric](38, 2) NULL,
	[Q3_FY_2009] [numeric](38, 2) NULL,
	[Q4_FY_2009] [numeric](38, 2) NULL,
	[Q1_FY_2008] [numeric](38, 2) NULL,
	[Q2_FY_2008] [numeric](38, 2) NULL,
	[Q3_FY_2008] [numeric](38, 2) NULL,
	[Q4_FY_2008] [numeric](38, 2) NULL,
	[Q1_FY_2009_AP] [numeric](38, 2) NULL,
	[Q2_FY_2009_AP] [numeric](38, 2) NULL,
	[Q3_FY_2009_AP] [numeric](38, 2) NULL,
	[Q4_FY_2009_AP] [numeric](38, 2) NULL,
	[Q1_FY_2008_AP] [numeric](38, 2) NULL,
	[Q2_FY_2008_AP] [numeric](38, 2) NULL,
	[Q3_FY_2008_AP] [numeric](38, 2) NULL,
	[Q4_FY_2008_AP] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
