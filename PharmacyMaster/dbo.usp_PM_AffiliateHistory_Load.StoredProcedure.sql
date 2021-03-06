USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_PM_AffiliateHistory_Load]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [dbo].[usp_PM_AffiliateHistory_Load]

AS

SET NOCOUNT ON;

BEGIN

	--Update the GroupID column
	UPDATE x
	SET GroupID = g.Group_ID
	FROM [Staging].[PM_AffiliateHistory] AS x
	INNER JOIN dbo.PM_CRM_Affiliate_Lookup AS lp ON x.GroupName = lp.CRM
	INNER JOIN dbo.PM_Groups AS g ON lp.PM = g.Group_Name

	--Set affiliate terminations
	UPDATE x
	SET [EndDate] = [new_affiliationend]
	, [StatusCode] = statuscodename
	FROM [dbo].[PM_AffiliateHistory] AS x
	INNER JOIN [Staging].[PM_AffiliateHistory] AS s ON x.PMID = s.PMID
														AND x.GroupID = s.GroupID
	WHERE x.EndDate IS NULL
	AND s.statuscodename = 'Inactive'
	AND s.new_affiliationend IS NOT NULL

	--Load any new affiliates
	INSERT INTO [dbo].[PM_AffiliateHistory](PMID, GroupID, StartDate, EndDate, Reason, StatusCode)
	SELECT dt.PMID, dt.GroupID, dt.StartDate, dt.EndDate, dt.Reason, StatusCode
       FROM(SELECT CONVERT(INT,s.PMID) AS PMID
              , s.GroupID
              , CONVERT(DATETIME,s.new_affiliationstart) AS StartDate
              , ISNULL(CONVERT(DATETIME,s.new_affiliationend), '29991231') AS EndDate
              , CONVERT(VARCHAR(MAX),s.new_reason) AS Reason
			  , CONVERT(VARCHAR(50),statuscodename) AS StatusCode
              FROM [Staging].[PM_AffiliateHistory] AS s
              WHERE [new_affiliationend] IS NULL
              AND statuscodename = 'Active'
              AND PMID <> 999999 -- Remove Test PMID
              ) AS dt
     WHERE NOT EXISTS(SELECT 1
                        FROM [dbo].[PM_AffiliateHistory] AS p
                        WHERE dt.PMID = p.PMID
                        AND dt.GroupID = p.GroupID 
                        AND ISNULL(p.EndDate, '29991231') = dt.EndDate
                        AND p.StartDate = dt.StartDate
                        )
       AND dt.GroupID IS NOT NULL

	--Clean up records where they have been removed from Dynamics
	DELETE x
	FROM [dbo].[PM_AffiliateHistory] AS x
	WHERE NOT EXISTS(SELECT 1
						FROM [Staging].[PM_AffiliateHistory] AS s
						WHERE CONVERT(INT,s.PMID) = x.PMID
						AND s.GroupID = x.GroupID
						AND CONVERT(DATETIME,s.new_affiliationstart) = x.StartDate
						)

	DELETE x
	FROM [dbo].[PM_Groups_xref] AS x
	WHERE NOT EXISTS(SELECT 1
						FROM [dbo].[PM_AffiliateHistory] AS p
						WHERE x.PMID = p.PMID
						AND x.Group_ID = p.GroupID
					)

	/* Old code
	WHERE NOT EXISTS(SELECT 1
						FROM [dbo].[PM_AffiliateHistory] AS p
						WHERE dt.PMID = p.PMID
						AND dt.GroupID = p.GroupID	
						AND p.EndDate IS NULL
						)


	--SELECT dt.PMID, dt.GroupID, dt.StartDate, dt.EndDate, dt.Reason
	--FROM(SELECT CONVERT(INT,s.PMID) AS PMID
	--	, s.GroupID
	--	, CONVERT(DATETIME,s.new_affiliationstart) AS StartDate
	--	, CONVERT(DATETIME,s.new_affiliationend) AS EndDate
	--	, CONVERT(VARCHAR(MAX),s.new_reason) AS Reason
	--	FROM [Staging].[PM_AffiliateHistory] AS s
	--	WHERE [new_affiliationend] IS NULL
	--	AND statuscodename = 'Active'
	--	) AS dt
	--CROSS JOIN(SELECT MAX(ID) AS ID
	--			, PMID
	--			FROM [dbo].[PM_AffiliateHistory]
	--			GROUP BY PMID
	--			) AS cj
	--WHERE EXISTS(SELECT 1
	--					FROM [dbo].[PM_AffiliateHistory] AS p
	--					WHERE dt.PMID <> p.PMID
	--					AND dt.GroupID <> p.GroupID	
	--					AND p.ID = cj.ID
	--					AND p.EndDate <> dt.EndDate
	--					)
	--AND dt.GroupID IS NOT NULL
	*/



END






GO
