USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmOrphanedMoveAll]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmOrphanedMoveAll]
		@FolderKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE [dmDocument]
			SET [FolderKey] = @FolderKey, [NeedsKeyIndex] = 1, [NeedsFullTextIndex] = 1, [FullTextIndexStatus] = '
			WHERE [DocumentKey] IN (
				SELECT [DocumentKey]
				FROM [dmDeletedDocuments]
			);

			UPDATE [dmDocument]
			SET [FolderKey] = @FolderKey, [NeedsKeyIndex] = 1, [NeedsFullTextIndex] = 1, [FullTextIndexStatus] = '
			WHERE [FolderKey] = '';

			DELETE FROM [dmDeletedDocuments];

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmOrphanedMoveAll : Cannot move all documents. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
