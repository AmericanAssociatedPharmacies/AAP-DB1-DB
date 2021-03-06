USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmDenyPermission]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmDenyPermission]
		@RequestorKey [char](36),
		@WebDocsObjectKey [char](36),
		@PermissionName [varchar](64)
	AS
	BEGIN
		BEGIN TRAN;
			SET NOCOUNT ON

			-- Delete record from table if it already exists
			DELETE FROM dmPermissions
			WHERE RequestorKey = @RequestorKey
			AND WebDocsObjectKey = @WebDocsObjectKey
			AND PermissionName = @PermissionName;

			-- Insert record into table
			INSERT INTO dmPermissions
				(RequestorKey,WebDocsObjectKey,PermissionName,PermissionStatus)
				VALUES (@RequestorKey,@WebDocsObjectKey,@PermissionName,'Deny');

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmDenyPermission : Cannot insert record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
