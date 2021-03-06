USE [reporting]
GO
/****** Object:  Table [dbo].[api_pva_0909_rpt]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_pva_0909_rpt](
	[DEA] [varchar](255) NULL,
	[Name] [varchar](100) NULL,
	[City] [varchar](100) NULL,
	[State] [varchar](10) NULL,
	[Territory] [varchar](10) NULL,
	[GroupNo] [varchar](50) NULL,
	[APIAcctNo] [varchar](50) NULL,
	[AAPAcctNo] [varchar](100) NULL,
	[COG] [float] NULL,
	[AVG_MO_TotalExtSales] [money] NULL,
	[AVG_MO_RxExtSales] [money] NULL,
	[AVG_MO_RxBrandExtSales] [money] NULL,
	[AVG_MO_TotGenExtSales] [money] NULL,
	[AVG_MO_Q3_Total_Sales_Group] [numeric](38, 6) NULL,
	[AVG_MO_TotalSource] [money] NULL,
	[AVG_MO_P2_P3Volume] [money] NULL,
	[AVG_MO_OTC_COG_Applied] [money] NULL,
	[CAHPayTerms] [varchar](50) NULL,
	[AVG_MO_CAGenericConReb] [money] NULL,
	[AVG_MO_GenRebHeld] [money] NULL,
	[Q309COG] [float] NULL,
	[GBR] [float] NULL,
	[GBPA] [float] NULL,
	[AVG_MO_CAP2P3SALES] [money] NULL,
	[AVG_MO_CAP2P3REBATES] [money] NULL,
	[AVG_MO_TotalCardinalSales] [money] NULL,
	[AVG_MO_CABrandSales] [money] NULL,
	[AVG_MO_OTCSales] [money] NULL,
	[AVG_MO_Q3WHSales] [money] NULL
) ON [PRIMARY]
GO
