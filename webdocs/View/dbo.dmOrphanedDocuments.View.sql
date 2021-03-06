USE [webdocs]
GO
/****** Object:  View [dbo].[dmOrphanedDocuments]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[dmOrphanedDocuments]
	WITH SCHEMABINDING
	AS
	SELECT dmDocument.DocumentKey, DocumentTitle, FileName, DocTypeKey, LocationKey, LastVerified, UserDefined1, UserDefined2, UserDefined3, UserDefined4,
			UserDefined5, UserDefined6, UserDefined8, UserDefined7, UserDefined9, UserDefined10, UserDefined11, UserDefined12, UserDefined13,
			UserDefined14, UserDefined15, UserDefined16, UserDefined17, UserDefined18, UserDefined19, UserDefined20, InsertDate, CheckoutUserKey,
			ExpireDate, UserDefined21, UserDefined22, UserDefined23, UserDefined24, UserDefined25, UserDefined26, UserDefined27, UserDefined28,
			UserDefined29, UserDefined30, CONVERT(CHAR(20), InsertDate, 120) + dmDocument.DocumentKey AS InsertDateKey,
			CONVERT(CHAR(200), DocumentTitle) + dmDocument.DocumentKey AS DocumentTitleKey, CONVERT(CHAR(256), FileName) + dmDocument.DocumentKey AS FileNameKey
	FROM dbo.dmDocument
	INNER JOIN dbo.dmDeletedDocuments
	ON dmDocument.DocumentKey = dmDeletedDocuments.DocumentKey
GO
