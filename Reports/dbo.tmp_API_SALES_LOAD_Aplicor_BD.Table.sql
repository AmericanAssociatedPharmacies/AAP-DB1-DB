USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_Aplicor_BD]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_Aplicor_BD](
	[apiaccountno] [varchar](20) NULL,
	[DEA] [varchar](50) NULL,
	[PMID] [int] NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[gen_mo_1] [numeric](38, 2) NULL,
	[gen_mo_2] [numeric](38, 2) NULL,
	[gen_mo_3] [numeric](38, 2) NULL,
	[br_mo_1] [numeric](38, 2) NULL,
	[br_mo_2] [numeric](38, 2) NULL,
	[br_mo_3] [numeric](38, 2) NULL,
	[otc_mo_1] [numeric](38, 2) NULL,
	[otc_mo_2] [numeric](38, 2) NULL,
	[otc_mo_3] [numeric](38, 2) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
