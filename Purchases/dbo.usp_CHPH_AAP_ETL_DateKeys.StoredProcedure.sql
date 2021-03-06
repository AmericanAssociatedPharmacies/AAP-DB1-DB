USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_CHPH_AAP_ETL_DateKeys]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[usp_CHPH_AAP_ETL_DateKeys]

	@MaxRowversion VARCHAR(50)

AS

SET NOCOUNT ON

BEGIN

	DECLARE @p1 VARBINARY(8)

	SET @p1 = CONVERT(VARBINARY(8), @MaxRowversion, 1);

	DECLARE @T TABLE(DateKey INT, MAXRowversionID VARBINARY(8))

	--Get the MIN RowversionID by DateKey to load multiple dates in parallel
	INSERT INTO @T(DateKey, MAXRowversionID)
	SELECT DateKey
	, CONVERT(VARBINARY(8),MIN(RowversionID)) AS MAXRowversionID
	FROM [dbo].[CHPH_AAP_ETL]
	WHERE [RowversionID]> @p1
	AND DateKey > 0
	GROUP BY DateKey
	ORDER BY DateKey ASC

	SELECT ca.RN
	, ca.DateKey
	, ca.MaxRowversionID
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
				, MaxRowversionID
				FROM @T
				) AS ca
	WHERE dt.DateKey = ca.DateKey


END




GO
