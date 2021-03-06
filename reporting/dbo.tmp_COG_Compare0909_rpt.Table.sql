USE [reporting]
GO
/****** Object:  Table [dbo].[tmp_COG_Compare0909_rpt]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_COG_Compare0909_rpt](
	[store] [varchar](65) NULL,
	[city] [varchar](20) NULL,
	[state] [varchar](2) NULL,
	[acct_no] [varchar](50) NULL,
	[nsterritory] [varchar](2) NULL,
	[GroupId] [varchar](10) NULL,
	[GROUP DESIGNATION] [varchar](50) NULL,
	[COG Buy Plan %] [numeric](38, 4) NULL,
	[AR2000 Terms Code] [nvarchar](255) NULL,
	[Statement Frequency] [nvarchar](255) NULL,
	[Q3_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_Total_Sales_Group] [numeric](38, 2) NULL,
	[AVG_MO_TOTAL] [numeric](38, 2) NULL,
	[AVG_MO_BRAND] [numeric](38, 2) NULL,
	[Q309Base] [numeric](38, 4) NULL,
	[BrandAtWac] [numeric](38, 2) NULL,
	[Q309Savings] [numeric](38, 2) NULL,
	[ProposedCOG] [numeric](38, 4) NULL,
	[COGDelta] [numeric](38, 4) NULL,
	[Q309NewBase] [numeric](38, 4) NULL,
	[ProposedMnthlyBrands] [numeric](38, 2) NULL,
	[ProposedBrandSavings] [numeric](38, 2) NULL,
	[ProposedSavingsLoss] [numeric](38, 2) NULL,
	[AVG_MO_OTC] [numeric](38, 2) NULL,
	[OTCdivTotalPurchases] [numeric](38, 4) NULL,
	[OTCAtWAC] [numeric](38, 2) NULL,
	[OTCLoss] [numeric](38, 2) NULL,
	[AVG_MO_SOURCE] [numeric](38, 2) NULL,
	[CurrAvgMoRebate] [numeric](38, 2) NULL,
	[ProposedAvgMoRebate] [numeric](38, 2) NULL,
	[ProposedGenericSavingLoss] [numeric](38, 2) NULL,
	[TotalSavingLoss] [numeric](38, 2) NULL,
	[BasisPointsValueOfSavings] [numeric](38, 4) NULL,
	[GCR%] [numeric](38, 4) NULL,
	[Curr_UpfrontDiscount] [numeric](38, 2) NULL,
	[New_UpfrontDiscount] [numeric](38, 2) NULL,
	[COG% 12/1] [numeric](38, 4) NULL,
	[Est Pay Term Disc] [numeric](38, 4) NULL,
	[Pay Term Savings] [numeric](38, 2) NULL
) ON [PRIMARY]
GO
