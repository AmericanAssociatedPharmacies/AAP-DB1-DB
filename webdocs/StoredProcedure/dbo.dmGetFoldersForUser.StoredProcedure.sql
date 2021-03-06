USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGetFoldersForUser]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

				CREATE PROCEDURE [dbo].[dmGetFoldersForUser]
						@UserKey [char](36),
						@PermissionName [varchar](64)
					WITH EXECUTE AS CALLER
					AS
					BEGIN
						SET NOCOUNT ON;

						DECLARE @IsAdmnin BIT
						SET @IsAdmnin = (SELECT [Admin] FROM dmUser WHERE UserKey = @UserKey)

						IF @IsAdmnin=0
						BEGIN
							SELECT FolderKey, FolderTitle, ParentKey  FROM dmFolder LEFT JOIN [dmFolderTree] ON dmFolder.FolderKey = dmFolderTree.ChildKey

							WHERE FolderKey IN(SELECT WebDocsObjectKey FROM dmPermissions WHERE PermissionName = @PermissionName
							AND PermissionStatus = 'allow' AND (RequestorKey = @UserKey OR RequestorKey IN (SELECT GroupKey FROM dmMembership WHERE UserKey = @UserKey)))
							AND FolderKey NOT IN (SELECT WebDocsObjectKey FROM dmPermissions WHERE PermissionName = @PermissionName
							AND PermissionStatus = 'deny' AND (RequestorKey = @UserKey OR RequestorKey IN (SELECT GroupKey FROM dmMembership WHERE UserKey = @UserKey)))

							ORDER BY [dmFolder].[FolderTitle] ASC
						END
						ELSE
						BEGIN
							SELECT FolderKey, FolderTitle, ParentKey  FROM dmFolder LEFT JOIN [dmFolderTree] ON dmFolder.FolderKey = dmFolderTree.ChildKey
							ORDER BY [dmFolder].[FolderTitle] ASC
						END
					END;
			
GO
