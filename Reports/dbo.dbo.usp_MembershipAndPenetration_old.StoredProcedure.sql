USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[dbo.usp_MembershipAndPenetration_old]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[dbo.usp_MembershipAndPenetration_old]
	@Date as DATE
AS
BEGIN

	SET NOCOUNT ON;

	DECLARE @FirstOfYear as DATE
	DECLARE @FollowingMonth as DATE 
	SET @FirstOfYear = DATEADD(yy, DATEDIFF(yy, 0, @Date), 0)
	SET @FollowingMonth = DATEADD(m, DATEDIFF(m, -1, @Date), 0)

	
	--Penetration
SELECT @Date
	, COUNT(*) as UniquePharmacies
	, SUM(a.Score_Sum) as Penetration
FROM (
	SELECT pm.PMID as PMID--ISNULL(api.PMID, ISNULL(aap.PMID, al.PMID)) as PMID
		, pm.AccountName
		, pm.AAPAccountNo
		, pm.APIAccountNo
		, aap.AAPEffectiveDate
		, aap.AAPQuitDate
		, pm.APIStatus
		, ISNULL(api.[API Goal],ISNULL(api_raw.[API Goal raw],0)) as [API]
		, ISNULL(aap.[AAP Compliant],0) as [AAP]
		, ISNULL(al.[Ally Scripts],0) as [Ally]
		, ISNULL(api.[API Goal],ISNULL(api_raw.[API Goal raw],0))  + ISNULL(aap.[AAP Compliant],0) + ISNULL(al.[Ally Scripts],0) as Score_Sum
		, CAST((ISNULL(api.[API Goal],ISNULL(api_raw.[API Goal raw],0))  + ISNULL(aap.[AAP Compliant],0) + ISNULL(al.[Ally Scripts],0)) as varchar) + ' / 3' as Penetration
		, ISNULL(api.[API Purchases],ISNULL(api_raw.[API Purchases raw],0))  as [API Goal: >=36k Purchases]
		, CASE aap.[AAP Compliant]
			WHEN 1 THEN 'Y'
			ELSE 'N'
			END AS [AAP Goal: Compliant]
		, ISNULL(al.[Rx Filled],0) as [Ally Scripts Goal: >= 2 Filled]
	FROM
		(SELECT DISTINCT PMID
			, 1 as [API Goal]
			, SUM(av.WHAPIGeneric) as [API Purchases]
		FROM PharmacyMaster.dbo.ALL_Volume as av
		WHERE Date >= @FirstOfYear AND Date < @FollowingMonth
		GROUP BY PMID
		HAVING SUM(av.WHAPIGeneric) >= 36000) as api
	FULL JOIN (
		SELECT pm.PMID
			, 1 as [API Goal raw]
			, SUM(a.ExtSales) as [API Purchases raw]
		FROM (SELECT WHAccountID
				, SUM(ExtSales) as ExtSales
			FROM API.dbo.APISalesDetail
			WHERE InvDate >= @FirstOfYear AND InvDate < @FollowingMonth
			AND Type = 'Generic'
			GROUP BY WHAccountID
			HAVING SUM(ExtSales) >= 36000
			) as a
		INNER JOIN PharmacyMaster.dbo.PM_Pharmacy as pm 
		ON a.WHAccountID = pm.APIAccountNo
		GROUP BY pm.PMID) as api_raw
	ON api.PMID = api_raw.PMID
	FULL JOIN(
		SELECT PMID
			, 1 as [AAP Compliant]
			, pm.AAPEffectiveDate
			, pm.AAPQuitDate
		FROM PharmacyMaster.dbo.PM_Pharmacy as pm
		WHERE pm.AAPAccountNo IS NOT NULL --Has AAPAccountNo
			AND AAPEffectiveDate < @FollowingMonth--Became a member on that date or prior
			AND (AAPQuitDate = '' OR AAPQuitDate IS NULL OR AAPQuitDate >= @FollowingMonth)) as aap
	ON api.PMID = aap.PMID
	FULL JOIN (
		SELECT pm.PMID
			, 1 as [Ally Scripts]
			, al.RxFilled as [Rx Filled]
		FROM Reports.dbo.KPIDash_AllyScripts as al
		INNER JOIN PharmacyMaster.dbo.PM_Pharmacy as pm
		ON pm.AAPAccountNo = CAST(al.AAPAccountNumber as varchar) OR pm.APIAccountNo = CAST(al.APIAccountNumber as varchar)
		WHERE al.RxFilled >= 2
		AND Date >= @FirstOfYear AND Date < @FollowingMonth) as al
	ON api.PMID = al.PMID OR aap.PMID = al.PMID
	INNER JOIN PharmacyMaster.dbo.PM_Pharmacy as pm
	ON api.PMID = pm.PMID OR aap.PMID = pm.PMID OR al.PMID = pm.PMID) as a
   
END
GO
