USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmOrphanedRestoreSingle]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmOrphanedRestoreSingle]
		@DocumentKey [char](36)
	AS
	BEGIN
		SET NOCOUNT ON;

		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DECLARE @OriginalFolder char(36);
			SET @OriginalFolder = (SELECT FolderKey FROM dmDeletedDocuments WHERE DocumentKey = @DocumentKey)

			IF @OriginalFolder IS NOT NULL AND @OriginalFolder <> ''
			BEGIN
				UPDATE [dmDocument]
				SET [dmDocument].[FolderKey] = [dmDeletedDocuments].[FolderKey], [NeedsKeyIndex] = 1, [NeedsFullTextIndex] = 1, [FullTextIndexStatus] = ''
				FROM [dmDocument]
				INNER JOIN [dmDeletedDocuments] ON [dmDocument].[DocumentKey] = [dmDeletedDocuments].[DocumentKey]
				WHERE [dmDeletedDocuments].[FolderKey] <> ''
				AND [dmDeletedDocuments].[DocumentKey] = @DocumentKey;

				DELETE FROM dmDeletedDocuments
				WHERE DocumentKey = @DocumentKey;
			END
			ELSE
				RETURN(1);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmOrphanedRestoreSingle : Cannot restore document. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
