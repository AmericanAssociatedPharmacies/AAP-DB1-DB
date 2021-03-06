USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_samestore_bkp_3_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_samestore_bkp_3_del](
	[chain_code] [varchar](3) NULL,
	[type] [varchar](15) NULL,
	[stores_ss] [int] NULL,
	[FYTD_2009_SS] [numeric](38, 2) NULL,
	[FYTD_2008_SS] [numeric](38, 2) NULL,
	[FYTD_SS_PERC_CHG] [numeric](38, 4) NULL,
	[Stores_Purchasing_FYTD_2009] [numeric](38, 0) NULL,
	[FYTD_2009_ALL] [numeric](38, 2) NULL,
	[Stores_Purchasing_FYTD_2008] [numeric](38, 0) NULL,
	[FYTD_2008_ALL] [numeric](38, 2) NULL,
	[FYTD_ALL_PERC_CHG] [numeric](38, 4) NULL
) ON [PRIMARY]
GO
