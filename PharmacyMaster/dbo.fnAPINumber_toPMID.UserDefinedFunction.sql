USE [PharmacyMaster]
GO
/****** Object:  UserDefinedFunction [dbo].[fnAPINumber_toPMID]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--The purpose of this view is to get a comprehensive list of APIAccount numbers.
--This is mostly for the use case of APIAccountNumbers that have multiple PMIDs, example BIA and POA.
--For the APIAccount numbers that are -BIA or -POA, the results return the APIAccountNo
--that was active at the time of the date range. 

CREATE FUNCTION [dbo].[fnAPINumber_toPMID] (

	@in_month varchar(2)
	, @in_year varchar(4)

)

RETURNS TABLE
AS


RETURN
(

	WITH single_API as
	(
		SELECT pm.*
		FROM PharmacyMaster.dbo.PM_Pharmacy as pm
		INNER JOIN (
					SELECT LEFT(APIAccountNo,8) as APIAccountNo
						, COUNT(*) as Cnt
					FROM PharmacyMaster.dbo.PM_Pharmacy
					GROUP BY LEFT(APIAccountNo,8)
					HAVING COUNT(*) = 1
					) as a
		ON LEFT(pm.APIAccountNo, 8) = LEFT(a.APIAccountNo,8)
	),

	multPMID_API as
	(
		SELECT pm.*
		FROM PharmacyMaster.dbo.PM_Pharmacy as pm
		INNER JOIN (
					SELECT LEFT(APIAccountNo,8) as APIAccountNo
						, COUNT(*) as Cnt
					FROM PharmacyMaster.dbo.PM_Pharmacy
					WHERE APIAccountNo IS NOT NULL 
					AND APIAccountNo <> ''
					GROUP BY LEFT(APIAccountNo,8)
					HAVING COUNT(*) > 1
					) as a
		ON LEFT(pm.APIAccountNo, 8) = LEFT(a.APIAccountNo,8)
	), 

	multPMID_APIActive as
	(
		SELECT *
		FROM multPMID_API
		WHERE APIAccountNo IS NOT NULL 
		AND APIAccountNo <> '' --apiaccount
		AND (AAPAccountNo IS NULL --doesn't have to be aap account
			AND AAPAccountNo <> '' --doesn't have to be aap account
			OR (AAPAccountNo IS NOT NULL --if it is an aapaccount
				AND (@in_month + '/01/' + @in_year) >= AAPEffectiveDate	--date is greater than start date
				AND (@in_month + '/01/' + @in_year) < ISNULL(AAPQuitDate, GETDATE()) -- or the date is less that the quit date
				)
			)
	)

	SELECT *
	FROM single_API

	UNION

	SELECT *
	FROM multPMID_APIActive
)
GO
