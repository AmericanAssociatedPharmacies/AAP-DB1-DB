USE [TempTables]
GO
/****** Object:  Table [dbo].[PM_AnnualRebates_041013]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AnnualRebates_041013](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](max) NULL,
	[BusClass] [varchar](50) NULL,
	[TotalGenerics] [numeric](18, 2) NULL,
	[GenericIncentive] [numeric](18, 2) NULL,
	[PlanOGramRebate] [numeric](18, 2) NULL,
	[PatronageDividend] [numeric](18, 2) NULL,
	[PatDivFirstPayment] [numeric](18, 2) NULL,
	[PatDivSecondPayment] [numeric](18, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
