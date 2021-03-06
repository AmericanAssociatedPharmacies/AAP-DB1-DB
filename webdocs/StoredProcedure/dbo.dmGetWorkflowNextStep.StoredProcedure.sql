USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGetWorkflowNextStep]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmGetWorkflowNextStep]
		@StepKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN

		SET NOCOUNT ON;

		SELECT StepKey FROM [dmWorkflowStep] s
				INNER JOIN
				dmWorkflowConnect ON s.FlowKey = dmWorkflowConnect.ToFlowKey
				AND s.StepKey = dmWorkflowConnect.ToStepKey
				WHERE dmWorkflowConnect.FromStepKey = @StepKey;

		IF @@ERROR <> 0
			BEGIN
				RAISERROR ('dmGetWorkflowNextStep : Error encountered. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		RETURN(0);
	END;
GO
