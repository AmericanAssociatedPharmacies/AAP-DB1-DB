USE [Reports]
GO
/****** Object:  Table [dbo].[import_RebateGenericIncentiveSumBKP062816]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_RebateGenericIncentiveSumBKP062816](
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[APIAccountNo] [varchar](255) NULL,
	[BusCls] [varchar](255) NULL,
	[Affiliate] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[City] [varchar](255) NULL,
	[State] [varchar](255) NULL,
	[Territory] [varchar](255) NULL,
	[TotalGenericsSales] [money] NULL,
	[EligGenericsforRebate] [money] NULL,
	[GenericLoyaltyRebate] [money] NULL,
	[FirstPaymentAmt] [money] NULL,
	[CheckFeeFirstPayment] [money] NULL,
	[NetPaymentFirstPayment] [money] NULL,
	[PayAccountFirstPayment] [bit] NULL,
	[PaymentModeFirstPayment] [varchar](255) NULL,
	[SecondPaymentAmt] [money] NULL,
	[CheckFeeSecondPayment] [money] NULL,
	[NetPaymentSecondPayment] [money] NULL,
	[PayAccountSecondPayment] [bit] NULL,
	[BusClsSecondPayment] [varchar](255) NULL,
	[AffiliateSecondPayment] [varchar](255) NULL,
	[NegativeRebatesCollectedSecondPayment] [money] NULL,
	[SecondPaymentCollectFC] [money] NULL,
	[SecondPaymentCollectNegativeRebate] [money] NULL
) ON [PRIMARY]
GO
