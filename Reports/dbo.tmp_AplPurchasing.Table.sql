USE [Reports]
GO
/****** Object:  Table [dbo].[tmp_AplPurchasing]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmp_AplPurchasing](
	[Affiliate] [varchar](128) NULL,
	[LTCGPO] [varchar](128) NULL,
	[PaymentTerms] [varchar](128) NULL,
	[WholesaleRebates] [varchar](128) NULL,
	[FirstScript] [varchar](128) NULL,
	[WholesalerPrimary] [varchar](128) NULL,
	[WholesalerSecondary] [varchar](128) NULL,
	[WholesalerGroup] [varchar](128) NULL,
	[PurchashingCSOS] [varchar](128) NULL
) ON [PRIMARY]
GO
