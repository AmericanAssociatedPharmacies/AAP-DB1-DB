USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmPermissionExists]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmPermissionExists]
		@RequestorKey [char](36),
		@WebDocsObjectKey [char](36),
		@PermissionName [varchar](64)
	WITH EXECUTE AS CALLER
	AS
	BEGIN
		SET NOCOUNT ON;

		IF EXISTS (SELECT 1 FROM [dmPermissions] WHERE [RequestorKey] = @RequestorKey And [WebDocsObjectKey] = @WebDocsObjectKey And [PermissionName] = @PermissionName)
			RETURN(1);
		ELSE
			RETURN(0);
	END;
GO
