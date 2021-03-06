USE [reporting]
GO
/****** Object:  Table [dbo].[API_CAH_0909]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_CAH_0909](
	[Div] [float] NULL,
	[Cust] [float] NULL,
	[MasterNo] [varchar](50) NULL,
	[ShipToName] [varchar](255) NULL,
	[ShipToAddr] [varchar](255) NULL,
	[ShipToCity] [varchar](255) NULL,
	[ST] [varchar](255) NULL,
	[DEA] [varchar](255) NULL,
	[COG] [float] NULL,
	[PayTerms] [varchar](255) NULL,
	[StatementFreq] [varchar](255) NULL,
	[NintyDayDSO] [float] NULL,
	[WAPD] [float] NULL,
	[TotalExtSales] [money] NULL,
	[RxExtendedSales] [money] NULL,
	[BrandSales] [money] NULL,
	[TotalGenExtSales] [money] NULL,
	[TotalSource] [money] NULL,
	[P2_P3Volume] [money] NULL,
	[OTC_COG_Applied] [money] NULL
) ON [PRIMARY]
GO
