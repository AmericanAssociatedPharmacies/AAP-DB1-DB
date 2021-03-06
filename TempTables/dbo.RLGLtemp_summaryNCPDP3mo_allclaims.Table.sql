USE [TempTables]
GO
/****** Object:  Table [dbo].[RLGLtemp_summaryNCPDP3mo_allclaims]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RLGLtemp_summaryNCPDP3mo_allclaims](
	[#ClaimsAll] [int] NULL,
	[$ClaimsAllTotalPaid] [numeric](38, 3) NULL,
	[NCPDP] [nvarchar](50) NULL,
	[#ClaimsWithPricing] [int] NULL,
	[Cost Submitted] [numeric](38, 3) NULL,
	[UC] [numeric](38, 3) NULL,
	[Cost Paid] [numeric](38, 3) NULL,
	[Fee Paid] [numeric](38, 3) NULL,
	[Total Paid] [numeric](38, 3) NULL,
	[TotalList] [numeric](38, 6) NULL,
	[TotalNet] [float] NULL,
	[ProfitSubmitted] [numeric](38, 3) NULL,
	[ProfitList] [numeric](38, 3) NULL,
	[ProfitNet] [float] NULL,
	[#LossSubmitted] [int] NULL,
	[LossSubmitted] [numeric](38, 3) NULL,
	[#NoLossSubmitted] [int] NULL,
	[NoLossSubmitted] [numeric](38, 3) NULL,
	[#LossList] [int] NULL,
	[LossList] [numeric](38, 3) NULL,
	[#NoLossList] [int] NULL,
	[NoLossList] [numeric](38, 3) NULL,
	[#LossNet] [int] NULL,
	[LossNet] [float] NULL,
	[#NoLossNet] [int] NULL,
	[NoLossNet] [float] NULL
) ON [PRIMARY]
GO
