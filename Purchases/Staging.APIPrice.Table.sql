USE [Purchases]
GO
/****** Object:  Table [Staging].[APIPrice]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIPrice](
	[APIItemNbr] [nvarchar](50) NULL,
	[NDC] [nvarchar](20) NULL,
	[Description] [nvarchar](200) NULL,
	[Unit] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
	[Contract] [nvarchar](50) NULL,
	[APIPrice] [nvarchar](50) NULL,
	[PricePerUnit] [numeric](18, 4) NULL,
	[GPI] [nvarchar](50) NULL,
	[AdjRebate] [numeric](18, 4) NULL,
	[UnitNet] [numeric](18, 6) NULL,
	[BillableSize] [nvarchar](50) NULL,
	[dateloaded] [datetime] NULL
) ON [PRIMARY]
GO
