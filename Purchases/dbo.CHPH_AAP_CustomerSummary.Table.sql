USE [Purchases]
GO
/****** Object:  Table [dbo].[CHPH_AAP_CustomerSummary]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_AAP_CustomerSummary](
	[PMID] [int] NULL,
	[Date] [datetime] NULL,
	[BrandUnits] [numeric](38, 0) NULL,
	[GenericUnits] [numeric](38, 0) NULL,
	[BrandSales] [float] NULL,
	[GenericSales] [float] NULL
) ON [PRIMARY]
GO
