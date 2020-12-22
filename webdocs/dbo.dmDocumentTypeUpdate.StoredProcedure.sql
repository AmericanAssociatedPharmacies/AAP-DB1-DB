USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDocumentTypeUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDocumentTypeUpdate]
		@DocTypeKey [char](36),
		@DocTypeTitle [varchar](256),
		@Description [varchar](80),
		@ExpireDays [int]
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			UPDATE dmDocumentType
				SET DocTypeTitle = @DocTypeTitle,Description = @Description, ExpireDays = @ExpireDays
				WHERE DocTypeKey = @DocTypeKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDocumentTypeUpdate : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
