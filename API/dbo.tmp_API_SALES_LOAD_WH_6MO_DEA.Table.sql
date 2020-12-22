USE [API]
GO
/****** Object:  Table [dbo].[tmp_API_SALES_LOAD_WH_6MO_DEA]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_API_SALES_LOAD_WH_6MO_DEA](
	[pmid] [int] NULL,
	[DEA] [varchar](50) NULL,
	[whaccountid] [varchar](32) NULL,
	[tot_mo_1] [numeric](38, 2) NULL,
	[tot_mo_2] [numeric](38, 2) NULL,
	[tot_mo_3] [numeric](38, 2) NULL,
	[tot_mo_4] [numeric](38, 2) NULL,
	[tot_mo_5] [numeric](38, 2) NULL,
	[tot_mo_6] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
