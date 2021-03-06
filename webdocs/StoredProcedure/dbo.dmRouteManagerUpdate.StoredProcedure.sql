USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteManagerUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteManagerUpdate]
		@RouteKey [char](36),
		@UserKey [char](36)
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE [dmWorkflow]
				SET [ManagerKey] = @UserKey
				WHERE [FlowKey] = @RouteKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRouteManagerUpdate : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;
		RETURN(0);
	END;
GO
