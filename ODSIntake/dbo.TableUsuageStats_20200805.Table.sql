USE [ODSIntake]
GO
/****** Object:  Table [dbo].[TableUsuageStats_20200805]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TableUsuageStats_20200805](
	[ServerName] [varchar](100) NULL,
	[DbName] [varchar](100) NULL,
	[SchemaName] [varchar](100) NULL,
	[ObjectName] [varchar](100) NULL,
	[Size] [bigint] NULL,
	[UserSeeks] [bigint] NULL,
	[UserScans] [bigint] NULL,
	[UserLookUps] [bigint] NULL,
	[UserUpdates] [bigint] NULL,
	[LastUserSeek] [datetime2](3) NULL,
	[LastUserScan] [datetime2](3) NULL,
	[LastUserLookup] [datetime2](3) NULL,
	[LastUserUpdate] [datetime2](3) NULL
) ON [PRIMARY]
GO
