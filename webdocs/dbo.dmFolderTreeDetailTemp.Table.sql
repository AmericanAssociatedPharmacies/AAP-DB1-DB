USE [webdocs]
GO
/****** Object:  Table [dbo].[dmFolderTreeDetailTemp]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dmFolderTreeDetailTemp](
	[ParentKey] [char](64) NOT NULL,
	[ChildKey] [char](64) NOT NULL,
	[FolderTitle] [varchar](256) NULL
) ON [PRIMARY]
GO
