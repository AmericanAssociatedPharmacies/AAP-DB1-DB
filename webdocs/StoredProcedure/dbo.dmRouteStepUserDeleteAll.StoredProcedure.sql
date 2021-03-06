USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteStepUserDeleteAll]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteStepUserDeleteAll]
		@StepKey [char](36)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			DELETE FROM dmWorkflowStepUser
			WHERE StepKey = @StepKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRouteStepUserDeleteAll : Cannot delete record(s). ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
