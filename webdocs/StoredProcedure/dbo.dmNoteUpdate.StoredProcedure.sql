USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmNoteUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmNoteUpdate]
		@DocumentKey [char](36),
		@NoteKey [char](36),
		@GroupKey [char](36),
		@Note [text]
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE dmNote
				SET GroupKey = @GroupKey,Note = @Note
				WHERE DocumentKey = @DocumentKey AND NoteKey = @NoteKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmNoteUpdate : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
