USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmOrphanedRestoreAll]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmOrphanedRestoreAll]
	AS
	BEGIN
		SET NOCOUNT ON;

		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE [dmDocument]
			SET [dmDocument].[FolderKey] = [dmDeletedDocuments].[FolderKey], [NeedsKeyIndex] = 1, [NeedsFullTextIndex] = 1, [FullTextIndexStatus] = ''
			FROM [dmDocument]
			INNER JOIN [dmDeletedDocuments] ON [dmDocument].[DocumentKey] = [dmDeletedDocuments].[DocumentKey]
			WHERE [dmDeletedDocuments].[FolderKey] <> '';

			SELECT [dmDeletedDocuments].[DocumentKey]
			FROM [dmDeletedDocuments]
			WHERE [dmDeletedDocuments].[FolderKey] <> '';

			DELETE FROM dmDeletedDocuments;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmOrphanedRestoreAll : Cannot restore documents. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
