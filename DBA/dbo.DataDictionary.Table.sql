USE [DBA]
GO
/****** Object:  Table [dbo].[DataDictionary]    Script Date: 12/22/2020 4:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DataDictionary](
	[TABLE_CATALOG] [nvarchar](128) NULL,
	[TABLE_SCHEMA] [nvarchar](128) NULL,
	[TABLE_NAME] [sysname] NOT NULL,
	[COLUMN_NAME] [sysname] NULL,
	[ORDINAL_POSITION] [int] NULL,
	[COLUMN_DEFAULT] [nvarchar](4000) NULL,
	[IS_NULLABLE] [varchar](3) NULL,
	[DATA_TYPE] [nvarchar](128) NULL,
	[CHARACTER_MAXIMUM_LENGTH] [int] NULL,
	[CHARACTER_OCTET_LENGTH] [int] NULL,
	[NUMERIC_PRECISION] [tinyint] NULL,
	[NUMERIC_PRECISION_RADIX] [smallint] NULL,
	[NUMERIC_SCALE] [int] NULL,
	[DATETIME_PRECISION] [smallint] NULL,
	[CHARACTER_SET_CATALOG] [sysname] NULL,
	[CHARACTER_SET_SCHEMA] [sysname] NULL,
	[CHARACTER_SET_NAME] [sysname] NULL,
	[COLLATION_CATALOG] [sysname] NULL,
	[COLLATION_SCHEMA] [sysname] NULL,
	[COLLATION_NAME] [sysname] NULL,
	[DOMAIN_CATALOG] [sysname] NULL,
	[DOMAIN_SCHEMA] [sysname] NULL,
	[DOMAIN_NAME] [sysname] NULL
) ON [PRIMARY]
GO
