USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmNotificationUpdate]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmNotificationUpdate]
		@NotificationKey [char](36),
		@FolderKey [char](36),
		@UserKey [char](36),
		@NotifyOnAdd [bit],
		@AttachmentOption [int],
		@SendLink [bit]
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			UPDATE dmNotification
			SET FolderKey = @FolderKey,
				UserKey = @UserKey,
				NotifyOnAdd = @NotifyOnAdd,
				AttachmentOption = @AttachmentOption,
				SendLink = @SendLink
			WHERE NotificationKey = @NotificationKey;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmNotificationUpdate : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
