USE [Reports]
GO
/****** Object:  Table [Archive].[APIPricing]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Archive].[APIPricing](
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
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Archive].[APIPricing] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
