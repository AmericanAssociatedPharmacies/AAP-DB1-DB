USE [reporting]
GO
/****** Object:  Table [dbo].[tg_DataCleaningMaintenance_PendingDelete__20170207_000000_5ccc3970-89b5-4865-bc37-13e770b3b334]    Script Date: 12/22/2020 4:58:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tg_DataCleaningMaintenance_PendingDelete__20170207_000000_5ccc3970-89b5-4865-bc37-13e770b3b334](
	[Company] [nvarchar](255) NULL,
	[Primary State/Prov# Code] [nvarchar](255) NULL,
	[Primary City] [nvarchar](255) NULL,
	[Last Name] [nvarchar](255) NULL,
	[First Name] [nvarchar](255) NULL
) ON [PRIMARY]
GO
