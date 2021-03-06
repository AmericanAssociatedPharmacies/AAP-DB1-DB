USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteStepConnectionDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteStepConnectionDelete]
		@RouteKey [char](36),
		@FromStepKey [char](36),
		@ToStepKey [char](36)
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmWorkflowConnect
			WHERE FromFlowKey = @RouteKey AND ToFlowKey = @RouteKey
			AND FromStepKey = @FromStepKey AND ToStepKey = @ToStepKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRouteStepConnectionDelete : Cannot delete record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;

		COMMIT TRANSACTION;
		RETURN(0);
	END;
GO
