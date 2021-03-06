USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentTypeDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentTypeDelete]
		@DocTypeKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			DELETE FROM dmDocumentType
				WHERE DocTypeKey = @DocTypeKey;

			DELETE FROM dmDocumentTypeField
				WHERE DocTypeKey = @DocTypeKey;

			DELETE FROM dmDocumentTypeFieldVal
				WHERE DocTypeKey = @DocTypeKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentTypeDelete : Cannot delete record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
