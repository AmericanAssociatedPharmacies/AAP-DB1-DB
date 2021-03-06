USE [Reports]
GO
/****** Object:  Table [dbo].[delete_brandtest]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[delete_brandtest](
	[ndc] [varchar](15) NULL,
	[ch_brand_max] [varchar](31) NULL,
	[ch_brand_min] [varchar](31) NULL,
	[ch_type_max] [varchar](15) NULL,
	[ch_type_min] [varchar](15) NULL,
	[storecount] [int] NULL,
	[ship_qty] [numeric](38, 0) NULL,
	[ext_cost] [float] NULL
) ON [PRIMARY]
GO
