USE [webdocs]
GO
/****** Object:  Table [dbo].[dmPermissions]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmPermissions](
	[RequestorKey] [char](36) NOT NULL,
	[WebDocsObjectKey] [char](36) NOT NULL,
	[PermissionName] [varchar](64) NOT NULL,
	[PermissionStatus] [varchar](64) NOT NULL,
 CONSTRAINT [PK_dmPermissions] PRIMARY KEY NONCLUSTERED 
(
	[RequestorKey] ASC,
	[WebDocsObjectKey] ASC,
	[PermissionName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
