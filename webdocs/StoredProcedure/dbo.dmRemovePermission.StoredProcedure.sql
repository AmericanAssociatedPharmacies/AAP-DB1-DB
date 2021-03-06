USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmRemovePermission]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmRemovePermission]
		@RequestorKey [char](36) OUTPUT,
		@WebDocsObjectKey [char](36) OUTPUT,
		@PermissionName [varchar](64)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON

			-- Delete record from table
			DELETE FROM dmPermissions
			WHERE RequestorKey = @RequestorKey
			AND WebDocsObjectKey = @WebDocsObjectKey
			AND PermissionName = @PermissionName;

			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmRemovePermission : Cannot delete record. ',100,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;

		RETURN(0);
	END;
GO
