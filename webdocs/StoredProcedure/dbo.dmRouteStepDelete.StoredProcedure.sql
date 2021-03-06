USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteStepDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteStepDelete]
		@StepKey [char](36)
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmWorkflowConnect
			WHERE FromStepKey = @StepKey
			OR ToStepKey = @StepKey;

			DELETE FROM dmWorkflowStep
			WHERE StepKey = @StepKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRouteStepDelete : Cannot delete record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;

		COMMIT TRANSACTION;
		RETURN(0);
	END;
GO
