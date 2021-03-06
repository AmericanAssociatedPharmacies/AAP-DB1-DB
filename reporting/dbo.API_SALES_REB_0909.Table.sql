USE [reporting]
GO
/****** Object:  Table [dbo].[API_SALES_REB_0909]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_SALES_REB_0909](
	[GroupNo] [varchar](50) NULL,
	[BsCls] [varchar](10) NULL,
	[DEA] [varchar](50) NULL,
	[APIAcctNo] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[TotalCardinalSales] [money] NULL,
	[CABrandSales] [money] NULL,
	[OTCSales] [money] NULL,
	[CAGenericConReb] [money] NULL,
	[GenRebHeld] [money] NULL,
	[Q309COG] [float] NULL,
	[GBR] [float] NULL,
	[GBPA] [float] NULL,
	[CAP2P3SALES] [money] NULL,
	[CAP2P3REBATES] [money] NULL,
	[CAHPayTerms] [varchar](50) NULL
) ON [PRIMARY]
GO
