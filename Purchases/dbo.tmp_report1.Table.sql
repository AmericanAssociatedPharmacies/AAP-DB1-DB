USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_report1]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_report1](
	[NDC] [varchar](11) NULL,
	[pmid] [int] NULL,
	[total_ship_qty] [numeric](38, 0) NULL,
	[total_ext_cost] [float] NULL,
	[total_corp_awp] [float] NULL,
	[total_wac] [float] NULL
) ON [PRIMARY]
GO
