USE [API]
GO
/****** Object:  Table [dbo].[API_MO_WHSales_090710]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_MO_WHSales_090710](
	[Date] [datetime] NULL,
	[WHAccountID] [varchar](32) NULL,
	[Brand] [numeric](18, 2) NULL,
	[Generics] [numeric](18, 2) NULL,
	[OTC] [numeric](18, 2) NULL,
	[TotalSales] [numeric](18, 2) NULL
) ON [PRIMARY]
GO
