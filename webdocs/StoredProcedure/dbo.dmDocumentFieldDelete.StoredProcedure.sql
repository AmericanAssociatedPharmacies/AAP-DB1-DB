USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentFieldDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentFieldDelete]
	@DocumentKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			DELETE FROM dmDocumentField
				WHERE DocumentKey = @DocumentKey;


			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentFieldDelete : Cannot delete record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
