USE [API]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_SLX_DEA_BKP]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_SLX_DEA_BKP](
	[pmid] [int] NULL,
	[DEA] [varchar](50) NULL,
	[whaccountid] [varchar](32) NULL,
	[tot_avg_3_mo] [numeric](38, 2) NULL,
	[gen_avg_3_mo] [numeric](38, 2) NULL,
	[br_avg_3_mo] [numeric](38, 2) NULL,
	[otc_avg_3_mo] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
