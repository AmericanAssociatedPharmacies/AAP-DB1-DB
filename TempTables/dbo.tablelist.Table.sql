USE [TempTables]
GO
/****** Object:  Table [dbo].[tablelist]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tablelist](
	[DB] [sysname] NOT NULL,
	[Table] [sysname] NOT NULL,
	[object_id] [int] NOT NULL,
	[schema_id] [int] NOT NULL,
	[database_id] [int] NULL
) ON [PRIMARY]
GO
