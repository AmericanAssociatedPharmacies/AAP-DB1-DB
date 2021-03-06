USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentGetAll]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentGetAll]
	WITH EXECUTE AS CALLER

	AS
	BEGIN

		SET NOCOUNT ON;
		SELECT DocumentKey, DocumentTitle, DocTypeKey, LocationKey,
				CheckoutUserKey, FolderKey, InsertDate, ChangeDate,
				LastVerified,[ExpireDate], FullTextIndexStatus, NeedsKeyIndex, NeedsFullTextIndex
		FROM dmDocument

		IF @@ERROR <> 0
			BEGIN
				RAISERROR ('dmDocumentGetAll : Cannot get all document records.', 15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		RETURN(0);
	END;
GO
