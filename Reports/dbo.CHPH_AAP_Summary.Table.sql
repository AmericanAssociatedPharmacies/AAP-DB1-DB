USE [Reports]
GO
/****** Object:  Table [dbo].[CHPH_AAP_Summary]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHPH_AAP_Summary](
	[PMID] [int] NULL,
	[Date] [datetime] NULL,
	[BrandUnits] [numeric](38, 0) NULL,
	[GenericUnits] [numeric](38, 0) NULL,
	[BrandSales] [float] NULL,
	[GenericSales] [float] NULL
) ON [PRIMARY]
GO
