USE [Pricing]
GO
/****** Object:  Table [dbo].[API_AllInvoiceComparisons]    Script Date: 12/22/2020 4:51:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[API_AllInvoiceComparisons](
	[EntryID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceDate] [date] NULL,
	[Supplier] [varchar](128) NULL,
	[Group] [varchar](128) NULL,
	[SKUs] [int] NULL,
	[APITotal] [decimal](9, 2) NULL,
	[StoreTotal] [decimal](9, 2) NULL,
	[Less20Percent] [decimal](9, 2) NULL,
	[APINet] [decimal](9, 2) NULL,
	[Savings] [decimal](9, 2) NULL,
	[SavingsPercent] [decimal](5, 2) NULL,
	[APIInvw20Percent] [decimal](5, 2) NULL,
	[APIInv] [decimal](5, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[EntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
