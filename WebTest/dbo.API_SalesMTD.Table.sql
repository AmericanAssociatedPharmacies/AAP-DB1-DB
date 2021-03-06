USE [WebTest]
GO
/****** Object:  Table [dbo].[API_SalesMTD]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_SalesMTD](
	[APIAccountNo] [varchar](32) NOT NULL,
	[PMID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[BrandSales] [numeric](18, 2) NULL,
	[GenericSales] [numeric](18, 2) NULL,
	[OTCSales] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
