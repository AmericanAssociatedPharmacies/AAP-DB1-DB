USE [Pricing]
GO
/****** Object:  Table [dbo].[AAP_AllInvoiceComparisons]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAP_AllInvoiceComparisons](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceDate] [datetime] NULL,
	[Supplier] [varchar](128) NULL,
	[ST] [varchar](128) NULL,
	[Group] [varchar](128) NULL,
	[SKUs] [int] NULL,
	[AAPCost] [decimal](18, 0) NULL,
	[AAPExtCost] [decimal](18, 0) NULL,
	[StoreCost] [decimal](18, 0) NULL,
	[StoreExtCost] [decimal](18, 0) NULL,
	[UnitDiff] [decimal](18, 0) NULL,
	[UnitDiffPercent] [decimal](18, 0) NULL,
	[ExtDiff] [decimal](18, 0) NULL,
	[ExtDiffPercent] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
