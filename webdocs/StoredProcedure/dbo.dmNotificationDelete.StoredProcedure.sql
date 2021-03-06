USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmNotificationDelete]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmNotificationDelete]
		@NotificationKey [char](36)
	AS
	BEGIN
		BEGIN TRANSACTION;

			SET NOCOUNT ON;

			DELETE FROM dmNotification
			WHERE NotificationKey = @NotificationKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmNotificationDelete : Cannot delete record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;

		COMMIT TRANSACTION;
		RETURN(0);
	END;
GO
