USE [AAP]
GO
/****** Object:  Table [dbo].[AAPColumnInfo]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AAPColumnInfo](
	[column_name] [sysname] NULL,
	[table_catalog] [nvarchar](128) NULL,
	[table_name] [sysname] NOT NULL,
	[data_type] [nvarchar](128) NULL,
	[character_maximum_length] [int] NULL,
	[numeric_precision] [tinyint] NULL,
	[display_name] [nvarchar](128) NULL,
	[source] [nvarchar](128) NULL,
	[description] [nvarchar](256) NULL,
	[comments] [nvarchar](256) NULL
) ON [PRIMARY]
GO
