USE [Reports]
GO
/****** Object:  Table [dbo].[import_API2010Q4]    Script Date: 12/22/2020 5:00:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_API2010Q4](
	[PMID] [nvarchar](255) NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Business Class] [nvarchar](255) NULL,
	[Rebate Administrator] [nvarchar](255) NULL,
	[API Generic Sales] [money] NULL,
	[API Brand Sales] [money] NULL,
	[API OTC Sales] [money] NULL,
	[API Whse Sales] [money] NULL,
	[API WHSE REBATE] [money] NULL,
	[Less Negative Rebates] [money] NULL,
	[Unpaid Finance Charges] [money] NULL,
	[Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Pay Account] [bit] NOT NULL,
	[Print Rebate Letter] [bit] NOT NULL,
	[Brand Credits Disbursed] [money] NULL,
	[Accelerated Pay Discount] [money] NULL
) ON [PRIMARY]
GO
