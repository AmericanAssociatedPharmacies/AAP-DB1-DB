USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmUserDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmUserDelete]
		@UserKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmUser
			WHERE UserKey = @UserKey;

			DELETE FROM dmMembership
			WHERE UserKey = @UserKey;

			DELETE FROM dmUserSearchResults
			WHERE UserKey = @UserKey;

			DELETE FROM dmSavedQuery
			WHERE UserKey = @UserKey;

		    DELETE FROM dmWorkflowStepUser
		    WHERE UserKey = @UserKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmUserDelete : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
