USE [reporting]
GO
/****** Object:  Table [dbo].[API_WH_0909]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_WH_0909](
	[CUST_STAT] [varchar](50) NULL,
	[AcctNo] [varchar](50) NULL,
	[Name] [varchar](255) NULL,
	[DEA] [varchar](50) NULL,
	[MEMNUM] [varchar](50) NULL,
	[AffiliatedGrp] [varchar](100) NULL,
	[CA_No] [varchar](50) NULL,
	[AprilSales] [money] NULL,
	[MaySales] [money] NULL,
	[JuneSales] [money] NULL,
	[JulySales] [money] NULL,
	[AugSales] [money] NULL,
	[SeptSales] [money] NULL,
	[F15] [varchar](50) NULL
) ON [PRIMARY]
GO
