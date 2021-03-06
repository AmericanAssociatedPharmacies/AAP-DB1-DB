USE [API]
GO
/****** Object:  Table [dbo].[APIPricing_new]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIPricing_new](
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
	[EffectiveDate] [date] NOT NULL,
	[IsTier1] [bit] NULL,
	[IsTier2] [bit] NULL,
 CONSTRAINT [CPK_APIPricing] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APIPricing_new] ADD  DEFAULT ((0)) FOR [IsControl]
GO
ALTER TABLE [dbo].[APIPricing_new] ADD  DEFAULT ((0)) FOR [IsC2Control]
GO
ALTER TABLE [dbo].[APIPricing_new] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
