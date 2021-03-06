USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmPermissionGetAllExplicit]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmPermissionGetAllExplicit]
	AS
	BEGIN
		SET NOCOUNT ON;

		SELECT [WebDocsObjectKey], [RequestorKey], [PermissionName], [PermissionStatus]
		FROM [dmPermissions];

		IF @@ERROR <> 0
		BEGIN
			RAISERROR('dmPermissionGetAllExplicit: Error encountered. ', 15, 1);
			ROLLBACK TRAN;

			RETURN 1;
		END;

		RETURN 0;
	END;
GO
