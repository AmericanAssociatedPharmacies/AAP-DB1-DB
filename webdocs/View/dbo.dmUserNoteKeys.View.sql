USE [webdocs]
GO
/****** Object:  View [dbo].[dmUserNoteKeys]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

	CREATE VIEW [dbo].[dmUserNoteKeys]
	AS
	SELECT DISTINCT
		dbo.dmMembership.UserKey AS AccessUserKey,
		dbo.dmNote.DocumentKey, dbo.dmNote.NoteKey
	FROM dbo.dmNote INNER JOIN
		dbo.dmMembership ON
		dbo.dmNote.GroupKey = dbo.dmMembership.GroupKey
GO
