USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[SalesFact_Audited]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesFact_Audited](
	[DateKey] [int] NOT NULL,
	[PharmacyKey] [int] NOT NULL,
	[APICOGAppliedSales] [float] NULL,
	[APINetSales] [float] NULL,
	[APIGENRx] [float] NULL,
	[APIGENTotalSrc] [float] NULL,
	[APIGENTotalP2P3] [float] NULL,
	[APIGENTotal] [float] NULL,
	[APIBrand] [float] NULL,
	[APIOTC] [float] NULL,
	[APIOther] [float] NULL,
	[APIGBRPerc] [decimal](18, 4) NULL,
	[AAPCOGAppliedSales] [float] NULL,
	[AAPNetSalesAmount] [money] NOT NULL,
	[AAPBrandSalesAmount] [money] NOT NULL,
	[AAPGenericTotalSalesAmount] [money] NOT NULL,
	[AAPGenericTotalSrcSalesAmount] [money] NOT NULL,
	[AAPGenericExcludedSalesAmount] [money] NOT NULL,
	[AAPOTCSalesAmount] [money] NOT NULL,
	[AAPOtherSalesAmount] [money] NOT NULL,
	[AAPTotalRXSalesAmount] [money] NOT NULL,
	[AAPExcludedFromTotalRXSalesAmount] [money] NOT NULL,
	[AAPNonRXOTCandHH] [money] NULL,
	[AAPSourceCompliance] [decimal](18, 4) NULL,
	[UDNetSales] [float] NULL,
	[UDBrand] [float] NULL,
	[UDGENTotalSrc] [float] NULL,
	[UDGENTotal] [float] NULL,
	[UDOTC] [float] NULL,
	[UDOther] [float] NULL,
	[UDAdminOnly] [float] NULL,
	[CombNetSales] [float] NULL,
	[CombBrands] [float] NULL,
	[CombOTC] [float] NULL,
	[CombGENTotal] [float] NULL,
	[CombGENTotalSrc] [float] NULL,
	[CombOther] [float] NULL,
	[CombAdminOnly] [float] NULL,
	[APIBrandSales] [money] NOT NULL,
	[APIBrandUnits] [int] NULL,
	[APIGenericSales] [money] NOT NULL,
	[APIGenericUnits] [int] NULL,
	[APIOTCSales] [money] NOT NULL,
	[APIOTCUnits] [int] NULL,
	[APITotalSales] [money] NOT NULL,
	[MLTotal] [money] NOT NULL,
	[AndaTotal] [money] NOT NULL,
	[CAHBrandSalesAmount] [money] NOT NULL,
	[CAHExcludedSalesAmount] [money] NOT NULL,
	[CAHSourceGenericSalesAmount] [money] NOT NULL,
	[CAHNonContractGenericSalesAmount] [money] NOT NULL,
	[CAHOTCSalesAmount] [money] NOT NULL,
	[CAHSuppliesOtherSalesAmount] [money] NOT NULL,
	[TransactionCount] [bit] NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPNetSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPBrandSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPGenericTotalSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPGenericTotalSrcSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPGenericExcludedSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPOTCSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPOtherSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPTotalRXSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AAPExcludedFromTotalRXSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [APIBrandSales]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [APIGenericSales]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [APIOTCSales]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [APITotalSales]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [MLTotal]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [AndaTotal]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHBrandSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHExcludedSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHSourceGenericSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHNonContractGenericSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHOTCSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((0.00)) FOR [CAHSuppliesOtherSalesAmount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT ((1)) FOR [TransactionCount]
GO
ALTER TABLE [dbo].[SalesFact_Audited] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
