USE [webdocs]
GO
/****** Object:  View [dbo].[dmFolderTreeStart]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[dmFolderTreeStart]
	AS
	SELECT DISTINCT FolderKey AS ParentKey
	FROM dmFolder
	WHERE SetLo = 1
GO
