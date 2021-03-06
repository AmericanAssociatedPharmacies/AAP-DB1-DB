USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmPermissionsGetFolderOrDocType]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmPermissionsGetFolderOrDocType]
		@RequestorKey [char](36),
		@WebDocsObjectKey [char](36),
		@PermissionName [varchar](64)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		BEGIN TRANSACTION;
			SET NOCOUNT ON;

			SELECT DISTINCT
				[PermissionStatus]
			FROM
				[dmPermissions]
			WHERE
				[WebDocsObjectKey] = @WebDocsObjectKey
			AND
				[PermissionName] = @PermissionName
			AND
				([RequestorKey] = @RequestorKey
			OR
				([RequestorKey]  IN (SELECT GroupKey FROM dmMembership WHERE UserKey =@RequestorKey)))


			IF (@@error!=0)
			BEGIN
				RAISERROR ('dmPermissionsGetFolderOrDocType : Cannot get record. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		COMMIT TRAN;
		RETURN(0);
	END;
GO
