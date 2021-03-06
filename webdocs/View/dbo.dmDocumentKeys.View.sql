USE [webdocs]
GO
/****** Object:  View [dbo].[dmDocumentKeys]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[dmDocumentKeys]
	AS
	SELECT     DocumentKey, DocumentTitle, FileName, DocTypeKey, LocationKey, LastVerified, UserDefined1, UserDefined2, UserDefined3, UserDefined4,
							UserDefined5, UserDefined6, UserDefined7, UserDefined8, UserDefined9, UserDefined10, InsertDate, ExpireDate, CheckoutUserKey,
							CONVERT(CHAR(200), DocumentTitle) + DocumentKey AS DocumentTitleKey, CONVERT(CHAR(256), FileName) + DocumentKey AS FileNameKey,
							CONVERT(CHAR(20), InsertDate, 120) + DocumentKey AS InsertDateKey, UserDefined11, UserDefined12, UserDefined13, UserDefined14,
							UserDefined15, UserDefined16, UserDefined17, UserDefined18, UserDefined19, UserDefined20, UserDefined21, UserDefined22, UserDefined23,
							UserDefined24, UserDefined25, UserDefined26, UserDefined27, UserDefined28, UserDefined29, UserDefined30
	FROM         dbo.dmDocument
GO
