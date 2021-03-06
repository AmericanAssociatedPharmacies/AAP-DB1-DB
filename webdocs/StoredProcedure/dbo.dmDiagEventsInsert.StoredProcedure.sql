USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDiagEventsInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDiagEventsInsert]
		@EventType [char](10),
		@EventTargetKey [char](36),
		@EventMessage [varchar](MAX)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON;

			INSERT INTO dmDiagEvents
				(EventType, EventTargetKey, EventMessage)
				VALUES (@EventType, @EventTargetKey, @EventMessage);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDiagEventsInsert : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
