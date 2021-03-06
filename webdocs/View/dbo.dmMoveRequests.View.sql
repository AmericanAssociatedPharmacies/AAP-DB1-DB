USE [webdocs]
GO
/****** Object:  View [dbo].[dmMoveRequests]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[dmMoveRequests]
	AS
	SELECT dbo.dmDocument.DocumentKey, DATEDIFF(dd,
		dbo.dmDocument.LocationInsertDate, GETDATE())
		AS DaysInLocation,
		dbo.dmExpireByTypeInLocation.ExpirationDays,
		dbo.dmExpireByTypeInLocation.TargetLocation
	FROM dbo.dmExpireByTypeInLocation INNER JOIN
		dbo.dmDocument ON
		dbo.dmExpireByTypeInLocation.DocTypeKey = dbo.dmDocument.DocTypeKey
			AND
		dbo.dmExpireByTypeInLocation.FromLocation = dbo.dmDocument.LocationKey
			AND
		dbo.dmExpireByTypeInLocation.ExpirationDays < DATEDIFF(dd,
			dbo.dmDocument.LocationInsertDate, GETDATE()) INNER JOIN
		dbo.dmLocation ON
		dbo.dmExpireByTypeInLocation.TargetLocation = dbo.dmLocation.LocationKey
GO
