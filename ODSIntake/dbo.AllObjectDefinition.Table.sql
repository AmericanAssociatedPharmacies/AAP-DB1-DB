USE [ODSIntake]
GO
/****** Object:  Table [dbo].[AllObjectDefinition]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AllObjectDefinition](
	[ServerName] [varchar](100) NULL,
	[DbName] [varchar](100) NULL,
	[ObjectName] [varchar](255) NULL,
	[ObjectDefinition] [varchar](8000) NULL
) ON [PRIMARY]
GO
