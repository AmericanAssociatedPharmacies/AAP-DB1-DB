USE [ODSIntake]
GO
/****** Object:  Table [dbo].[BaseReferncedObjects_20200805]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaseReferncedObjects_20200805](
	[ServerName] [varchar](100) NULL,
	[BaseDbName] [varchar](100) NULL,
	[BaseSchemaObjectName] [varchar](100) NULL,
	[BaseObject] [varchar](100) NULL,
	[ReferencedDbName] [varchar](100) NULL,
	[ReferencedSchemaName] [varchar](100) NULL,
	[ReferencedObjectName] [varchar](100) NULL,
	[referenced_id] [int] NULL,
	[IsAmbigous] [bit] NULL
) ON [PRIMARY]
GO
