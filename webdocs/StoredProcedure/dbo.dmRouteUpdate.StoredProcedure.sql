USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteUpdate]
		@RouteKey [char](36),
		@Description [varchar](1024),
		@NotifyAccept [bit],
		@NotifyComplete [bit],
		@NotifyReject [bit],
		@ManagerKey [char](36),
		@AllowReject [bit],
		@ClearOnReject [bit],
		@Title [varchar](120)
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE dmWorkflow
				SET Description = @Description,
					NotifyAccept = @NotifyAccept,
					NotifyComplete = @NotifyComplete,
					NotifyReject = @NotifyReject,
					ManagerKey = @ManagerKey,
					AllowReject = @AllowReject,
					ClearOnReject = @ClearOnReject,
					Title = @Title
				WHERE FlowKey = @RouteKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRouteUpdate : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;
		RETURN(0);
	END;
GO
