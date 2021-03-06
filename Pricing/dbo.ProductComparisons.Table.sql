USE [Pricing]
GO
/****** Object:  Table [dbo].[ProductComparisons]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductComparisons](
	[ProductComparisonID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceComparisonID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[StorePrice] [decimal](11, 2) NOT NULL,
	[CIN] [varchar](24) NULL,
	[AAPExtendedPrice] [decimal](11, 2) NOT NULL,
	[StoreExtendedPrice] [decimal](11, 2) NOT NULL,
	[Contract] [varchar](64) NULL,
	[CardinalPricing_EntryID] [int] NULL,
 CONSTRAINT [PK_ProductComparisons] PRIMARY KEY CLUSTERED 
(
	[ProductComparisonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProductComparisons]  WITH CHECK ADD FOREIGN KEY([CardinalPricing_EntryID])
REFERENCES [dbo].[CardinalPricing_forCompare] ([EntryID])
GO
ALTER TABLE [dbo].[ProductComparisons]  WITH CHECK ADD FOREIGN KEY([CardinalPricing_EntryID])
REFERENCES [dbo].[CardinalPricing_forCompare] ([EntryID])
GO
ALTER TABLE [dbo].[ProductComparisons]  WITH CHECK ADD  CONSTRAINT [FK_AAP_InvoiceComparisonsProductComparisons] FOREIGN KEY([InvoiceComparisonID])
REFERENCES [dbo].[AAP_InvoiceComparisons] ([InvoiceComparisonID])
GO
ALTER TABLE [dbo].[ProductComparisons] CHECK CONSTRAINT [FK_AAP_InvoiceComparisonsProductComparisons]
GO
