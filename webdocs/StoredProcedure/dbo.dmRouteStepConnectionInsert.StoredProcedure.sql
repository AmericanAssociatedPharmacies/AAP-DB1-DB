USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteStepConnectionInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteStepConnectionInsert]
		@RouteKey [char](36),
		@FromStepKey [char](36),
		@ToStepKey [char](36)
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			INSERT INTO dmWorkflowConnect (FromFlowKey, FromStepKey, ToFlowKey, ToStepKey)
				VALUES (@RouteKey, @FromStepKey, @RouteKey, @ToStepKey);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRouteStepConnectionInsert : Cannot insert record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
