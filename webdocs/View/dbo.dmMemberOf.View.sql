USE [webdocs]
GO
/****** Object:  View [dbo].[dmMemberOf]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[dmMemberOf]
	AS
	SELECT dbo.dmMembership.GroupKey, dbo.dmGroup.GroupName, dbo.dmGroup.[Description], dbo.dmMembership.UserKey, dmGroup.GroupLoginMessage
	FROM dbo.dmMembership
	INNER JOIN dbo.dmGroup ON dbo.dmMembership.GroupKey = dbo.dmGroup.GroupKey
GO
