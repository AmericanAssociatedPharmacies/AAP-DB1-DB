USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmActivityExist]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmActivityExist]
		@ActivityKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		DECLARE @RecCount INT;

		SET NOCOUNT ON;

		SET @RecCount = (SELECT Count(*)
			FROM dmActivity
			WHERE ActivityKey = @ActivityKey);

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmActivityExist : Error encountered. ',100,1);
			RETURN(1);
		END

		IF (@RecCount > 0)
			RETURN(0);
		ELSE
			RETURN(1);
	END;
GO
