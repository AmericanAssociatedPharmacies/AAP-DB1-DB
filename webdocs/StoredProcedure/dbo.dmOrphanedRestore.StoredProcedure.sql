USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmOrphanedRestore]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmOrphanedRestore]
		@DocumentKey [char](36) OUTPUT,
		@FolderKey [char](36) OUTPUT
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE dmDocument
			SET FolderKey = @FolderKey
			WHERE DocumentKey = @DocumentKey;

			DELETE FROM dmDeletedDocuments
			WHERE DocumentKey = @DocumentKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmOrphanedRestore : Cannot restore document. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
