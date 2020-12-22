USE [TempTables]
GO
/****** Object:  Table [dbo].[backup_deleteAfter080911_PM_Geocode]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[backup_deleteAfter080911_PM_Geocode](
	[pmid] [int] NOT NULL,
	[GAddress] [varchar](255) NULL,
	[Latitude] [float] NULL,
	[Longitude] [float] NULL,
	[Updated] [datetime] NULL,
	[pm_address_type] [int] NOT NULL
) ON [PRIMARY]
GO
