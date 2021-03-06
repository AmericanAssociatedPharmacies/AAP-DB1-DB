USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteStepInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteStepInsert]
		@RouteKey [char](36),
		@Title [varchar](120),
		@Description [varchar](1024),
		@TimeLimit [int],
		@TimeLimitAction [int],
		@TimeLimitUM [int],
		@DiagramLeft [int],
		@DiagramTop [int],
		@DiagramRight [int],
		@DiagramBottom [int],
		@AllowComplete [bit],
		@AllowEdit [bit],
		@AllowGlobalComplete [bit],
		@AllowTransfer [bit],
		@Notify [bit],
		@StepKey [char](36) OUTPUT
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			SET @StepKey = NEWID();

			INSERT INTO dmWorkflowStep
				(FlowKey, StepKey, Title, Description, TimeLimit, TimeLimitAction, TimeLimitUM, DiagramTop, DiagramLeft, DiagramBottom, DiagramRight, AllowComplete, AllowGlobalComplete, AllowTransfer, Notify, AllowEdit)
				VALUES (@RouteKey, @StepKey, @Title, @Description, @TimeLimit, @TimeLimitAction, @TimeLimitUM, @DiagramTop, @DiagramLeft, @DiagramBottom, @DiagramRight, @AllowComplete, @AllowGlobalComplete, @AllowTransfer, @Notify, @AllowEdit)

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRouteStepInsert : Cannot insert record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
