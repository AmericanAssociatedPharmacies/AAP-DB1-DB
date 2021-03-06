USE [SSISDB]
GO
/****** Object:  Table [internal].[object_versions]    Script Date: 12/22/2020 5:17:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[object_versions](
	[object_version_lsn] [bigint] IDENTITY(1,1) NOT NULL,
	[object_id] [bigint] NOT NULL,
	[object_type] [smallint] NOT NULL,
	[description] [nvarchar](1024) NULL,
	[created_by] [nvarchar](128) NOT NULL,
	[created_time] [datetimeoffset](7) NOT NULL,
	[restored_by] [nvarchar](128) NULL,
	[last_restored_time] [datetimeoffset](7) NULL,
	[object_data] [varbinary](max) NOT NULL,
	[object_status] [char](1) NOT NULL,
 CONSTRAINT [PK_Object_Versions] PRIMARY KEY CLUSTERED 
(
	[object_version_lsn] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
