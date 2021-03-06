USE [webdocs]
GO
/****** Object:  View [dbo].[dmNotMemberOf]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

	CREATE VIEW [dbo].[dmNotMemberOf]
	AS
	SELECT DISTINCT
		dbo.dmUser.UserKey, dbo.dmGroup.GroupKey,
		dbo.dmGroup.GroupName, dbo.dmGroup.[Description], dmGroup.GroupLoginMessage
	FROM dbo.dmUser, dbo.dmGroup
	WHERE ((dbo.dmUser.UserKey + dbo.dmGroup.GroupKey)
		NOT IN
			(SELECT UserKey + GroupKey
			FROM dmMembership))
GO
