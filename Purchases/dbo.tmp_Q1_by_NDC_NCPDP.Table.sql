USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_Q1_by_NDC_NCPDP]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_Q1_by_NDC_NCPDP](
	[ndc] [varchar](15) NULL,
	[ncpdp] [varchar](20) NULL,
	[order_qty] [numeric](38, 0) NULL,
	[ship_qty] [numeric](38, 0) NULL
) ON [PRIMARY]
GO
