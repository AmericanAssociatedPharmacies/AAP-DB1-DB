USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmActivityInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmActivityInsert]
		@ActivityCode [int],
		@ActivityDesc [varchar](256) = 'Document added to system.',
		@ActivityDateTime [datetime],
		@DocumentKey [char](36),
		@UserKey [char](36),
		@ActivityKey [char](36) OUTPUT
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
    		SET NOCOUNT ON;

			-- Get a new unique key value
			SET @ActivityKey = NEWID();

			IF (@ActivityCode <> 1002 AND @ActivityDesc = 'Document added to system.')
				RAISERROR ('dmActivityInsert : Default value cannot be used for new document checkin activities.', 15, 1);

			INSERT INTO dmActivity
				(ActivityKey, ActivityCode,ActivityDateTime,DocumentKey,UserKey,ActivityDesc)
				VALUES (@ActivityKey, @ActivityCode,@ActivityDateTime,@DocumentKey,@UserKey,@ActivityDesc);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmActivityInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
