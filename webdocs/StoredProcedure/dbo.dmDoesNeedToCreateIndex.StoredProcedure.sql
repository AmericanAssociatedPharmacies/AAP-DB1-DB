USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDoesNeedToCreateIndex]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

			CREATE PROCEDURE [dbo].[dmDoesNeedToCreateIndex]
					@State BIT OUTPUT
					WITH EXECUTE AS CALLER
				AS
				BEGIN
					BEGIN TRAN
					DECLARE @count INT
					, @resetIndex BIT;

					SET @count =  (SELECT COUNT(*)
								   FROM [dbo].[dmDocument]
								   WHERE NeedsKeyIndex = 1)

					SET @resetIndex =	(SELECT [SettingsValue]
										 FROM [dbo].[dmSetting]
										 WHERE SettingsKey='RESETFULLTEXTINDEX')

					IF @resetIndex = 'True'
					OR @count > 0
						SET @State = 1
					ELSE
						SET @State = 0

					IF @@ERROR <> 0
					BEGIN
						RAISERROR ('dmDoesNeedToCreateIndex : Error encountered. ',15,1);
						ROLLBACK TRAN;
						RETURN(1);
					END;
				COMMIT TRAN
				RETURN 0;
				END;
			
GO
