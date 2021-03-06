USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentTypeFieldsDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentTypeFieldsDelete]
		@DocTypeKey [char](36)
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			DELETE FROM [dmDocumentTypeField] WHERE [DocTypeKey] = @DocTypeKey

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentTypeFieldsDelete : Cannot delete records. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
