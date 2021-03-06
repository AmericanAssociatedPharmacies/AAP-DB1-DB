USE [reporting]
GO
/****** Object:  Table [dbo].[api_cah_0909_grp]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[api_cah_0909_grp](
	[DEA] [varchar](255) NULL,
	[COG] [float] NULL,
	[TotalExtSales] [money] NULL,
	[RxExtSales] [money] NULL,
	[RxBrandExtSales] [money] NULL,
	[TotGenExtSales] [money] NULL,
	[TotalSource] [money] NULL,
	[P2_P3Volume] [money] NULL,
	[OTC_COG_Applied] [money] NULL
) ON [PRIMARY]
GO
