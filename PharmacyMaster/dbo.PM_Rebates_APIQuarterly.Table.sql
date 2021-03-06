USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Rebates_APIQuarterly]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_APIQuarterly](
	[Period] [varchar](10) NOT NULL,
	[date_start] [datetime] NULL,
	[date_end] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Business Class] [nvarchar](255) NULL,
	[Rebate Administrator] [nvarchar](255) NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Total Whse Sales] [money] NULL,
	[API Whse Gross Rebate] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Donepezil Rebate on Sales out] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NOT NULL,
	[Print Rebate Letter] [bit] NOT NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Brand Credit Potential] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[Adjust for Returns] [money] NULL,
	[Adjust for Promotions] [money] NULL,
	[Adjust for Rebate Errors] [money] NULL
) ON [PRIMARY]
GO
