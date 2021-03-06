USE [webdocs]
GO
/****** Object:  View [dbo].[dmFolderTreeDetail]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

	CREATE VIEW [dbo].[dmFolderTreeDetail]
	AS
	SELECT dbo.dmFolderTree.ParentKey, dbo.dmFolderTree.ChildKey,
		dbo.dmFolder.FolderTitle
	FROM dbo.dmFolderTree INNER JOIN
		dbo.dmFolder ON
		dbo.dmFolderTree.ChildKey = dbo.dmFolder.FolderKey
GO
