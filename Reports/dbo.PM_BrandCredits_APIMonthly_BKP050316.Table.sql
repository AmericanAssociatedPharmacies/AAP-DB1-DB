USE [Reports]
GO
/****** Object:  Table [dbo].[PM_BrandCredits_APIMonthly_BKP050316]    Script Date: 12/22/2020 5:00:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_BrandCredits_APIMonthly_BKP050316](
	[Date] [varchar](10) NULL,
	[PMID] [varchar](50) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[BrandCredits] [money] NULL,
	[Territory] [varchar](255) NULL,
	[BrandSales] [money] NULL
) ON [PRIMARY]
GO
