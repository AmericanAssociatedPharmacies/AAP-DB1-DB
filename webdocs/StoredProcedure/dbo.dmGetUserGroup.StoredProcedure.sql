USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGetUserGroup]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmGetUserGroup]
		@UserKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		SET NOCOUNT ON;
		select groupKey from [dmMemberOf] WITH (NOLOCK) where Userkey = @UserKey

		IF @@ERROR <> 0
			BEGIN
				RAISERROR ('dmGetUserGroup : Cannot get all members.', 15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		RETURN(0);
	END;
GO
