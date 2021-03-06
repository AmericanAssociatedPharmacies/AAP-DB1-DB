USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_CAHDatesToPull_SalesETL]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CAHDatesToPull_SalesETL]

	@MaxID INT

AS

SET NOCOUNT ON

BEGIN


DECLARE @T TABLE(DateKey DATETIME)

	----Get dates not in SalesFact table
	--INSERT INTO @T(DateKey)
	--SELECT DISTINCT cast(CONVERT(varchar(20),B.InvDate,112) as INT) AS DateKey
	--FROM dbo.CHPH_AAP AS B
	--CROSS APPLY(SELECT MAX(INV_DATE) AS INV_DATE
	--				FROM dbo.CHPH_AAP	
	--			) AS ca
	--WHERE B.ID > ca.MaxID
	----WHERE B.InvDate >= '20130101' ---- To be used for reloading only
	--ORDER BY DateKey ASC

	INSERT INTO @T(DateKey)
	SELECT DISTINCT INV_DATE AS DateKey
	FROM dbo.CHPH_AAP
	WHERE ID > @MaxID

	
	---- Truncate table and reload to get dates to load
	--TRUNCATE TABLE Staging.API_DatesToLoad

	--INSERT INTO Staging.API_DatesToLoad(RN, DateKey)
	SELECT ca.RN
	, ca.DateKey
	FROM(SELECT ROW_NUMBER() OVER(ORDER BY DateKey ASC) AS RN
			, DateKey
			FROM @T
		) AS dt
	CROSS APPLY(SELECT CASE
				WHEN dt.RN % 3 = 1 THEN 1
				WHEN dt.RN % 3 = 2 THEN 2
				ELSE 3
				END AS RN
				, DateKey
				FROM @T
				) AS ca
	WHERE dt.DateKey = ca.DateKey


	--UPDATE STATISTICS Staging.API_DatesToLoad

	--SELECT RN, DateKey
	--FROM Staging.API_DatesToLoad

END
GO
