USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentTypeFieldValueDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentTypeFieldValueDelete]
		@DocTypeKey [char](36),
		@FieldKey [int],
		@ValueKey [int]
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmDocumentTypeFieldVal
			WHERE DocTypeKey = @DocTypeKey
			AND FieldKey = @FieldKey
			AND ValKey = @ValueKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentTypeFieldValueDelete : Cannot delete record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;

		COMMIT TRANSACTION;
		RETURN(0);
	END;
GO
