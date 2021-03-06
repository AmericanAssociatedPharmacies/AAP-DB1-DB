USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRefreshTokenDeletePreviousTokens]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRefreshTokenDeletePreviousTokens]
		@ClientId [varchar](60),
		@Browser [varchar](1024),
		@Subject [varchar](60),
		@Id [varchar](255)

	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmRefreshToken
			WHERE [Id] != @Id
				AND [Browser] = @Browser
				AND [Subject] = @Subject
				AND [ClientId] = @ClientId
				AND [ExpiresUtc] < GETUTCDATE();

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRefreshTokenDeletePreviousTokens : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
