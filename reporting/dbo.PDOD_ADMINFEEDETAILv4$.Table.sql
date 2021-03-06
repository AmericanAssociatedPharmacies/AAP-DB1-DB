USE [reporting]
GO
/****** Object:  Table [dbo].[PDOD_ADMINFEEDETAILv4$]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PDOD_ADMINFEEDETAILv4$](
	[acct_no] [nvarchar](255) NULL,
	[vendor_id] [float] NULL,
	[vendorpair] [float] NULL,
	[vendor] [nvarchar](255) NULL,
	[volume] [float] NULL,
	[rebate] [float] NULL,
	[basispoints] [float] NULL,
	[MemberStatus] [nvarchar](255) NULL,
	[PercentageOfTotal] [nvarchar](255) NULL,
	[PMID] [nvarchar](255) NULL,
	[AAPeffective] [nvarchar](255) NULL,
	[AAPQuit] [nvarchar](255) NULL,
	[UDEffective] [datetime] NULL,
	[UDQuit] [datetime] NULL,
	[AAPID] [nvarchar](255) NULL,
	[AAPParent] [nvarchar](255) NULL,
	[MonthsPaidFor] [float] NULL
) ON [PRIMARY]
GO
