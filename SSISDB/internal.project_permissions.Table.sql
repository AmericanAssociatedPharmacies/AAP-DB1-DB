USE [SSISDB]
GO
/****** Object:  Table [internal].[project_permissions]    Script Date: 12/22/2020 5:17:15 AM ******/
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
ALTER TABLE [internal].[project_permissions]  WITH CHECK ADD  CONSTRAINT [FK_ProjectPermissions_ObjectId_Projects] FOREIGN KEY([object_id])
REFERENCES [internal].[projects] ([project_id])
ON DELETE CASCADE
GO
ALTER TABLE [internal].[project_permissions] CHECK CONSTRAINT [FK_ProjectPermissions_ObjectId_Projects]
GO
ALTER TABLE [internal].[project_permissions]  WITH CHECK ADD  CONSTRAINT [CK_Project_PermissionType] CHECK  (([permission_type]=(4) OR [permission_type]=(3) OR [permission_type]=(2) OR [permission_type]=(1)))
GO
ALTER TABLE [internal].[project_permissions] CHECK CONSTRAINT [CK_Project_PermissionType]
GO
