USE [webdocs]
GO
/****** Object:  View [dbo].[dmUserNote]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

	CREATE VIEW [dbo].[dmUserNote]
	AS
	SELECT dbo.dmUserNoteKeys.AccessUserKey,
		dbo.dmNote.DocumentKey, dbo.dmNote.NoteKey,
		dbo.dmNote.GroupKey, dbo.dmNote.Note,
		dbo.dmNote.UserKey, dbo.dmNote.InsertDate
	FROM dbo.dmNote INNER JOIN
		dbo.dmUserNoteKeys ON
		dbo.dmNote.DocumentKey = dbo.dmUserNoteKeys.DocumentKey
			AND dbo.dmNote.NoteKey = dbo.dmUserNoteKeys.NoteKey
GO
