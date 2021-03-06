USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmUserGrantAdmin]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmUserGrantAdmin]
		@UserKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE dmUser
				SET Admin = 1
				WHERE UserKey = @UserKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmUserGrantAdmin : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
