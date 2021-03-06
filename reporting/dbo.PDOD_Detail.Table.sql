USE [reporting]
GO
/****** Object:  Table [dbo].[PDOD_Detail]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDOD_Detail](
	[acct_no] [nvarchar](4) NULL,
	[vendor_id] [int] NULL,
	[vendorpair] [int] NULL,
	[vendor] [nvarchar](64) NULL,
	[volume] [float] NULL,
	[rebate] [float] NULL,
	[WSVolume] [float] NULL,
	[WSAdminFees] [float] NULL,
	[GenRebate] [float] NULL,
	[CRFactor] [float] NULL,
	[CR90] [float] NULL
) ON [PRIMARY]
GO
