USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmPermissionsUpdateForFolderOrDocType]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmPermissionsUpdateForFolderOrDocType]
		@RequestorKey [char](36),
		@WebDocsObjectKey [char](36),
		@PermissionName [varchar](64),
		@PermissionStatus [varchar](64)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			IF EXISTS (SELECT 1 FROM [dmPermissions] WHERE [RequestorKey] = @RequestorKey And [WebDocsObjectKey] = @WebDocsObjectKey And [PermissionName] = @PermissionName)
			BEGIN
				UPDATE [dmPermissions]
				SET
					[PermissionStatus] = @PermissionStatus
				WHERE @RequestorKey = @RequestorKey
				And
					[WebDocsObjectKey] = @WebDocsObjectKey
				And
					[PermissionName] = @PermissionName;
			END
			ELSE
			BEGIN
				INSERT INTO dmPermissions
				(RequestorKey,WebDocsObjectKey,PermissionName,PermissionStatus)
				VALUES (@RequestorKey,@WebDocsObjectKey,@PermissionName,@PermissionStatus);
			END

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmPermissionsUpdateForFolderOrDocType : Cannot update record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;
		RETURN(0);
	END;
GO
