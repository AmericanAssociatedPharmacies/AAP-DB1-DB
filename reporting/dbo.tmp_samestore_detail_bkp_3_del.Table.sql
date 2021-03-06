USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_samestore_detail_bkp_3_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_detail_bkp_3_del](
	[chain_code] [varchar](3) NULL,
	[acct_no] [varchar](4) NULL,
	[store_name] [varchar](65) NULL,
	[type] [varchar](15) NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_2008_SS] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
