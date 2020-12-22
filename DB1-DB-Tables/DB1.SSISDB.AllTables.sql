USE [SSISDB]
GO
/****** Object:  Table [internal].[catalog_encryption_keys]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[catalog_encryption_keys](
	[key_id] [bigint] IDENTITY(1,1) NOT NULL,
	[key_name] [nvarchar](255) NOT NULL,
	[KEY] [varbinary](8000) NOT NULL,
	[IV] [varbinary](8000) NOT NULL,
 CONSTRAINT [PK_Encryption_Keys] PRIMARY KEY CLUSTERED 
(
	[key_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[catalog_properties]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[catalog_properties](
	[property_name] [nvarchar](256) NOT NULL,
	[property_value] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_ISServer_Property] PRIMARY KEY CLUSTERED 
(
	[property_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[data_type_mapping]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[data_type_mapping](
	[mapping_id] [bigint] IDENTITY(1,1) NOT NULL,
	[ssis_data_type] [nvarchar](128) NOT NULL,
	[sql_data_type] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Data_Type_Mapping] PRIMARY KEY CLUSTERED 
(
	[mapping_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_data_type_mapping] UNIQUE NONCLUSTERED 
(
	[ssis_data_type] ASC,
	[sql_data_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[environment_permissions]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[environment_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sid] [internal].[adt_sid] NOT NULL,
	[object_id] [bigint] NOT NULL,
	[permission_type] [smallint] NOT NULL,
	[is_role] [bit] NOT NULL,
	[is_deny] [bit] NOT NULL,
	[grantor_sid] [internal].[adt_sid] NOT NULL,
 CONSTRAINT [PK_Environment_Permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[environment_references]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[environment_references](
	[reference_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [bigint] NOT NULL,
	[reference_type] [char](1) NOT NULL,
	[environment_folder_name] [nvarchar](128) NULL,
	[environment_name] [sysname] NOT NULL,
	[validation_status] [char](1) NOT NULL,
	[last_validation_time] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_environment_references] PRIMARY KEY CLUSTERED 
(
	[reference_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[environment_variables]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[environment_variables](
	[variable_id] [bigint] IDENTITY(1,1) NOT NULL,
	[environment_id] [bigint] NOT NULL,
	[name] [sysname] NOT NULL,
	[description] [nvarchar](1024) NULL,
	[type] [nvarchar](128) NOT NULL,
	[sensitive] [bit] NOT NULL,
	[value] [sql_variant] NULL,
	[sensitive_value] [varbinary](max) NULL,
	[base_data_type] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Environment_Variables] PRIMARY KEY CLUSTERED 
(
	[variable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Environment_Variable] UNIQUE NONCLUSTERED 
(
	[environment_id] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[environments]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[environments](
	[environment_id] [bigint] IDENTITY(1,1) NOT NULL,
	[environment_name] [sysname] NOT NULL,
	[folder_id] [bigint] NOT NULL,
	[description] [nvarchar](1024) NULL,
	[created_by_sid] [varbinary](85) NOT NULL,
	[created_by_name] [nvarchar](128) NOT NULL,
	[created_time] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Environments] PRIMARY KEY CLUSTERED 
(
	[environment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Folder_Environment] UNIQUE NONCLUSTERED 
(
	[environment_name] ASC,
	[folder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[event_message_context]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[event_message_context](
	[context_id] [bigint] IDENTITY(1,1) NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[event_message_id] [bigint] NOT NULL,
	[context_depth] [int] NULL,
	[package_path] [nvarchar](max) NULL,
	[context_type] [smallint] NULL,
	[context_source_name] [nvarchar](4000) NULL,
	[context_source_id] [nvarchar](38) NULL,
	[property_name] [nvarchar](4000) NULL,
	[property_value] [sql_variant] NULL,
 CONSTRAINT [PK_Event_Message_Context] PRIMARY KEY CLUSTERED 
(
	[context_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[event_messages]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[event_messages](
	[event_message_id] [bigint] NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[execution_path] [nvarchar](max) NULL,
	[package_name] [nvarchar](260) NULL,
	[package_location_type] [nvarchar](128) NULL,
	[package_path_full] [nvarchar](4000) NULL,
	[event_name] [nvarchar](1024) NULL,
	[message_source_name] [nvarchar](4000) NULL,
	[message_source_id] [nvarchar](38) NULL,
	[subcomponent_name] [nvarchar](4000) NULL,
	[package_path] [nvarchar](max) NULL,
	[threadID] [int] NOT NULL,
	[message_code] [int] NULL,
 CONSTRAINT [PK_Event_Messages] PRIMARY KEY CLUSTERED 
(
	[event_message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[executable_statistics]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[executable_statistics](
	[statistics_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[executable_id] [bigint] NOT NULL,
	[execution_path] [nvarchar](max) NULL,
	[start_time] [datetimeoffset](7) NULL,
	[end_time] [datetimeoffset](7) NULL,
	[execution_hierarchy] [hierarchyid] NULL,
	[execution_duration] [int] NULL,
	[execution_result] [smallint] NULL,
	[execution_value] [sql_variant] NULL,
 CONSTRAINT [PK_Executable_statistics] PRIMARY KEY CLUSTERED 
(
	[statistics_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[executables]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[executables](
	[executable_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [bigint] NOT NULL,
	[project_version_lsn] [bigint] NOT NULL,
	[package_name] [nvarchar](260) NOT NULL,
	[package_location_type] [nvarchar](128) NULL,
	[package_path_full] [nvarchar](4000) NULL,
	[executable_name] [nvarchar](4000) NULL,
	[executable_guid] [nvarchar](38) NULL,
	[package_path] [nvarchar](max) NULL,
 CONSTRAINT [PK_Executables] PRIMARY KEY CLUSTERED 
(
	[executable_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[execution_component_phases]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[execution_component_phases](
	[phase_stats_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[package_name] [nvarchar](260) NOT NULL,
	[package_location_type] [nvarchar](128) NULL,
	[package_path_full] [nvarchar](4000) NULL,
	[task_name] [nvarchar](4000) NOT NULL,
	[subcomponent_name] [nvarchar](4000) NULL,
	[phase] [sysname] NOT NULL,
	[is_start] [bit] NULL,
	[phase_time] [datetimeoffset](7) NULL,
	[execution_path] [nvarchar](max) NULL,
	[sequence_id] [int] NULL,
 CONSTRAINT [PK_Execution_component_phases] PRIMARY KEY CLUSTERED 
(
	[phase_stats_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[execution_data_statistics]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[execution_data_statistics](
	[data_stats_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[package_name] [nvarchar](260) NOT NULL,
	[package_location_type] [nvarchar](128) NULL,
	[package_path_full] [nvarchar](4000) NULL,
	[task_name] [nvarchar](4000) NULL,
	[dataflow_path_id_string] [nvarchar](4000) NULL,
	[dataflow_path_name] [nvarchar](4000) NULL,
	[source_component_name] [nvarchar](4000) NULL,
	[destination_component_name] [nvarchar](4000) NULL,
	[rows_sent] [bigint] NULL,
	[created_time] [datetimeoffset](7) NULL,
	[execution_path] [nvarchar](max) NULL,
 CONSTRAINT [PK_Execution_data_statistics] PRIMARY KEY CLUSTERED 
(
	[data_stats_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[execution_data_taps]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[execution_data_taps](
	[data_tap_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[package_path] [nvarchar](max) NULL,
	[dataflow_path_id_string] [nvarchar](4000) NULL,
	[dataflow_task_guid] [uniqueidentifier] NULL,
	[max_rows] [int] NULL,
	[filename] [nvarchar](4000) NULL,
 CONSTRAINT [PK_Execution_data_taps] PRIMARY KEY CLUSTERED 
(
	[data_tap_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[execution_parameter_values]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[execution_parameter_values](
	[execution_parameter_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[object_type] [smallint] NOT NULL,
	[parameter_data_type] [nvarchar](128) NOT NULL,
	[parameter_name] [sysname] NOT NULL,
	[parameter_value] [sql_variant] NULL,
	[sensitive_parameter_value] [varbinary](max) NULL,
	[base_data_type] [nvarchar](128) NULL,
	[sensitive] [bit] NOT NULL,
	[required] [bit] NOT NULL,
	[value_set] [bit] NOT NULL,
	[runtime_override] [bit] NOT NULL,
 CONSTRAINT [PK_Execution_Parameter_value] PRIMARY KEY CLUSTERED 
(
	[execution_parameter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[execution_property_override_values]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[execution_property_override_values](
	[property_id] [bigint] IDENTITY(1,1) NOT NULL,
	[execution_id] [bigint] NOT NULL,
	[property_path] [nvarchar](4000) NOT NULL,
	[property_value] [nvarchar](max) NULL,
	[sensitive_property_value] [varbinary](max) NULL,
	[sensitive] [bit] NOT NULL,
 CONSTRAINT [PK_Execution_Property_Override_Value] PRIMARY KEY CLUSTERED 
(
	[property_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[executions]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[executions](
	[execution_id] [bigint] NOT NULL,
	[folder_name] [sysname] NOT NULL,
	[project_name] [sysname] NOT NULL,
	[package_name] [nvarchar](260) NOT NULL,
	[reference_id] [bigint] NULL,
	[reference_type] [char](1) NULL,
	[environment_folder_name] [nvarchar](128) NULL,
	[environment_name] [nvarchar](128) NULL,
	[project_lsn] [bigint] NULL,
	[executed_as_sid] [varbinary](85) NOT NULL,
	[executed_as_name] [nvarchar](128) NOT NULL,
	[use32bitruntime] [bit] NOT NULL,
 CONSTRAINT [PK_Executions] PRIMARY KEY CLUSTERED 
(
	[execution_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[extended_operation_info]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[extended_operation_info](
	[info_id] [bigint] IDENTITY(1,1) NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[object_name] [nvarchar](260) NOT NULL,
	[object_type] [smallint] NULL,
	[reference_id] [bigint] NULL,
	[status] [int] NOT NULL,
	[start_time] [datetimeoffset](7) NOT NULL,
	[end_time] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Operation_Info] PRIMARY KEY CLUSTERED 
(
	[info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[folder_permissions]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[folder_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sid] [internal].[adt_sid] NOT NULL,
	[object_id] [bigint] NOT NULL,
	[permission_type] [smallint] NOT NULL,
	[is_role] [bit] NOT NULL,
	[is_deny] [bit] NOT NULL,
	[grantor_sid] [internal].[adt_sid] NOT NULL,
 CONSTRAINT [PK_Folder_Permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[folders]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[folders](
	[folder_id] [bigint] IDENTITY(1,1) NOT NULL,
	[name] [sysname] NOT NULL,
	[description] [nvarchar](1024) NULL,
	[created_by_sid] [varbinary](85) NOT NULL,
	[created_by_name] [nvarchar](128) NOT NULL,
	[created_time] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Folders] PRIMARY KEY CLUSTERED 
(
	[folder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[object_parameters]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[object_parameters](
	[parameter_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_id] [bigint] NOT NULL,
	[project_version_lsn] [bigint] NOT NULL,
	[object_type] [smallint] NOT NULL,
	[object_name] [nvarchar](260) NOT NULL,
	[parameter_name] [sysname] NOT NULL,
	[parameter_data_type] [nvarchar](128) NOT NULL,
	[required] [bit] NOT NULL,
	[sensitive] [bit] NOT NULL,
	[description] [nvarchar](1024) NULL,
	[design_default_value] [sql_variant] NULL,
	[default_value] [sql_variant] NULL,
	[sensitive_default_value] [varbinary](max) NULL,
	[base_data_type] [nvarchar](128) NULL,
	[value_type] [char](1) NOT NULL,
	[value_set] [bit] NOT NULL,
	[referenced_variable_name] [nvarchar](128) NULL,
	[validation_status] [char](1) NOT NULL,
	[last_validation_time] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Object_Parameters] PRIMARY KEY CLUSTERED 
(
	[parameter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[object_versions]    Script Date: 12/22/2020 3:49:49 AM ******/
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
/****** Object:  Table [internal].[operation_messages]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[operation_messages](
	[operation_message_id] [bigint] IDENTITY(1,1) NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[message_time] [datetimeoffset](7) NOT NULL,
	[message_type] [smallint] NOT NULL,
	[message_source_type] [smallint] NULL,
	[message] [nvarchar](max) NULL,
	[extended_info_id] [bigint] NULL,
 CONSTRAINT [PK_Operation_Messages] PRIMARY KEY CLUSTERED 
(
	[operation_message_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[operation_os_sys_info]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[operation_os_sys_info](
	[info_id] [bigint] IDENTITY(1,1) NOT NULL,
	[operation_id] [bigint] NOT NULL,
	[total_physical_memory_kb] [bigint] NOT NULL,
	[available_physical_memory_kb] [bigint] NULL,
	[total_page_file_kb] [bigint] NULL,
	[available_page_file_kb] [bigint] NOT NULL,
	[cpu_count] [int] NOT NULL,
 CONSTRAINT [PK_Operation_Os_Sys_Info] PRIMARY KEY CLUSTERED 
(
	[info_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[operation_permissions]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[operation_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sid] [internal].[adt_sid] NOT NULL,
	[object_id] [bigint] NOT NULL,
	[permission_type] [smallint] NOT NULL,
	[is_role] [bit] NOT NULL,
	[is_deny] [bit] NOT NULL,
	[grantor_sid] [internal].[adt_sid] NOT NULL,
 CONSTRAINT [PK_Operation_Permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[operations]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[operations](
	[operation_id] [bigint] IDENTITY(1,1) NOT NULL,
	[operation_type] [smallint] NOT NULL,
	[created_time] [datetimeoffset](7) NULL,
	[object_type] [smallint] NULL,
	[object_id] [bigint] NULL,
	[object_name] [nvarchar](260) NULL,
	[status] [int] NOT NULL,
	[start_time] [datetimeoffset](7) NULL,
	[end_time] [datetimeoffset](7) NULL,
	[caller_sid] [varbinary](85) NOT NULL,
	[caller_name] [sysname] NOT NULL,
	[process_id] [int] NULL,
	[stopped_by_sid] [varbinary](85) NULL,
	[stopped_by_name] [nvarchar](128) NULL,
	[operation_guid] [uniqueidentifier] NULL,
	[server_name] [nvarchar](128) NULL,
	[machine_name] [nvarchar](128) NULL,
 CONSTRAINT [PK_Operations] PRIMARY KEY CLUSTERED 
(
	[operation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[packages]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[packages](
	[package_id] [bigint] IDENTITY(1,1) NOT NULL,
	[project_version_lsn] [bigint] NOT NULL,
	[name] [nvarchar](260) NOT NULL,
	[package_guid] [uniqueidentifier] NOT NULL,
	[description] [nvarchar](1024) NULL,
	[package_format_version] [int] NOT NULL,
	[version_major] [int] NOT NULL,
	[version_minor] [int] NOT NULL,
	[version_build] [int] NOT NULL,
	[version_comments] [nvarchar](1024) NULL,
	[version_guid] [uniqueidentifier] NOT NULL,
	[project_id] [bigint] NOT NULL,
	[entry_point] [bit] NOT NULL,
	[validation_status] [char](1) NOT NULL,
	[last_validation_time] [datetimeoffset](7) NULL,
	[package_data] [varbinary](max) NULL,
 CONSTRAINT [PK_Packages] PRIMARY KEY CLUSTERED 
(
	[package_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [internal].[project_permissions]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[project_permissions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[sid] [internal].[adt_sid] NOT NULL,
	[object_id] [bigint] NOT NULL,
	[permission_type] [smallint] NOT NULL,
	[is_role] [bit] NOT NULL,
	[is_deny] [bit] NOT NULL,
	[grantor_sid] [internal].[adt_sid] NOT NULL,
 CONSTRAINT [PK_Project_Permissions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[projects]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[projects](
	[project_id] [bigint] IDENTITY(1,1) NOT NULL,
	[folder_id] [bigint] NOT NULL,
	[name] [sysname] NOT NULL,
	[description] [nvarchar](1024) NULL,
	[project_format_version] [int] NULL,
	[deployed_by_sid] [varbinary](85) NOT NULL,
	[deployed_by_name] [nvarchar](128) NOT NULL,
	[last_deployed_time] [datetimeoffset](7) NOT NULL,
	[created_time] [datetimeoffset](7) NOT NULL,
	[object_version_lsn] [bigint] NOT NULL,
	[validation_status] [char](1) NOT NULL,
	[last_validation_time] [datetimeoffset](7) NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[project_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Unique_Project_FolderName] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[folder_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [internal].[validations]    Script Date: 12/22/2020 3:49:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [internal].[validations](
	[validation_id] [bigint] NOT NULL,
	[environment_scope] [char](1) NOT NULL,
	[validate_type] [char](1) NOT NULL,
	[folder_name] [sysname] NOT NULL,
	[project_name] [sysname] NOT NULL,
	[project_lsn] [bigint] NULL,
	[use32bitruntime] [bit] NULL,
	[reference_id] [bigint] NULL,
 CONSTRAINT [PK_Validations] PRIMARY KEY CLUSTERED 
(
	[validation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [internal].[environment_permissions]  WITH CHECK ADD  CONSTRAINT [FK_EnvironmentPermissions_ObjectId_Environments] FOREIGN KEY([object_id])
REFERENCES [internal].[environments] ([environment_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[environment_permissions] CHECK CONSTRAINT [FK_EnvironmentPermissions_ObjectId_Environments]
GO
ALTER TABLE [internal].[environment_references]  WITH CHECK ADD  CONSTRAINT [FK_ProjectEnvironment_ProjectId_Projects] FOREIGN KEY([project_id])
REFERENCES [internal].[projects] ([project_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[environment_references] CHECK CONSTRAINT [FK_ProjectEnvironment_ProjectId_Projects]
GO
ALTER TABLE [internal].[environment_variables]  WITH CHECK ADD  CONSTRAINT [FK_EnvironmentVariables_EnvironmentId_Environments] FOREIGN KEY([environment_id])
REFERENCES [internal].[environments] ([environment_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[environment_variables] CHECK CONSTRAINT [FK_EnvironmentVariables_EnvironmentId_Environments]
GO
ALTER TABLE [internal].[environments]  WITH CHECK ADD  CONSTRAINT [FK_Environments_FolderId_Folders] FOREIGN KEY([folder_id])
REFERENCES [internal].[folders] ([folder_id])
GO
ALTER TABLE [internal].[environments] CHECK CONSTRAINT [FK_Environments_FolderId_Folders]
GO
ALTER TABLE [internal].[event_message_context]  WITH CHECK ADD  CONSTRAINT [FK_EventMessageContext_EventMessageId_EventMessages] FOREIGN KEY([event_message_id])
REFERENCES [internal].[event_messages] ([event_message_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[event_message_context] CHECK CONSTRAINT [FK_EventMessageContext_EventMessageId_EventMessages]
GO
ALTER TABLE [internal].[event_message_context]  WITH CHECK ADD  CONSTRAINT [FK_EventMessagecontext_Operations] FOREIGN KEY([operation_id])
REFERENCES [internal].[operations] ([operation_id])
GO
ALTER TABLE [internal].[event_message_context] CHECK CONSTRAINT [FK_EventMessagecontext_Operations]
GO
ALTER TABLE [internal].[event_messages]  WITH CHECK ADD  CONSTRAINT [FK_EventMessage_Operations] FOREIGN KEY([operation_id])
REFERENCES [internal].[operations] ([operation_id])
GO
ALTER TABLE [internal].[event_messages] CHECK CONSTRAINT [FK_EventMessage_Operations]
GO
ALTER TABLE [internal].[event_messages]  WITH CHECK ADD  CONSTRAINT [FK_EventMessages_OperationMessageId_OperationMessage] FOREIGN KEY([event_message_id])
REFERENCES [internal].[operation_messages] ([operation_message_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[event_messages] CHECK CONSTRAINT [FK_EventMessages_OperationMessageId_OperationMessage]
GO
ALTER TABLE [internal].[executable_statistics]  WITH CHECK ADD  CONSTRAINT [FK_ExecutableStatistics_ExecutableId_Executables] FOREIGN KEY([executable_id])
REFERENCES [internal].[executables] ([executable_id])
GO
ALTER TABLE [internal].[executable_statistics] CHECK CONSTRAINT [FK_ExecutableStatistics_ExecutableId_Executables]
GO
ALTER TABLE [internal].[executable_statistics]  WITH CHECK ADD  CONSTRAINT [FK_ExecutableStatistics_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[executable_statistics] CHECK CONSTRAINT [FK_ExecutableStatistics_ExecutionId_Executions]
GO
ALTER TABLE [internal].[execution_component_phases]  WITH CHECK ADD  CONSTRAINT [FK_ExecCompPhases_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[execution_component_phases] CHECK CONSTRAINT [FK_ExecCompPhases_ExecutionId_Executions]
GO
ALTER TABLE [internal].[execution_data_statistics]  WITH CHECK ADD  CONSTRAINT [FK_ExecDataStat_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[execution_data_statistics] CHECK CONSTRAINT [FK_ExecDataStat_ExecutionId_Executions]
GO
ALTER TABLE [internal].[execution_data_taps]  WITH CHECK ADD  CONSTRAINT [FK_ExecDataTaps_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[execution_data_taps] CHECK CONSTRAINT [FK_ExecDataTaps_ExecutionId_Executions]
GO
ALTER TABLE [internal].[execution_parameter_values]  WITH CHECK ADD  CONSTRAINT [FK_ExecutionParameterValue_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[execution_parameter_values] CHECK CONSTRAINT [FK_ExecutionParameterValue_ExecutionId_Executions]
GO
ALTER TABLE [internal].[execution_property_override_values]  WITH CHECK ADD  CONSTRAINT [FK_ExecutionPropertyOverrideValue_ExecutionId_Executions] FOREIGN KEY([execution_id])
REFERENCES [internal].[executions] ([execution_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[execution_property_override_values] CHECK CONSTRAINT [FK_ExecutionPropertyOverrideValue_ExecutionId_Executions]
GO
ALTER TABLE [internal].[executions]  WITH CHECK ADD  CONSTRAINT [FK_Executions_ExecutionId_Operations] FOREIGN KEY([execution_id])
REFERENCES [internal].[operations] ([operation_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[executions] CHECK CONSTRAINT [FK_Executions_ExecutionId_Operations]
GO
ALTER TABLE [internal].[extended_operation_info]  WITH CHECK ADD  CONSTRAINT [FK_OperationInfo_Operations] FOREIGN KEY([operation_id])
REFERENCES [internal].[operations] ([operation_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[extended_operation_info] CHECK CONSTRAINT [FK_OperationInfo_Operations]
GO
ALTER TABLE [internal].[folder_permissions]  WITH CHECK ADD  CONSTRAINT [FK_FolderPermissions_ObjectId_Folders] FOREIGN KEY([object_id])
REFERENCES [internal].[folders] ([folder_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[folder_permissions] CHECK CONSTRAINT [FK_FolderPermissions_ObjectId_Folders]
GO
ALTER TABLE [internal].[object_parameters]  WITH CHECK ADD  CONSTRAINT [FK_ObjectParameters_ProjectId_Projects] FOREIGN KEY([project_id])
REFERENCES [internal].[projects] ([project_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[object_parameters] CHECK CONSTRAINT [FK_ObjectParameters_ProjectId_Projects]
GO
ALTER TABLE [internal].[object_parameters]  WITH CHECK ADD  CONSTRAINT [FK_ObjectParameters_ProjectVersionLsn_ObjectVersions] FOREIGN KEY([project_version_lsn])
REFERENCES [internal].[object_versions] ([object_version_lsn])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[object_parameters] CHECK CONSTRAINT [FK_ObjectParameters_ProjectVersionLsn_ObjectVersions]
GO
ALTER TABLE [internal].[operation_messages]  WITH CHECK ADD  CONSTRAINT [FK_OperationMessages_OperationId_Operations] FOREIGN KEY([operation_id])
REFERENCES [internal].[operations] ([operation_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[operation_messages] CHECK CONSTRAINT [FK_OperationMessages_OperationId_Operations]
GO
ALTER TABLE [internal].[operation_os_sys_info]  WITH CHECK ADD  CONSTRAINT [FK_OssysInfo_Operations] FOREIGN KEY([operation_id])
REFERENCES [internal].[operations] ([operation_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[operation_os_sys_info] CHECK CONSTRAINT [FK_OssysInfo_Operations]
GO
ALTER TABLE [internal].[operation_permissions]  WITH CHECK ADD  CONSTRAINT [FK_OperationPermissions_ObjectId_Operations] FOREIGN KEY([object_id])
REFERENCES [internal].[operations] ([operation_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[operation_permissions] CHECK CONSTRAINT [FK_OperationPermissions_ObjectId_Operations]
GO
ALTER TABLE [internal].[packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_ProjectId_Projects] FOREIGN KEY([project_id])
REFERENCES [internal].[projects] ([project_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[packages] CHECK CONSTRAINT [FK_Packages_ProjectId_Projects]
GO
ALTER TABLE [internal].[packages]  WITH CHECK ADD  CONSTRAINT [FK_Packages_ProjectVersionLsn_ObjectVersions] FOREIGN KEY([project_version_lsn])
REFERENCES [internal].[object_versions] ([object_version_lsn])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[packages] CHECK CONSTRAINT [FK_Packages_ProjectVersionLsn_ObjectVersions]
GO
ALTER TABLE [internal].[project_permissions]  WITH CHECK ADD  CONSTRAINT [FK_ProjectPermissions_ObjectId_Projects] FOREIGN KEY([object_id])
REFERENCES [internal].[projects] ([project_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[project_permissions] CHECK CONSTRAINT [FK_ProjectPermissions_ObjectId_Projects]
GO
ALTER TABLE [internal].[projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_FolderId_Folders] FOREIGN KEY([folder_id])
REFERENCES [internal].[folders] ([folder_id])
GO
ALTER TABLE [internal].[projects] CHECK CONSTRAINT [FK_Projects_FolderId_Folders]
GO
ALTER TABLE [internal].[validations]  WITH CHECK ADD  CONSTRAINT [FK_Validations_ValidationId_Operations] FOREIGN KEY([validation_id])
REFERENCES [internal].[operations] ([operation_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[validations] CHECK CONSTRAINT [FK_Validations_ValidationId_Operations]
GO
ALTER TABLE [internal].[environment_permissions]  WITH CHECK ADD  CONSTRAINT [CK_Environment_PermissionType] CHECK  (([permission_type]=(4) OR [permission_type]=(2) OR [permission_type]=(1)))
GO
ALTER TABLE [internal].[environment_permissions] CHECK CONSTRAINT [CK_Environment_PermissionType]
GO
ALTER TABLE [internal].[folder_permissions]  WITH CHECK ADD  CONSTRAINT [CK_Folder_PermissionType] CHECK  (([permission_type]=(104) OR [permission_type]=(103) OR [permission_type]=(102) OR [permission_type]=(101) OR [permission_type]=(100) OR [permission_type]=(4) OR [permission_type]=(2) OR [permission_type]=(1)))
GO
ALTER TABLE [internal].[folder_permissions] CHECK CONSTRAINT [CK_Folder_PermissionType]
GO
ALTER TABLE [internal].[operation_permissions]  WITH CHECK ADD  CONSTRAINT [CK_Operation_PermissionType] CHECK  (([permission_type]=(4) OR [permission_type]=(2) OR [permission_type]=(1)))
GO
ALTER TABLE [internal].[operation_permissions] CHECK CONSTRAINT [CK_Operation_PermissionType]
GO
ALTER TABLE [internal].[project_permissions]  WITH CHECK ADD  CONSTRAINT [CK_Project_PermissionType] CHECK  (([permission_type]=(4) OR [permission_type]=(3) OR [permission_type]=(2) OR [permission_type]=(1)))
GO
ALTER TABLE [internal].[project_permissions] CHECK CONSTRAINT [CK_Project_PermissionType]
GO
