USE [Purchases]
GO
/****** Object:  Table [dbo].[tmp_UPTopGCN]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_UPTopGCN](
	[GCN] [numeric](5, 0) NOT NULL,
	[TradeName] [varchar](127) NULL,
	[Stength] [varchar](127) NULL,
	[UnitCost] [float] NULL,
	[TotalextCost] [float] NULL
) ON [PRIMARY]
GO
