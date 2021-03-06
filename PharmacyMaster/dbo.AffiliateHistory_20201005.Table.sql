USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[AffiliateHistory_20201005]    Script Date: 12/22/2020 4:45:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AffiliateHistory_20201005](
	[PMID] [nvarchar](100) NULL,
	[GroupName] [nvarchar](250) NULL,
	[new_affiliationstart] [date] NULL,
	[new_affiliationend] [date] NULL,
	[new_reason] [nvarchar](100) NULL,
	[statuscodename] [nvarchar](250) NULL
) ON [PRIMARY]
GO
