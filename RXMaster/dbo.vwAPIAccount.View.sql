USE [RXMaster]
GO
/****** Object:  View [dbo].[vwAPIAccount]    Script Date: 12/22/2020 9:34:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAPIAccount]

AS

SELECT dt.PMID, dt.APIAccountNo, dt.APIAccountNumHistorical, dt.APIAccountNumHistoricalEndDate, dt.APIEffectiveDate, dt.APIQuitDate
FROM(SELECT p.PMID, p.[APIAccountNumHistorical] AS APIAccountNo, p.[APIAccountNumHistorical], p.[APIAccountNumHistoricalEndDate], ISNULL(pd.[APIEffectiveDate],'19000101') AS APIEffectiveDate, ISNULL(pd.[APIQuitDate], '29991231') AS APIQuitDate
	FROM PharmacyMaster.dbo.PM_Pharmacy AS p
	INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON p.PMID = pd.PMID
	WHERE p.[APIAccountNumHistorical] IS NOT NULL

	UNION

	SELECT p.PMID, p.APIAccountNo AS APIAccountNo, p.[APIAccountNumHistorical], p.[APIAccountNumHistoricalEndDate], ISNULL(pd.[APIEffectiveDate],'19000101') AS APIEffectiveDate, ISNULL(pd.[APIQuitDate], '29991231') AS APIQuitDate
	FROM PharmacyMaster.dbo.PM_Pharmacy AS p
	INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON p.PMID = pd.PMID
	WHERE p.APIAccountNo IS NOT NULL
	) AS dt


GO
