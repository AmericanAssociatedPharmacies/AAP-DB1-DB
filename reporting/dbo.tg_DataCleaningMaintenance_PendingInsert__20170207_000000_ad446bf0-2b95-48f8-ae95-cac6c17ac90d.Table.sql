USE [reporting]
GO
/****** Object:  Table [dbo].[tg_DataCleaningMaintenance_PendingInsert__20170207_000000_ad446bf0-2b95-48f8-ae95-cac6c17ac90d]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tg_DataCleaningMaintenance_PendingInsert__20170207_000000_ad446bf0-2b95-48f8-ae95-cac6c17ac90d](
	[Company] [nvarchar](255) NULL,
	[Primary State/Prov# Code] [nvarchar](255) NULL,
	[Primary City] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
