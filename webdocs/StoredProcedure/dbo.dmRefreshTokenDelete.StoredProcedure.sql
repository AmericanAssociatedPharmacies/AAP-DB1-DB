USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRefreshTokenDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRefreshTokenDelete]
		@id [varchar](255),
		@Browser [varchar](1024)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmRefreshToken
				WHERE Id = @id AND Browser = @Browser;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRefreshTokenDelete : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
