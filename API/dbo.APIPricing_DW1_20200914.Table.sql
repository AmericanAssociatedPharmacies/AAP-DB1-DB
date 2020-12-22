USE [API]
GO
/****** Object:  Table [dbo].[APIPricing_DW1_20200914]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIPricing_DW1_20200914](
	[EffectiveDate] [date] NULL,
	[APICustomerInvoicePrice] [money] NULL,
	[RebateAmt] [money] NULL,
	[NDC] [varchar](11) NULL,
	[APIItemNum] [varchar](25) NULL
) ON [PRIMARY]
GO
