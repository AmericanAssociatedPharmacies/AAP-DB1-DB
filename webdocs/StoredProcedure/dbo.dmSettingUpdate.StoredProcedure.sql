USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmSettingUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmSettingUpdate]
		@SettingsKey [varchar](128),
		@SettingsValue [varchar](2048)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DECLARE @Exist INT;
			EXEC @Exist = dmSettingExist @SettingsKey;

			IF @Exist = 0
				UPDATE dmSetting
					SET SettingsValue = @SettingsValue
					WHERE SettingsKey = @SettingsKey;
			ELSE
				INSERT INTO dmSetting
					(SettingsKey, SettingsValue)
					VALUES (@SettingsKey, @SettingsValue);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmSettingUpdate : Cannot update record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
