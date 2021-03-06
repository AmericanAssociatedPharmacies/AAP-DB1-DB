USE [reporting]
GO
/****** Object:  Table [dbo].[api_pva_0909]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_pva_0909](
	[DEA] [varchar](255) NULL,
	[COG] [float] NULL,
	[TotalExtSales] [money] NULL,
	[RxExtSales] [money] NULL,
	[RxBrandExtSales] [money] NULL,
	[TotGenExtSales] [money] NULL,
	[Q3_Total_Sales_Group] [numeric](38, 2) NULL,
	[Q3_Total_WH_Sales_Group] [numeric](38, 2) NULL,
	[TotalSource] [money] NULL,
	[P2_P3Volume] [money] NULL,
	[OTC_COG_Applied] [money] NULL,
	[GroupNo] [varchar](50) NULL,
	[APIAcctNo] [varchar](50) NULL,
	[CAHPayTerms] [varchar](50) NULL,
	[CAGenericConReb] [money] NULL,
	[GenRebHeld] [money] NULL,
	[Q309COG] [float] NULL,
	[GBR] [float] NULL,
	[GBPA] [float] NULL,
	[CAP2P3SALES] [money] NULL,
	[CAP2P3REBATES] [money] NULL,
	[TotalCardinalSales] [money] NULL,
	[CABrandSales] [money] NULL,
	[OTCSales] [money] NULL,
	[Q3WHSales] [money] NULL
) ON [PRIMARY]
GO
