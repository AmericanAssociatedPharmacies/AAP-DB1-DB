USE [PharmacyMaster]
GO
/****** Object:  Table [Staging].[PM_AnnualRebates_New]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_AnnualRebates_New](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Year] [varchar](4) NULL,
	[PMID] [int] NULL,
	[TM] [varchar](50) NULL,
	[APIAccountNo] [varchar](50) NULL,
	[AccountName] [varchar](4000) NULL,
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
	[MasonRebate] [numeric](18, 2) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_Staging_PM_AnnualRebates_New] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
