USE [TempTables]
GO
/****** Object:  Table [dbo].[PM_Rebates_APIMonthly_20171024]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_APIMonthly_20171024](
	[Date] [datetime] NULL,
	[PMID] [nvarchar](255) NULL,
	[APIAccountNo] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Business Class] [nvarchar](255) NULL,
	[Rebate Administrator] [nvarchar](255) NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Total Whse Sales] [money] NULL,
	[API Whse Gross Rebate] [money] NULL,
	[Adjust for Promotions] [money] NULL,
	[Adjust for Returns] [money] NULL,
	[Adjust for Rebate Errors] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Check Fee] [money] NULL,
	[Held Rebate] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NULL,
	[Print Rebate Letter] [bit] NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Previous Month Held Rebate] [money] NULL,
	[PostAveRebatePerc] [nvarchar](255) NULL,
	[True10Sales] [money] NULL,
	[True10Rebate] [money] NULL,
	[AreteRebateFee] [money] NULL
) ON [PRIMARY]
GO
