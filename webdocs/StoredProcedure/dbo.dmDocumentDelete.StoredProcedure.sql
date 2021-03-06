USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentDelete]
		@DocumentKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			-- Remove record from dmDocument table
			DELETE FROM dmDocument
				WHERE DocumentKey = @DocumentKey;

			-- Remove record from dmFiler table
			DELETE FROM dmDeletedDocuments
				WHERE DocumentKey = @DocumentKey;

			-- Remove record from dmDocumentTextContent table
			DELETE FROM dmDocumentTextContent
				WHERE DocumentKey = @DocumentKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentDelete : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
