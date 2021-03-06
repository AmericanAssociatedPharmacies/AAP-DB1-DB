USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmOrphanedGetAllDocumentKeys]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmOrphanedGetAllDocumentKeys]
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		SET NOCOUNT ON;

		SELECT [DocumentKey]
		FROM dmDocument
		WHERE FolderKey = ''
		OR DocumentKey IN (
			SELECT DocumentKey FROM dmDeletedDocuments
		)

		IF @@ERROR <> 0
		BEGIN
			RAISERROR ('dmOrphanedGetAllDocumentKeys : Cannot get all orphaned document keys.', 15,1);
			ROLLBACK TRAN;
			RETURN(1);
		END;

		RETURN(0);
	END;
GO
