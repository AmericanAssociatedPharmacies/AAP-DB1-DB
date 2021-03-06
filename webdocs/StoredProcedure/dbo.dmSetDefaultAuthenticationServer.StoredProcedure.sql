USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmSetDefaultAuthenticationServer]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmSetDefaultAuthenticationServer]
		@ServerId [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			IF EXISTS (SELECT * FROM dmSetting WHERE SettingsKey = 'DEFAULTAUTHSERVER')
				UPDATE dmSetting
				SET SettingsValue = @ServerId
				WHERE SettingsKey = 'DEFAULTAUTHSERVER'
			ELSE
				INSERT INTO dmSetting (SettingsKey, SettingsValue)
				VALUES ('DEFAULTAUTHSERVER', @ServerId)

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmSetDefaultAuthenticationServer : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
