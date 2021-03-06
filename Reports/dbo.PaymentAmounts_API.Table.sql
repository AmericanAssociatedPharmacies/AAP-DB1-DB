USE [Reports]
GO
/****** Object:  Table [dbo].[PaymentAmounts_API]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaymentAmounts_API](
	[PMID] [int] NULL,
	[AAPAccountNo] [varchar](20) NULL,
	[FinancialEmail] [varchar](255) NULL,
	[GeneralEmail] [varchar](255) NULL,
	[StoreName] [varchar](65) NULL,
	[PharmacyOwner] [varchar](200) NULL,
	[APIRebatePaymentAmount] [money] NULL,
	[RebateMonth] [datetime] NULL
) ON [PRIMARY]
GO
