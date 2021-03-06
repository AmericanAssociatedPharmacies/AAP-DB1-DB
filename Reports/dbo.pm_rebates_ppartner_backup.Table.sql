USE [Reports]
GO
/****** Object:  Table [dbo].[pm_rebates_ppartner_backup]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pm_rebates_ppartner_backup](
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
