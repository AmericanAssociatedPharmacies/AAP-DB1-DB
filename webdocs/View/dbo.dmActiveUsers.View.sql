USE [webdocs]
GO
/****** Object:  View [dbo].[dmActiveUsers]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

	CREATE VIEW [dbo].[dmActiveUsers]
	AS
	SELECT UserKey, LoginName, LoginPassword, FirstName,
		LastName, Expiration, Email, Admin
	FROM dbo.dmUser
	WHERE (Active = 1) AND (Expiration IS NULL OR Expiration >= GETDATE())
GO
