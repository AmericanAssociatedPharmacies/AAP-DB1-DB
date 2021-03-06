USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentTypeFieldDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentTypeFieldDelete]
		@DocTypeKey [char](36),
		@FieldKey [int]
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			-- Remove record from table
			DELETE FROM dmDocumentTypeField
				WHERE DocTypeKey = @DocTypeKey AND FieldKey = @FieldKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentTypeFieldDelete : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
