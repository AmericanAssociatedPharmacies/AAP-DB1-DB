USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[rebate_PPartner4Q2010]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rebate_PPartner4Q2010](
	[pmid] [float] NULL,
	[ncpdp] [nvarchar](255) NULL,
	[storename] [nvarchar](255) NULL,
	[udaccountno] [nvarchar](255) NULL,
	[aapaccountno] [nvarchar](255) NULL,
	[Volume] [float] NULL,
	[Rebate] [float] NULL,
	[payment] [float] NULL
) ON [PRIMARY]
GO
