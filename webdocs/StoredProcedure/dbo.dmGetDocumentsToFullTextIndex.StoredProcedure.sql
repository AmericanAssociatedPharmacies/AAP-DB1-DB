USE [webdocs]
GO
/****** Object:  StoredProcedure [dbo].[dmGetDocumentsToFullTextIndex]    Script Date: 12/22/2020 5:23:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

				CREATE PROCEDURE [dbo].[dmGetDocumentsToFullTextIndex]
				AS
				BEGIN
					SET NOCOUNT ON;

					SELECT TOP 30000 [DocumentKey],[FolderKey],[DocTypeKey],[DocumentTitle],[InsertDate]
					FROM [dmDocument]
					WHERE [NeedsFullTextIndex] = 1
					ORDER BY InsertDate DESC
				END
			
GO
