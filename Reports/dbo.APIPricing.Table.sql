USE [Reports]
GO
/****** Object:  Table [dbo].[APIPricing]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIPricing](
	[NDC] [varchar](11) NULL,
	[API_ItemNumber] [varchar](25) NULL,
	[APICustomerInvoicePrice] [money] NULL,
	[APIPricePerUnit] [money] NULL,
	[APIRebate] [money] NULL,
	[APIRebatePercentage] [decimal](5, 2) NULL,
	[APIHoldBackPrice] [money] NULL,
	[APICustomerNetPrice] [money] NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APIPricing] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
