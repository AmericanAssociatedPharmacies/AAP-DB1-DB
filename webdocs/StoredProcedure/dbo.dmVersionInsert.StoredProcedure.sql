USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmVersionInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmVersionInsert]
		@DocumentKey [char](36),
		@Extension [varchar](10),
		@UserKey [char](36),
		@VersionComment [varchar](1024)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;
			Declare @versionNumber AS INT
			SET @versionNumber =  (SELECT MAX([version]) FROM dmVersion WHERE DocumentKey = @DocumentKey) + 1
			IF @versionNumber IS NULL
				SET @versionNumber = 0

			INSERT INTO dmVersion
				(DocumentKey,Extension, [Version], UserKey,VersionComment)
				VALUES (@DocumentKey,@Extension, @versionNumber, @UserKey, @VersionComment);

			UPDATE dmDocument
				SET ChangeDate = GETDATE(),
				CheckoutUserKey = '',
				NeedsKeyIndex = 1,
				NeedsFullTextIndex = 1
				WHERE DocumentKey = @DocumentKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmVersionInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;

		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
