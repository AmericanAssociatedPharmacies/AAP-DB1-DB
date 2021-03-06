USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vwTerritoryADLogin]    Script Date: 12/22/2020 9:24:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwTerritoryADLogin]

AS


SELECT TOP 100 PERCENT dt.Territory
, dt.ADLogin
FROM(SELECT Territory
	, CONVERT(VARCHAR(25), LEFT(FirstName, 1) + LastName) AS ADLogin
	FROM dbo.PM_Territory
	WHERE Territory NOT IN('00', '99')
	) AS dt
ORDER BY dt.Territory ASC
GO
