USE [ODSIntake]
GO
/****** Object:  Table [dbo].[TableIndexUsage]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableIndexUsage](
	[DbName] [varchar](100) NULL,
	[ObjectName] [varchar](100) NULL,
	[SchemaName] [varchar](100) NULL,
	[IndexName] [varchar](100) NULL,
	[index_id] [int] NOT NULL,
	[IndexSizeKB] [bigint] NULL,
	[user_seeks] [bigint] NULL,
	[user_scans] [bigint] NULL,
	[user_lookups] [bigint] NULL,
	[user_updates] [bigint] NULL,
	[last_user_seek] [datetime] NULL,
	[last_user_scan] [datetime] NULL,
	[last_user_lookup] [datetime] NULL,
	[last_user_update] [datetime] NULL
) ON [PRIMARY]
GO
