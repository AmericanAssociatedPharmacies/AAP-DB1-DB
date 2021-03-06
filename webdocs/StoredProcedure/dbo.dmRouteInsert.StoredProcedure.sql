USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRouteInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRouteInsert]
		@Description [varchar](1024),
		@NotifyAccept [bit],
		@NotifyComplete [bit],
		@NotifyReject [bit],
		@ManagerKey [char](36),
		@AllowReject [bit],
		@ClearOnReject [bit],
		@Title [varchar](120),
		@RouteKey [char](36) OUTPUT
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			SET @RouteKey = NEWID();

			INSERT INTO dmWorkflow
				(FlowKey, Description, NotifyAccept, NotifyComplete, NotifyReject, ManagerKey, AllowReject, ClearOnReject, Title)
				VALUES (@RouteKey, @Description, @NotifyAccept, @NotifyComplete, @NotifyReject, @ManagerKey, @AllowReject, @ClearOnReject, @Title)

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRouteInsert : Cannot insert record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
