USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGetDocumentsToIndex]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmGetDocumentsToIndex]
	AS
	BEGIN
		SET NOCOUNT ON;

		SELECT TOP 30000 [DocumentKey],[FolderKey],[DocTypeKey],[DocumentTitle],[InsertDate],
		[UserDefined1],[UserDefined2],[UserDefined3],[UserDefined4],[UserDefined5]
		,[UserDefined6],[UserDefined7],[UserDefined8],[UserDefined9],[UserDefined10],[UserDefined11],[UserDefined12]
		,[UserDefined13],[UserDefined14],[UserDefined15],[UserDefined16],[UserDefined17],[UserDefined18],[UserDefined19]
		,[UserDefined20],[UserDefined21],[UserDefined22],[UserDefined23],[UserDefined24],[UserDefined25],[UserDefined26]
		,[UserDefined27],[UserDefined28],[UserDefined29],[UserDefined30] FROM [dmDocument]
		WHERE [NeedsKeyIndex] = 1 ORDER BY InsertDate DESC
	END
GO
