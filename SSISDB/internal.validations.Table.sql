USE [SSISDB]
GO
/****** Object:  Table [internal].[validations]    Script Date: 12/22/2020 5:17:15 AM ******/
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
ALTER TABLE [internal].[validations]  WITH CHECK ADD  CONSTRAINT [FK_Validations_ValidationId_Operations] FOREIGN KEY([validation_id])
REFERENCES [internal].[operations] ([operation_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[validations] CHECK CONSTRAINT [FK_Validations_ValidationId_Operations]
GO
