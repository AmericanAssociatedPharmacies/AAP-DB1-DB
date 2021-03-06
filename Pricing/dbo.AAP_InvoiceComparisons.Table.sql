USE [Pricing]
GO
/****** Object:  Table [dbo].[AAP_InvoiceComparisons]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAP_InvoiceComparisons](
	[InvoiceComparisonID] [int] IDENTITY(1,1) NOT NULL,
	[TerritoryManagerID] [int] NULL,
	[SupplierID] [int] NULL,
	[GroupID] [int] NULL,
	[StatusID] [int] NULL,
	[RequestDate] [date] NULL,
	[PharmacyName] [nchar](128) NOT NULL,
	[City] [nchar](128) NULL,
	[State] [nchar](2) NULL,
	[EstGenericVolume] [decimal](11, 2) NULL,
	[ExpectedFollowupDate] [date] NULL,
	[InvoiceDate] [date] NULL,
	[AAPAccountNo] [int] NULL,
	[Notes] [text] NULL,
	[PVACost] [decimal](11, 2) NULL,
	[PVAExtendedCost] [decimal](11, 2) NULL,
	[StoreCost] [decimal](11, 2) NULL,
	[StoreExtendedCost] [decimal](11, 2) NULL,
	[UnitDifference] [decimal](11, 2) NULL,
	[UnitDifferencePercentage] [decimal](5, 2) NULL,
	[ExtendedDifference] [decimal](11, 2) NULL,
	[ExtendedDifferencePercentage] [decimal](5, 2) NULL,
	[APIAccountNo] [int] NULL,
 CONSTRAINT [PK_AAP_InvoiceComparisons] PRIMARY KEY CLUSTERED 
(
	[InvoiceComparisonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons] ADD  CONSTRAINT [DF_AAP_InvoiceComparisons_StatusID]  DEFAULT ((1)) FOR [StatusID]
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons]  WITH CHECK ADD FOREIGN KEY([TerritoryManagerID])
REFERENCES [dbo].[TerritoryManagers] ([TerritoryManagerID])
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons]  WITH CHECK ADD FOREIGN KEY([TerritoryManagerID])
REFERENCES [dbo].[TerritoryManagers] ([TerritoryManagerID])
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons]  WITH CHECK ADD  CONSTRAINT [FK_GroupAAP_InvoiceComparisons] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Groups] ([GroupID])
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons] CHECK CONSTRAINT [FK_GroupAAP_InvoiceComparisons]
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons]  WITH CHECK ADD  CONSTRAINT [FK_StatusAAP_InvoiceComparisons] FOREIGN KEY([StatusID])
REFERENCES [dbo].[IC_Status] ([StatusID])
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons] CHECK CONSTRAINT [FK_StatusAAP_InvoiceComparisons]
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons]  WITH CHECK ADD  CONSTRAINT [FK_SupplierAAP_InvoiceComparisons] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[AAP_InvoiceComparisons] CHECK CONSTRAINT [FK_SupplierAAP_InvoiceComparisons]
GO
