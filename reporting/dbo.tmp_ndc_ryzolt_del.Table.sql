USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_ndc_ryzolt_del]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_ndc_ryzolt_del](
	[store] [varchar](31) NULL,
	[customer_name] [varchar](63) NULL,
	[NDC 59011033430 Qty] [numeric](38, 0) NULL,
	[NDC 59011033530 Qty] [int] NULL,
	[NDC 59011033630 Qty] [int] NULL
) ON [PRIMARY]
GO
