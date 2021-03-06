USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[vwConferenceCredits]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwConferenceCredits]

AS

SELECT TOP 100 PERCENT dt.Date, dt.PMID, dt.Rebate
FROM(SELECT Date, PMID, Rebate
	FROM pharmacymaster.dbo.PM_Rebates_Conference
	WHERE Date BETWEEN '20180101' AND '20190501'
	AND PMID IS NOT NULL

	UNION

	SELECT Date, PMID, [ConferenceCreditOnePercent] AS Rebate
	FROM [dbo].[PM_Rebates_APIMonthly]
	WHERE Date >= '20190601'
	) AS dt
ORDER BY dt.Date ASC, dt.PMID ASC
GO
