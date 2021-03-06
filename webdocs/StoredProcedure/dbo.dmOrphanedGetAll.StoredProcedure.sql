USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmOrphanedGetAll]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmOrphanedGetAll]
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		SET NOCOUNT ON;

		SELECT [DocumentKey],[ChangeDate],[DocumentTitle],[FileName],[DocTypeKey],[LocationKey],[LastVerified],[TimeStamp]
				,[UserDefined1],[UserDefined2],[UserDefined3],[UserDefined4],[UserDefined5],[UserDefined6],[UserDefined7]
				,[UserDefined8],[UserDefined9],[UserDefined10],[UserDefined11],[UserDefined12],[UserDefined13],[UserDefined14]
				,[UserDefined15],[UserDefined16],[UserDefined17],[UserDefined18],[UserDefined19],[UserDefined20],[InsertDate]
				,[CheckoutUserKey],[LocationInsertDate],[ExpireDate],[UserDefined21],[UserDefined22],[UserDefined23],[UserDefined24]
				,[UserDefined25],[UserDefined26],[UserDefined27],[UserDefined28],[UserDefined29],[UserDefined30],[FullTextIndexStatus]
				,[NeedsKeyIndex],[NeedsFullTextIndex],[FolderKey]
		FROM dmDocument
		WHERE FolderKey = ''
		OR DocumentKey IN (SELECT DocumentKey FROM dmDeletedDocuments)

		IF @@ERROR <> 0
		BEGIN
			RAISERROR ('dmOrphanedGetAll : Cannot get all orphaned documents.', 15,1);
			ROLLBACK TRAN;
			RETURN(1);
		END;

		RETURN(0);
	END;
GO
