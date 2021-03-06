USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocTypeFieldValueUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocTypeFieldValueUpdate]
		@DocTypeKey [char](36),
		@FieldKey [int],
		@FieldValue [varchar](256),
		@ValKey [int]
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			Update  [dmDocumentTypeFieldVal] SET FieldValue = @FieldValue  where DocTypeKey = @DocTypeKey And FieldKey = @FieldKey And ValKey = @ValKey

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocTypeFieldValueUpdate : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
