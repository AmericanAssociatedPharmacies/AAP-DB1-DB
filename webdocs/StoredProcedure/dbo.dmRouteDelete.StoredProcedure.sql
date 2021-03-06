USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteDelete]
		@RouteKey [char](36)
	AS
	BEGIN
		BEGIN TRANSACTION;

			SET NOCOUNT ON;

			DELETE FROM dmWorkflow
			WHERE FlowKey = @RouteKey;

			DELETE FROM dmWorkflowConnect
			WHERE FromFlowKey = @RouteKey
			OR ToFlowKey = @RouteKey;

			DELETE FROM dmWorkflowStepUser
			WHERE StepKey IN (SELECT StepKey FROM dmWorkflowStep WHERE FlowKey = @RouteKey);

			DELETE FROM dmWorkflowStep
			WHERE FlowKey = @RouteKey;

			DELETE FROM dmWorkflowDocument
			WHERE FlowKey = @RouteKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRouteDelete : Cannot delete record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;

		COMMIT TRANSACTION;
		RETURN(0);
	END;
GO
