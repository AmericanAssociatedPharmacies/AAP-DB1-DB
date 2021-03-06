USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteStepUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteStepUpdate]
		@RouteKey [char](36),
		@StepKey [char](36),
		@Description [varchar](1024),
		@TimeLimit [int],
		@TimeLimitAction [int],
		@TimeLimitUM [int],
		@Title [varchar](120),
		@DiagramLeft [int],
		@DiagramTop [int],
		@DiagramRight [int],
		@DiagramBottom [int],
		@AllowEdit [bit],
		@AllowComplete [bit],
		@AllowGlobalComplete [bit],
		@AllowTransfer [bit],
		@Notify [bit]
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE [dmWorkflowStep]
				SET [FlowKey] = @RouteKey
					,[Description] = @Description
					,[TimeLimit] = @TimeLimit
					,[TimeLimitAction] = @TimeLimitAction
					,[TimeLimitUM] = @TimeLimitUM
					,[Title] = @Title
					,[DiagramLeft] = @DiagramLeft
					,[DiagramTop] = @DiagramTop
					,[DiagramRight] = @DiagramRight
					,[DiagramBottom] = @DiagramBottom
					,[AllowEdit] = @AllowEdit
					,[AllowComplete] = @AllowComplete
					,[AllowGlobalComplete] = @AllowGlobalComplete
					,[AllowTransfer] = @AllowTransfer
					,[Notify] = @Notify
				WHERE [FlowKey] = @RouteKey
				AND [StepKey] = @StepKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRouteStepUpdate : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;
		RETURN(0);
	END;
GO
