USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_BrandCredits_APIMonthly_New]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_BrandCredits_APIMonthly_New](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[Date] [varchar](10) NULL,
	[PMID] [varchar](50) NULL,
	[APIAccountNo] [varchar](255) NULL,
	[AccountName] [varchar](255) NULL,
	[BrandCredits] [money] NULL,
	[Territory] [varchar](255) NULL,
	[BrandSales] [money] NULL,
	[ACH] [bit] NULL,
	[PayTerms] [varchar](255) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
	[RowUpdatedDate] [datetime] NULL,
	[RowversionID] [timestamp] NOT NULL,
 CONSTRAINT [CPK_PM_BrandCredits_APIMonthly_New] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_BrandCredits_APIMonthly_New] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
