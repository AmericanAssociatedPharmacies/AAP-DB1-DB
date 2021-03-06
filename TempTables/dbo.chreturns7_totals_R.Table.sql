USE [TempTables]
GO
/****** Object:  Table [dbo].[chreturns7_totals_R]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chreturns7_totals_R](
	[year] [int] NULL,
	[month] [int] NULL,
	[sale_qty_all] [numeric](38, 1) NULL,
	[sale_cost_all] [float] NULL,
	[return_qty_all] [numeric](38, 1) NULL,
	[return_cost_all] [float] NULL,
	[sale_qty_C2] [numeric](38, 1) NULL,
	[sale_cost_C2] [float] NULL,
	[return_qty_C2] [numeric](38, 1) NULL,
	[return_cost_C2] [float] NULL,
	[sales_C2%sales_all] [float] NULL,
	[ret%sales_all] [float] NULL,
	[ret%sales_C2] [float] NULL,
	[ret_C2%ret_all] [float] NULL
) ON [PRIMARY]
GO
