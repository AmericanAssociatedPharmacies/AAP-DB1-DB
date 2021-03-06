USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PP_volRebate]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PP_volRebate](
	[acct_no] [varchar](5) NULL,
	[dt] [datetime] NULL,
	[old_vendor_id] [int] NULL,
	[vendor] [varchar](64) NULL,
	[reports] [varchar](1) NULL,
	[volume] [numeric](14, 2) NULL,
	[PMID] [int] NULL,
	[rebate] [numeric](14, 2) NULL,
	[vendorID] [int] NULL
) ON [PRIMARY]
GO
