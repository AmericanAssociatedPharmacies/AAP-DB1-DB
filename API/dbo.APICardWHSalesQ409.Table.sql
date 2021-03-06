USE [API]
GO
/****** Object:  Table [dbo].[APICardWHSalesQ409]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APICardWHSalesQ409](
	[Territory] [varchar](10) NULL,
	[APIAccountNo] [varchar](15) NULL,
	[Name] [varchar](255) NULL,
	[OctBr] [numeric](18, 2) NULL,
	[OctGen] [numeric](18, 2) NULL,
	[OctOTC] [numeric](18, 2) NULL,
	[OctSales] [numeric](18, 2) NULL,
	[NovBr] [numeric](18, 2) NULL,
	[NovGen] [numeric](18, 2) NULL,
	[NovOTC] [numeric](18, 2) NULL,
	[NovSales] [numeric](18, 2) NULL,
	[DecBr] [numeric](18, 2) NULL,
	[DecGen] [numeric](18, 2) NULL,
	[DecOTC] [numeric](18, 2) NULL,
	[DecSales] [numeric](18, 2) NULL,
	[TotalBrands] [numeric](18, 2) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[TotalOTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL,
	[OctCardinalSales] [numeric](18, 2) NULL,
	[NovCardinalSales] [numeric](18, 2) NULL,
	[DecCardinalSales] [numeric](18, 2) NULL,
	[TotalCardinalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
