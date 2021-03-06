USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_CAH_GetDates]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CAH_GetDates]

AS

SET NOCOUNT ON;

BEGIN

DECLARE @T TABLE(DateKey DATETIME)

	--Get dates not in SalesFact table
	INSERT INTO @T(DateKey)
	SELECT DISTINCT [INV_DATE]
	FROM [dbo].[CHPH_AAP]
	WHERE [INV_DATE] >= '20170107'
	ORDER BY [INV_DATE] ASC
	
	SELECT ca.RN
	, ca.DateKey
	FROM(SELECT ROW_NUMBER() OVER(ORDER BY (SELECT NULL)) AS RN
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
	ORDER BY DateKey ASC, RN ASC

END
GO
