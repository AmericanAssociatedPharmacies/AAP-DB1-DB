USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmWorkflowNextStepExist]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmWorkflowNextStepExist]
		@StepKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		DECLARE @RecCount INT; -- Used to store results of record count

		SET NOCOUNT ON;

		SET @RecCount = (SELECT COUNT(StepKey) FROM [dmWorkflowStep] s
				INNER JOIN
				dmWorkflowConnect ON s.FlowKey = dmWorkflowConnect.ToFlowKey
				AND s.StepKey = dmWorkflowConnect.ToStepKey
				WHERE dmWorkflowConnect.ToStepKey = @StepKey);


		IF (@@error!=0)
		BEGIN
			RAISERROR ('dmWorkflowNextStepExist : Error encountered. ',100,1);
			RETURN(1);
		END

		IF (@RecCount > 0)
			RETURN(0);
		ELSE
			RETURN(1);
	END;
GO
