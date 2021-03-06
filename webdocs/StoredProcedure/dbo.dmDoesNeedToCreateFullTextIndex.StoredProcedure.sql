USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDoesNeedToCreateFullTextIndex]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

			CREATE PROCEDURE [dbo].[dmDoesNeedToCreateFullTextIndex]
				@State BIT OUTPUT
				WITH EXECUTE AS CALLER
			AS
			BEGIN
				BEGIN TRAN
					DECLARE @count INT,
					@allowIndex BIT,
					@resetIndex BIT;

					SET @count =  (SELECT COUNT(*)
								   FROM [dbo].[dmDocument]
								   WHERE NeedsFullTextIndex = 1)

					SET @allowIndex =	(SELECT [SettingsValue]
										 FROM [dbo].[dmSetting]
										 WHERE SettingsKey='ALLOWFULLTEXT')

					SET @resetIndex =	(SELECT [SettingsValue]
										 FROM [dbo].[dmSetting]
										 WHERE SettingsKey='RESETFULLTEXTINDEX')

					IF @resetIndex = 'True' OR (@allowIndex = 'True' AND @count > 0)
						SET @State = 1
					ELSE
						SET @State = 0

					IF @@ERROR <> 0
					BEGIN
						RAISERROR ('dmDoesNeedToCreateFullTextIndex : Error encountered. ',15,1);
						ROLLBACK TRAN;
						RETURN(1);
					END;
				COMMIT TRAN
				RETURN 0;
			END;
			
GO
