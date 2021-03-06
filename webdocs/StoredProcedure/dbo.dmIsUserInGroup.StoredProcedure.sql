USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmIsUserInGroup]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmIsUserInGroup]
	@GroupKey [char](36),
	@UserKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		DECLARE @RecCount INT; -- Used to store results of record count

		SET NOCOUNT ON;

		SET @RecCount = (SELECT Count(*)
			FROM dmMembership
			WHERE UserKey = @UserKey
			And
			GroupKey = @GroupKey );

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmIsUserInGroup : Error encountered. ',100,1);
			RETURN(1);
		END

		IF (@RecCount > 0)
			RETURN(0);
		ELSE
			RETURN(1);
	END;
GO
