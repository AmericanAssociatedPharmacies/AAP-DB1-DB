USE [API]
GO
/****** Object:  Table [Staging].[APIPricing]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APIPricing](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[APIItemNum] [varchar](25) NOT NULL,
	[NDC] [varchar](15) NOT NULL,
	[DrugName] [varchar](100) NULL,
	[IsControl] [bit] NOT NULL,
	[IsC2Control] [bit] NOT NULL,
	[CustomerInvoicePrice] [numeric](18, 2) NULL,
	[Created] [date] NULL,
	[BrandName] [varchar](50) NULL,
	[RebateAmt] [numeric](18, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[EffectiveDate] [date] NULL,
	[IsTier1] [bit] NULL,
	[IsTier2] [bit] NULL
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[APIPricing] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
