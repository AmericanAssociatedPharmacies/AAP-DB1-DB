USE [PharmacyMaster]
GO
/****** Object:  Table [Staging].[PM_AffiliateHistory]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PM_AffiliateHistory](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [nvarchar](100) NULL,
	[GroupID] [int] NULL,
	[GroupName] [nvarchar](250) NULL,
	[new_affiliationstart] [date] NULL,
	[new_affiliationend] [date] NULL,
	[new_reason] [nvarchar](100) NULL,
	[statuscodename] [nvarchar](250) NULL,
	[RowCreatedDate] [datetime] NOT NULL,
 CONSTRAINT [CPK_Staging_PM_AffiliateHistory] PRIMARY KEY CLUSTERED 
(
	[RowID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Staging].[PM_AffiliateHistory] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
