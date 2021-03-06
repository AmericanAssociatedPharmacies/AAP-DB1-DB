USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDeleteUserFromGroup]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDeleteUserFromGroup]
		@GroupKey [char](36),
		@UserKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;

		SET NOCOUNT ON;

		DELETE FROM [dmMembership]
			WHERE GroupKey = @GroupKey
			And
			UserKey = @UserKey;

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmDeleteUserFromGroup : Cannot delete a user from membership records. ',100,1);
			ROLLBACK TRAN;
			RETURN(1);
		END;

		COMMIT TRAN;
		RETURN(0);
	END;
GO
