USE [TempTables]
GO
/****** Object:  Table [dbo].[foo]    Script Date: 12/22/2020 5:19:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[foo](
	[db] [varchar](29) NOT NULL,
	[name] [nvarchar](128) NOT NULL,
	[object_id] [int] NOT NULL,
	[principal_id] [int] NULL,
	[schema_id] [int] NOT NULL,
	[parent_object_id] [int] NOT NULL,
	[type] [char](2) NOT NULL,
	[type_desc] [nvarchar](60) NULL,
	[create_date] [datetime] NOT NULL,
	[modify_date] [datetime] NOT NULL,
	[is_ms_shipped] [bit] NOT NULL,
	[is_published] [bit] NOT NULL,
	[is_schema_published] [bit] NOT NULL,
	[lob_data_space_id] [int] NULL,
	[filestream_data_space_id] [int] NULL,
	[max_column_id_used] [int] NOT NULL,
	[lock_on_bulk_load] [bit] NOT NULL,
	[uses_ansi_nulls] [bit] NULL,
	[is_replicated] [bit] NULL,
	[has_replication_filter] [bit] NULL,
	[is_merge_published] [bit] NULL,
	[is_sync_tran_subscribed] [bit] NULL,
	[has_unchecked_assembly_data] [bit] NOT NULL,
	[text_in_row_limit] [int] NULL,
	[large_value_types_out_of_row] [bit] NULL
) ON [PRIMARY]
GO
