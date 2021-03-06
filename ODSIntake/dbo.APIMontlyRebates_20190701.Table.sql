USE [ODSIntake]
GO
/****** Object:  Table [dbo].[APIMontlyRebates_20190701]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APIMontlyRebates_20190701](
	[Marker] [bit] NOT NULL,
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
	[Adjust for Promotions] [money] NULL,
	[Adjust for Returns] [money] NULL,
	[Adjust for Rebate Errors] [money] NULL,
	[Generic Admin Fee] [money] NULL,
	[20% Instant Rebate] [money] NULL,
	[Brand RX Monthly Credit] [money] NULL,
	[API WHSE REBATE for Payout] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Check Fee] [money] NULL,
	[Held Rebate] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Previous Month Held Rebate] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NOT NULL,
	[Accelerated Pay Discount] [money] NULL,
	[Avg Rebate Percentage] [float] NULL,
	[A/P Payment Mode] [nvarchar](255) NULL,
	[Post Ave Rebate %] [float] NULL,
	[Arete Rebate Fee] [money] NULL,
	[API Generic Sales Tier 1] [money] NULL,
	[API Generic Sales Tier 2] [money] NULL,
	[API Generic Rebate Tier 1] [money] NULL,
	[API Generic Rebate Tier 2] [money] NULL
) ON [PRIMARY]
GO
