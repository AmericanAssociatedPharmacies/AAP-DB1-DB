USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGetRoutesByDocumentId]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE PROCEDURE [dbo].[dmGetRoutesByDocumentId]
		@DocumentKey [char](36),
		@UserKey [char](36),
		@IsAdministrator [bit]
		WITH EXECUTE AS CALLER
		AS
		BEGIN

			SET NOCOUNT ON;
			IF @IsAdministrator = 1
				SELECT * FROM
					(
					SELECT * FROM dmWorkflowDocument
					WHERE [dmWorkflowDocument].status < 2 AND DocumentKey = @DocumentKey AND (OwnerKey = '' OR OwnerKey = @UserKey)
					) AS a
                INNER JOIN dmWorkflow b on a.FlowKey = b.FlowKey
                INNER JOIN (SELECT * FROM dmWorkflowStepUser  WHERE UserKey = @UserKey ) c on a.StepKey = c.StepKey
			ELSE
				SELECT * FROM
					(
					SELECT  a.DocTypeKey,a.FolderKey,b.DocumentKey,b.FlowKey,b.StepKey,b.Status,c.Title  FROM
						(
						SELECT * FROM dmDocument
						WHERE dmDocument.DocumentKey = @DocumentKey
						AND EXISTS (
							SELECT WebDocsObjectKey
							FROM dmPermissions
							WHERE PermissionName = 'webdocs.document.view'
							AND PermissionStatus = 'Allow'
							AND (RequestorKey = @UserKey OR RequestorKey IN (SELECT GroupKey FROM dmMembership WHERE UserKey = @UserKey))
							AND (WebDocsObjectKey = DocTypeKey)
						)
						AND EXISTS (
							SELECT WebDocsObjectKey
							FROM dmPermissions
							WHERE PermissionName = 'webdocs.document.view'
							AND PermissionStatus = 'Allow'
							AND (RequestorKey = @UserKey OR RequestorKey IN (SELECT GroupKey FROM dmMembership WHERE UserKey = @UserKey))
							AND (WebDocsObjectKey = FolderKey)
						)
						AND NOT EXISTS (
							SELECT WebDocsObjectKey
							FROM dmPermissions
							WHERE PermissionName = 'webdocs.document.view'
							AND PermissionStatus = 'Deny'
							AND (RequestorKey = @UserKey OR RequestorKey IN (SELECT GroupKey FROM dmMembership WHERE UserKey = @UserKey))
							AND (WebDocsObjectKey = DocumentKey OR WebDocsObjectKey = DocTypeKey OR WebDocsObjectKey = FolderKey)
						)
					) AS a
				INNER JOIN (SELECT * FROM dmWorkflowDocument WHERE status < 2 AND (OwnerKey = '' OR OwnerKey = @UserKey)) b ON a.DocumentKey = b.DocumentKey
				INNER JOIN dmWorkflow c on b.FlowKey = c.FlowKey
				INNER JOIN (SELECT * FROM dmWorkflowStepUser  WHERE UserKey = @UserKey ) d on b.StepKey = d.StepKey
			) AS A

		IF @@ERROR <> 0
			BEGIN
				RAISERROR ('dmGetRoutesByDocumentId : Error encountered. ',15,1);
				ROLLBACK TRAN;
				RETURN(1);
			END;
		RETURN(0);
	END;
GO
