USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_AffiliateHistory_backup_20190925]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_AffiliateHistory_backup_20190925](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PMID] [int] NULL,
	[GroupID] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Reason] [varchar](max) NULL,
	[Created] [datetime] NOT NULL,
	[Modified] [datetime] NOT NULL,
	[RowVersion] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
