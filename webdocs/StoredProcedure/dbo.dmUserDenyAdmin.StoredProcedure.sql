USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmUserDenyAdmin]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmUserDenyAdmin]
		@UserKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE dmUser
				SET Admin = 0
				WHERE UserKey = @UserKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmUserDenyAdmin : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
