USE [webdocs]
GO
/****** Object:  View [dbo].[dmFolderTree]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

	CREATE VIEW [dbo].[dmFolderTree]
	AS
	SELECT Parent.[FolderKey] AS 'ParentKey',
		Child.[FolderKey] AS 'ChildKey'
	FROM [dbo].[dmFolder] AS Parent JOIN
			(SELECT Child1.[FolderKey], MAX(Parent1.SetLo)
				AS 'SetLo'
			FROM [dbo].[dmFolder] AS Parent1 CROSS JOIN
				[dbo].[dmFolder] AS Child1
			WHERE Child1.SetLo > Parent1.SetLo AND
				Child1.SetLo < Parent1.SetHi
			GROUP BY Child1.[FolderKey]) AS Child ON
		Parent.SetLo = Child.SetLo
GO
