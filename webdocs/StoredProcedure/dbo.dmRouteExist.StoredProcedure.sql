USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteExist]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteExist]
		@RouteKey [char](36)
	AS
	BEGIN
		DECLARE @RecCount INT; -- Used to store results of record count

		SET NOCOUNT ON;

		SET @RecCount = (SELECT Count(*)
			FROM dmWorkflow
			WHERE FlowKey = @RouteKey);

		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmRouteExist : Error encountered. ',15,1);
			RETURN(1);
		END;

		IF (@RecCount > 0)
			RETURN(0);
		ELSE
			RETURN(1);
	END;
GO
