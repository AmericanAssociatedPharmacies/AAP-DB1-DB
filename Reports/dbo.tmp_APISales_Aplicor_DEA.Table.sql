USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_APISales_Aplicor_DEA]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_APISales_Aplicor_DEA](
	[pmid] [int] NULL,
	[DEA] [varchar](50) NULL,
	[apiaccountno] [varchar](20) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
