USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRefreshTokenDeleteByClientId]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRefreshTokenDeleteByClientId]
		@ClientId [varchar](60)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmRefreshToken
				WHERE [ClientId] = @ClientId;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRefreshTokenDeleteByClientId : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
