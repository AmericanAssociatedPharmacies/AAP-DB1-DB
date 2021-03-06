USE [TempTables]
GO
/****** Object:  Table [dbo].[tmp_SN_2012_byPMID3]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_SN_2012_byPMID3](
	[CIN] [nvarchar](255) NULL,
	[NDC] [varchar](11) NULL,
	[description] [nvarchar](255) NULL,
	[WAC_060112] [numeric](11, 5) NULL,
	[PS] [numeric](8, 3) NULL,
	[WACxPS] [numeric](20, 8) NULL,
	[PMID_count] [int] NULL,
	[order_qty_total] [numeric](38, 0) NULL,
	[ship_qty_total] [numeric](38, 0) NULL,
	[unit_cost_avg] [float] NULL,
	[unit_cost_min] [float] NULL,
	[unit_cost_max] [float] NULL,
	[ext_cost_total] [float] NULL
) ON [PRIMARY]
GO
