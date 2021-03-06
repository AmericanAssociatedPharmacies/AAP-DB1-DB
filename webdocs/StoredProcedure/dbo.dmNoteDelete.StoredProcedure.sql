USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmNoteDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmNoteDelete]
		@DocumentKey [char](36),
		@NoteKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;

		SET NOCOUNT ON;

		DELETE FROM dmNote
			WHERE DocumentKey = @DocumentKey AND NoteKey = @NoteKey;

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmNoteDelete : Cannot delete record. ',100,1);
			ROLLBACK TRAN;
			RETURN(1);
		END;

		COMMIT TRANSACTION;
		RETURN(0);
	END;
GO
