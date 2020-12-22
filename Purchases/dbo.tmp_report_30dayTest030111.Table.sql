USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_report_30dayTest030111]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report_30dayTest030111](
	[ndc] [nvarchar](255) NULL,
	[CARDINALITEMNUMBER] [nvarchar](255) NULL,
	[lineitems] [int] NULL,
	[sum_order_qty] [numeric](38, 0) NULL,
	[sum_ship_qty] [numeric](38, 0) NULL,
	[sum_ext_cost] [float] NULL,
	[sum_corp_awp] [float] NULL,
	[sum_wac] [float] NULL
) ON [PRIMARY]
GO
