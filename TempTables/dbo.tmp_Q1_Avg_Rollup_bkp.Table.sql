USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_Q1_Avg_Rollup_bkp]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_Avg_Rollup_bkp](
	[PMID] [varchar](255) NULL,
	[Q1AvgSales] [numeric](24, 6) NULL
) ON [PRIMARY]
GO
