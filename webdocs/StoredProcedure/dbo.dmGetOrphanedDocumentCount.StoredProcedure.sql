USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGetOrphanedDocumentCount]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmGetOrphanedDocumentCount]
	AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
		-- interfering with SELECT statements.
		SET NOCOUNT ON;

		SELECT COUNT(*)
		FROM dmDocument
		WHERE FolderKey = '' OR DocumentKey IN (
			SELECT DocumentKey FROM dmDeletedDocuments
		);

		IF (@@error <> 0)
		BEGIN
			RAISERROR ('dmGetOrphanedDocumentCount : Error encountered. ',15,1);
			RETURN(1);
		END
		ELSE
			RETURN(0);
	END;
GO
