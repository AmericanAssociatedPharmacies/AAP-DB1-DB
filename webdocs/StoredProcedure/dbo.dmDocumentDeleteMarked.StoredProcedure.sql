USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentDeleteMarked]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentDeleteMarked]
		@DocumentKey [char](36),
		@FolderKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			-- Remove folder value, and set [NeedsKeyIndex] to 1 so the document gets re-indexed
			UPDATE dmDocument
			SET [FolderKey] = '', [NeedsKeyIndex] = 1
			WHERE DocumentKey = @DocumentKey;

			-- Remove any delete records for the same document just in case data integrity is off
			-- or there are some concurrency issues
			DELETE FROM dmDeletedDocuments
			WHERE DocumentKey = @DocumentKey;

			--Insert record to dmDeletedDocuments table
			INSERT INTO dmDeletedDocuments
			(DocumentKey, FolderKey)
			VALUES(@DocumentKey,@FolderKey)

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentDeleteMarked : Cannot mark document deletion. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
