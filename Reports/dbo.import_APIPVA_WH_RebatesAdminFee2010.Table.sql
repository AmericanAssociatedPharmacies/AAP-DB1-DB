USE [Reports]
GO
/****** Object:  Table [dbo].[import_APIPVA_WH_RebatesAdminFee2010]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[import_APIPVA_WH_RebatesAdminFee2010](
	[Timeframe] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[API Acct#] [nvarchar](255) NULL,
	[Pharmacy Name] [nvarchar](255) NULL,
	[Business Class] [nvarchar](255) NULL,
	[Rebate Administrator] [nvarchar](255) NULL,
	[Net Rebate to Pay Acct/Admin] [money] NULL,
	[Less Group Admin] [money] NULL,
	[Net Rebate to Store] [money] NULL,
	[Cardinal Program Rebate] [money] NULL,
	[API Program Rebate] [money] NULL
) ON [PRIMARY]
GO
