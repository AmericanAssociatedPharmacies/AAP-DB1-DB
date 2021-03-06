USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PP_DistributionAmount2018]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_DistributionAmount2018](
	[VendorName] [varchar](150) NULL,
	[VendorID] [int] NULL,
	[AdminFeeFraction] [float] NOT NULL,
	[RebateFraction] [float] NOT NULL,
	[TotalFraction] [float] NOT NULL,
	[AdminFeeAmount] [float] NULL,
	[RebateAmount] [float] NULL,
	[TotalRebateAmountLoaded] [numeric](38, 2) NULL,
	[DistributionPercent] [float] NOT NULL
) ON [PRIMARY]
GO
