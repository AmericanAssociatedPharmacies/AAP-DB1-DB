USE [Reports]
GO
/****** Object:  Table [dbo].[PM_AnnualRebatesBKP062816]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebatesBKP062816](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
	[Affiliate] [varchar](50) NULL,
	[BusClass] [varchar](50) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[GenericIncentiveFirstPayment] [numeric](18, 2) NULL,
	[GenericIncentiveSecondPayment] [numeric](18, 2) NULL,
	[GenericIncentive] [numeric](18, 2) NULL,
	[PlanOGramRebate] [numeric](18, 2) NULL,
	[PatronageDividend] [numeric](18, 2) NULL,
	[PatDivFirstPayment] [numeric](18, 2) NULL,
	[PatDivSecondPayment] [numeric](18, 2) NULL,
	[3MRebate] [numeric](18, 2) NULL,
	[POGRebate] [numeric](18, 2) NULL,
	[MasonRebate] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
