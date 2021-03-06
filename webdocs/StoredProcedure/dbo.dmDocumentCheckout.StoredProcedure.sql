USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentCheckout]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentCheckout]
		@DocumentKey [char](36),
		@CheckoutUserKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			UPDATE dmDocument
				SET CheckoutUserKey = @CheckoutUserKey
				WHERE DocumentKey = @DocumentKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentCheckout : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
