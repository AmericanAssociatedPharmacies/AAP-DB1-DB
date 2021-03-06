USE [TempTables]
GO
/****** Object:  Table [dbo].[RLGLtemp_data3mo]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_data3mo](
	[NCPDP] [nvarchar](50) NULL,
	[PMID] [int] NULL,
	[BIN Nbr] [nvarchar](50) NULL,
	[Rx Nbr] [nvarchar](50) NULL,
	[Rx Date] [datetime] NULL,
	[Qty Dispensed] [numeric](38, 3) NULL,
	[NDC] [nvarchar](50) NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[CHMaxUnit] [numeric](38, 4) NULL,
	[APIMaxPriceUnit] [numeric](38, 4) NULL,
	[APIMaxNetUnit] [numeric](38, 6) NULL,
	[CHRebatePerc] [float] NULL,
	[CHNetUnit] [float] NULL,
	[MinUnitList] [numeric](38, 4) NULL,
	[MinUnitNet] [float] NULL,
	[NDCFound] [varchar](1) NOT NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[LossList] [numeric](38, 3) NULL,
	[NoLossNet] [float] NULL,
	[LossNet] [float] NULL
) ON [PRIMARY]
GO
