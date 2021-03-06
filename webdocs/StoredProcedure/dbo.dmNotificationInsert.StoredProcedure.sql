USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmNotificationInsert]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmNotificationInsert]
		@FolderKey [char](36),
		@UserKey [char](36),
		@NotifyOnAdd [bit],
		@AttachmentOption [int],
		@SendLink [bit],
		@NotificationKey [char](36) OUTPUT
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			SET @NotificationKey = NEWID();

			INSERT INTO dmNotification
				(NotificationKey,FolderKey, UserKey,NotifyOnAdd,AttachmentOption,SendLink)
				VALUES (@NotificationKey,@FolderKey, @UserKey,@NotifyOnAdd,@AttachmentOption,@SendLink);

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmNotificationInsert : Cannot insert record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRANSACTION;

		RETURN(0);
	END;
GO
