USE [Purchases]
GO
/****** Object:  UserDefinedFunction [dbo].[ufn_CAH_PMID_Dates]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[ufn_CAH_PMID_Dates]()
RETURNS @T TABLE(PMID INT NOT NULL
						, APIAccountNo VARCHAR(15) NOT NULL
						, StartDate DATETIME NOT NULL
						, EndDate DATETIME NOT NULL
						, PRIMARY KEY(APIAccountNo ASC, PMID ASC)
						)

AS

BEGIN

	--Declare table varaible
	DECLARE @T1 TABLE(RN INT
						, PMID INT NOT NULL 
						, APIAccountNo VARCHAR(15) NOT NULL
						, AAPEffectiveDate DATETIME NOT NULL
						, AAPQuitDate DATETIME NOT NULL
						)

	DECLARE @T2 TABLE(SeqNo INT
						, PMID INT NOT NULL 
						, APIAccountNo VARCHAR(15) NOT NULL
						, StartDate DATETIME NOT NULL
						, EndDate DATETIME NOT NULL
						)

	INSERT INTO @T1(RN,PMID,APIAccountNo,AAPEffectiveDate,AAPQuitDate)
	SELECT CONVERT(INT, RANK() OVER(PARTITION BY dt.APIAccountNo  ORDER BY dt.APIAccountNo ASC , dt.PMID DESC)) AS RN
	, dt.PMID
	, dt.APIAccountNo
	, dt.AAPEffectiveDate
	, dt.AAPQuitDate
	FROM(SELECT 
		p.PMID
		, p.APIAccountNo
		, ISNULL(p.AAPStartDate,'19000101') AS AAPEffectiveDate
		, ISNULL(p.AAPEndDate, '29991231') AS AAPQuitDate
		FROM(SELECT PMID, LEFT(APIAccountNo,8) AS APIAccountNo
			FROM Staging.CAHAccounts
			WHERE APIAccountNo IS NOT NULL
			) AS dt
		INNER JOIN Staging.CAHAccounts AS p ON dt.APIAccountNo = LEFT(p.APIAccountNo,8)
												AND dt.PMID = p.PMID
		INNER JOIN(SELECT APIAccountNo
					, COUNT(*) AS C1
					FROM Staging.CAHAccounts
					WHERE APIAccountNo IS NOT NULL
					GROUP BY APIAccountNo
					) AS ij ON p.APIAccountNo = ij.APIAccountNo
		WHERE ij.C1 > 1
		AND EXISTS(SELECT 1
					FROM PharmacyMaster.dbo.PM_Pharmacy AS p
					WHERE dt.PMID = p.PMID
					AND p.AAPStatus IS NOT NULL
					)
		) AS dt


	; WITH cte
	AS (SELECT a.RN, a.PMID, a.APIAccountNo, a.AAPEffectiveDate, a.AAPQuitDate
		FROM(SELECT PMID
					, MIN(RN) AS SeqNo
					FROM @T1
					GROUP BY PMID
					) AS dt
		INNER JOIN @T1 AS a ON dt.SeqNo = a.RN
								AND dt.PMID = a.PMID
		
 
		UNION ALL
 
		SELECT b.RN, b.PMID, b.APIAccountNo, b.AAPEffectiveDate, DATEADD(DAY, -1, a.AAPEffectiveDate) AS EndDate
		FROM cte AS a
		INNER JOIN @T1 AS b ON a.APIAccountNo = b.APIAccountNo
								AND b.RN = a.RN + 1
	 )

	INSERT INTO @T2(SeqNo, PMID, APIAccountNo, StartDate, EndDate)
	SELECT RN, PMID, APIAccountNo, AAPEffectiveDate, AAPQuitDate
	FROM cte 
	ORDER BY RN ASC
	OPTION(MAXRECURSION 0)


	INSERT INTO @T(PMID, APIAccountNo, StartDate, EndDate)
	SELECT dt.PMID, dt.APIAccountNo, dt.StartDate, dt.EndDate
	FROM(SELECT ROW_NUMBER() OVER(PARTITION BY SeqNo, PMID, APIAccountNo ORDER BY SeqNo DESC, PMID ASC, StartDate ASC, EndDate ASC) AS RN
			, PMID
			, APIAccountNo
			, StartDate
			, EndDate
			FROM @T2
		) AS dt
	WHERE dt.RN = 1
	ORDER BY APIAccountNo ASC, PMID ASC
	RETURN


END
GO
