USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_PenetrationByType]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[usp_PenetrationByType]
	@Date as DATE
AS
BEGIN

	SET NOCOUNT ON;

DECLARE @FirstOfYear as DATE --first of the year of @Date passed through
DECLARE @FollowingMonth as DATE -- month following the @Date passed through
DECLARE @MaxAuditedAPIDate as DATE --max date in audited API Sales data, All-Volume
DECLARE @UnauditedAPIStartDate as Date --Start date to use for unaudited API Sales Data (see formula below)

--Setting variables
SET @FirstOfYear = DATEADD(yy, DATEDIFF(yy, 0, @Date), 0)
SET @FollowingMonth = DATEADD(m, DATEDIFF(m, -1, @Date), 0)

--Set max date from audited API sales data
SELECT @MaxAuditedAPIDate = MAX(Date)
FROM PharmacyMaster.dbo.All_Volume

--Setting the start date to use for the unaudited API Sales Data
--If the FirstOfYear is greater than the max audited API data date, then use the first of the year, 
--else use the month following the max audited API sales data date
--e.g. @Date = Feb2018, @MaxAuditedAPIDate = Dec2017. We want our calculations to start at the first of the year for 2018. 
-- for this example, there are no audited data for 2018, so we start at the first of the year for 2018 in the unaudited data.
--e.g. @Date = Jul2018, @MaxAuditedAPIDate = Jun2018. We want to get audited data from Jan2018-Jun2018, and unaudited data through Jul2018 (Because Jul2018 is @Date passed through).
SELECT @UnauditedAPIStartDate = 
	CASE WHEN @FirstOfYear > @MaxAuditedAPIDate THEN @FirstOfYear
	ELSE DATEADD(m, DATEDIFF(m, -1, @MaxAuditedAPIDate), 0)
	END 

--
SELECT @Date	
	, 'API' as Type
	, SUM(ISNULL([API Goal], [API Goal unaud])) as Amount
	--, ISNULL(SUM([API Goal]),0) + ISNULL(SUM([API Goal unaud]),0) as Amount
FROM (SELECT DISTINCT PMID
		, 1 as [API Goal]
		FROM PharmacyMaster.dbo.ALL_Volume as av
		WHERE Date >= @FirstOfYear AND Date < @FollowingMonth
		GROUP BY PMID
		HAVING SUM(av.WHAPIGeneric) >= 36000
	) as api
FULL OUTER JOIN (SELECT pm.PMID as PMID_unaud
			, 1 as [API Goal unaud]
			FROM API.dbo.APISalesDetail as asd
			INNER JOIN PharmacyMaster.dbo.PM_Pharmacy as pm
			ON asd.WHAccountID = pm.APIAccountNo
			WHERE InvDate >= @FirstOfYear AND InvDate < @FollowingMonth
			AND Type = 'Generic'
			GROUP BY pm.PMID
			HAVING SUM(ExtSales) >= 36000
		)as api_unaud
ON api.PMID = api_unaud.PMID_unaud

UNION

SELECT @Date
	,'AAP' as Type
	, ISNULL(SUM([AAP Compliant]),0) as Amount
FROM (
	SELECT PMID
		, 1 as [AAP Compliant]
		, pm.AAPEffectiveDate
		, pm.AAPQuitDate
	FROM PharmacyMaster.dbo.PM_Pharmacy as pm
	WHERE pm.AAPAccountNo IS NOT NULL --Has AAPAccountNo
		AND AAPEffectiveDate < @FollowingMonth--Became a member on that date or prior
		AND (AAPQuitDate = '' OR AAPQuitDate IS NULL OR AAPQuitDate >= @FollowingMonth)) as aap

UNION

SELECT @Date
	,'AllyScripts' as Type
	, ISNULL(SUM([Ally Scripts]),0) as Amount
FROM (
	SELECT pm.PMID
		, 1 as [Ally Scripts]
		, SUM(al.RxFilled) as [Rx Filled]
	FROM Reports.dbo.KPIDash_AllyScripts as al
	INNER JOIN PharmacyMaster.dbo.PM_Pharmacy as pm
	ON pm.AAPAccountNo = al.AAPAccountNumber OR pm.APIAccountNo = al.APIAccountNumber
	WHERE Date >= @FirstOfYear AND Date < @FollowingMonth
	GROUP BY pm.PMID
	HAVING SUM(al.RxFilled) >= 2) as al

END








GO
