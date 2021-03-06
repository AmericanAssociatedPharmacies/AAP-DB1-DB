USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_gen_brnd_qtr_all_bkp]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_gen_brnd_qtr_all_bkp](
	[acct_no] [char](4) NULL,
	[store] [varchar](65) NULL,
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[generic_Q1_2009] [numeric](38, 2) NULL,
	[brand_Q1_2009] [numeric](38, 2) NULL,
	[generic_Q2_2009] [numeric](38, 2) NULL,
	[brand_Q2_2009] [numeric](38, 2) NULL,
	[generic_Q3_2009] [numeric](38, 2) NULL,
	[brand_Q3_2009] [numeric](38, 2) NULL,
	[generic_Q1_2008] [numeric](38, 2) NULL,
	[brand_Q1_2008] [numeric](38, 2) NULL,
	[generic_Q2_2008] [numeric](38, 2) NULL,
	[brand_Q2_2008] [numeric](38, 2) NULL,
	[generic_Q3_2008] [numeric](38, 2) NULL,
	[brand_Q3_2008] [numeric](38, 2) NULL,
	[vendor_id] [int] NULL,
	[wholesaler] [varchar](12) NULL
) ON [PRIMARY]
GO
