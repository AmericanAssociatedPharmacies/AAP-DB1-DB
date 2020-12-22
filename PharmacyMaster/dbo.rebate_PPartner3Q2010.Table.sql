USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[rebate_PPartner3Q2010]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rebate_PPartner3Q2010](
	[pmid] [int] NULL,
	[ncpdp] [nvarchar](10) NULL,
	[storename] [nvarchar](255) NULL,
	[udaccountno] [float] NULL,
	[aapaccountno] [float] NULL,
	[volume] [float] NULL,
	[rebate] [float] NULL,
	[payment] [float] NULL
) ON [PRIMARY]
GO
