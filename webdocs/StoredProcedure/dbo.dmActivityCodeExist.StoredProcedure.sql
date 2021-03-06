USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmActivityCodeExist]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmActivityCodeExist]
		@ActivityCode [int]
	AS
	BEGIN
		DECLARE @RecCount int; -- Used to store results of record count

		SET NOCOUNT ON;

		SET @RecCount = (SELECT Count(*)
						FROM dmActivityCode
						WHERE ActivityCode = @ActivityCode);

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmActivityCodeExist : Error encountered. ',100,1);
			RETURN(1);
		END;

		IF (@RecCount > 0)
			RETURN(0);
		ELSE
			RETURN(1);
	END;
GO
