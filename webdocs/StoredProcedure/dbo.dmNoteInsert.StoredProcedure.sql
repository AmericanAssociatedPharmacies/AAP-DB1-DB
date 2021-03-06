USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmNoteInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmNoteInsert]
		@DocumentKey [char](36),
		@UserKey [char](36),
		@GroupKey [char](36),
		@Note [text],
		@NoteKey [char](36) OUTPUT
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			SET @NoteKey = NEWID();

			INSERT INTO dmNote
				(DocumentKey,NoteKey, UserKey,GroupKey,Note)
				VALUES (@DocumentKey,@NoteKey, @UserKey, @GroupKey,@Note);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmNoteInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;
		RETURN(0);
	END;
GO
