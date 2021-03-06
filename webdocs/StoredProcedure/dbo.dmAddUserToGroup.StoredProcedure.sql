USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmAddUserToGroup]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmAddUserToGroup]
	@GroupKey [char](36),
	@UserKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;

		SET NOCOUNT ON;


		INSERT INTO[dmMembership]
			(GroupKey, UserKey)
			VALUES (@GroupKey, @UserKey);

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmAddUserToGroup : Cannot insert a use into a group record. ',15,1);
			ROLLBACK TRAN;
			RETURN(1);
		END;

		COMMIT TRAN;
		RETURN(0);
	END;
GO
