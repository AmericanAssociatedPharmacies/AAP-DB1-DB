USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Rebates_APIQuarterly_Archive2010]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_APIQuarterly_Archive2010](
	[period] [varchar](10) NULL,
	[date_start] [datetime] NULL,
	[date_end] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[Pay Account] [bit] NOT NULL,
	[Gross Qtr Rebate] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Leader Net Rebate] [money] NULL,
	[Net Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Qtr Rebate to Store] [money] NULL,
	[Cardinal Program Rebate] [money] NULL,
	[API Program Rebate] [money] NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Primary CA#] [nvarchar](255) NULL,
	[CA Division] [nvarchar](255) NULL,
	[Grand Total Purchases] [money] NULL,
	[Total Cardinal Sales] [money] NULL,
	[Cardinal Non-Net Sales] [money] NULL,
	[Vol Admin Fee] [money] NULL,
	[CA Brand Sales] [money] NULL,
	[CA Generic Contract Sales] [money] NULL,
	[CA Generic Rebate] [money] NULL,
	[CA Rebate to Pay out] [money] NULL,
	[API ADMIN FEE] [money] NULL,
	[API -TO PAY Cardinal Side-NO P2] [money] NULL,
	[CA-P2P3 SALES] [money] NULL,
	[CA-P2P3 REBATES] [money] NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Whse Sales] [money] NULL,
	[API WHSE REBATE] [money] NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[ECOG] [float] NULL,
	[Donepezil Rebate] [money] NULL,
	[Avg Rebate Percentage] [float] NULL
) ON [PRIMARY]
GO
