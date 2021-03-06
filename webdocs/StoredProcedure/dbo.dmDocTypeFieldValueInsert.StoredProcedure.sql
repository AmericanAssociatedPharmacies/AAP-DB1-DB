USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocTypeFieldValueInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocTypeFieldValueInsert]
		@DocTypeKey [char](36),
		@FieldKey [int],
		@FieldValue [varchar](256),
		@FieldValueKey [int] OUTPUT
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			DECLARE @ValKey INT;

			SET @ValKey = (SELECT ISNULL(MAX(ValKey) + 1,1) FROM dmDocumentTypeFieldVal WHERE DocTypeKey = @DocTypeKey AND FieldKey = @FieldKey);

			INSERT INTO dmDocumentTypeFieldVal
					(DocTypeKey,FieldKey,ValKey,FieldValue)
				VALUES (@DocTypeKey,@FieldKey,@ValKey,@FieldValue)
				Set @FieldValueKey = @ValKey
			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocTypeFieldValueInsert : Cannot insert record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
