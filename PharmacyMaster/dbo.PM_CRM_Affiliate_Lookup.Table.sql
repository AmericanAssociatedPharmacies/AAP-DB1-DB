USE [PharmacyMaster]
GO
/****** Object:  Table [dbo].[PM_CRM_Affiliate_Lookup]    Script Date: 12/22/2020 4:45:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PM_CRM_Affiliate_Lookup](
	[RowID] [int] IDENTITY(1,1) NOT NULL,
	[PM] [varchar](25) NOT NULL,
	[CRM] [varchar](25) NOT NULL,
	[RowCreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PM_CRM_Affiliate_Lookup] ADD  DEFAULT (getdate()) FOR [RowCreatedDate]
GO
