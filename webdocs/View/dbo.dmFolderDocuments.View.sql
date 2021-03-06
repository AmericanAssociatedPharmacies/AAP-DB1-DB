USE [webdocs]
GO
/****** Object:  View [dbo].[dmFolderDocuments]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[dmFolderDocuments]
	AS
	SELECT dmFiler.FolderKey, dmDocument.DocumentKey, DocumentTitle, FileName,
		DocTypeKey, LocationKey, LastVerified, UserDefined1,
		UserDefined2, UserDefined3, UserDefined4, UserDefined5, UserDefined6, UserDefined7,
		UserDefined8, UserDefined9, UserDefined10, InsertDate,
		CONVERT(CHAR(200), DocumentTitle) + dmDocument.DocumentKey AS DocumentTitleKey,
		CONVERT(CHAR(256), FileName) + dmDocument.DocumentKey AS FileNameKey,
		CONVERT(CHAR(20), InsertDate, 120) + dmDocument.DocumentKey AS InsertDateKey,
		ExpireDate, CheckoutUserKey, UserDefined11, UserDefined12, UserDefined13, UserDefined14,
		UserDefined15, UserDefined17, UserDefined16, UserDefined18, UserDefined19, UserDefined20,
		UserDefined21, UserDefined22, UserDefined23, UserDefined24, UserDefined25, UserDefined26,
		UserDefined27, UserDefined28, UserDefined29, UserDefined30
	FROM dmDocument
	INNER JOIN dmFiler ON dmDocument.DocumentKey = dmFiler.DocumentKey
GO
