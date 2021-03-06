USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentFieldInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentFieldInsert]
		@DocumentKey [char](36),
		@FieldId [varchar](10),
		@FieldValue [varchar](256)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			INSERT INTO dmDocumentField
				(DocumentKey,FieldId, FieldValue)
				VALUES (@DocumentKey,@FieldId, @FieldValue);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentFieldInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
