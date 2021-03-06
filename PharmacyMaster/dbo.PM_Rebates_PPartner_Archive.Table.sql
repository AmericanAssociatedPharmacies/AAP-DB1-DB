USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_Rebates_PPartner_Archive]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_Rebates_PPartner_Archive](
	[period] [varchar](10) NULL,
	[date_start] [datetime] NULL,
	[date_end] [datetime] NULL,
	[pmid] [float] NULL,
	[ncpdp] [nvarchar](255) NULL,
	[storename] [nvarchar](255) NULL,
	[aapaccountno] [nvarchar](255) NULL,
	[udaccountno] [nvarchar](255) NULL,
	[Volume] [float] NULL,
	[Rebate] [float] NULL,
	[Payment] [float] NULL
) ON [PRIMARY]
GO
