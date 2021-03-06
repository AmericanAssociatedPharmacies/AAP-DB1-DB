USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRefreshTokenDeleteByTokenId]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRefreshTokenDeleteByTokenId]
		@id [varchar](128)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmRefreshToken
				WHERE Id = @id;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRefreshTokenDeleteByTokenId : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
