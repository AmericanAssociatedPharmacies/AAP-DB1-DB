USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmMembershipDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmMembershipDelete]
		@UserKey [char](36),
		@GroupKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmMembership
				WHERE UserKey = @UserKey AND GroupKey = @GroupKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmMembershipDelete : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;
		RETURN(0);
	END;
GO
