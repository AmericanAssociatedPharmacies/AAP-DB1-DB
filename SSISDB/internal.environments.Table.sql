USE [SSISDB]
GO
/****** Object:  Table [internal].[environments]    Script Date: 12/22/2020 5:17:15 AM ******/
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
ALTER TABLE [internal].[environments]  WITH CHECK ADD  CONSTRAINT [FK_Environments_FolderId_Folders] FOREIGN KEY([folder_id])
REFERENCES [internal].[folders] ([folder_id])
GO
ALTER TABLE [internal].[environments] CHECK CONSTRAINT [FK_Environments_FolderId_Folders]
GO
