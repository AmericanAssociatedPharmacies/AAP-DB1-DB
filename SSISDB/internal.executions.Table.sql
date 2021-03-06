USE [SSISDB]
GO
/****** Object:  Table [internal].[executions]    Script Date: 12/22/2020 5:17:15 AM ******/
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
ALTER TABLE [internal].[executions]  WITH CHECK ADD  CONSTRAINT [FK_Executions_ExecutionId_Operations] FOREIGN KEY([execution_id])
REFERENCES [internal].[operations] ([operation_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[executions] CHECK CONSTRAINT [FK_Executions_ExecutionId_Operations]
GO
