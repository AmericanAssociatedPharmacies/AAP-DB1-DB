USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIDailySummary_Load]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_APIDailySummary_Load]

AS


SET NOCOUNT ON;

BEGIN

	--Load table
	INSERT INTO API.[dbo].[APIDailySummary](API#, InvDate, InvDateKey, OrderType, DailySales ,OrderedUnits)
	SELECT dt.API#
	, dt.InvDate
	, dt.InvDateKey
	, dt.OrderType
	, dt.DailySales
	, dt.OrderedUnits
	FROM(SELECT LEFT([WHAccountID], 8) AS API#
				  , InvDate
				  , CAST(CONVERT(VARCHAR(8), InvDate, 112) AS INT) AS InvDateKey
				  , [Type] AS OrderType
				  , SUM(ExtSales) AS DailySales
				  , SUM(Qty) as OrderedUnits
				 -- , COUNT([APIItemNbr]) AS OrderedUnits
				  FROM API.[dbo].[APISalesDetail] AS ad
				  WHERE InvDate >= '20170101'
				  AND Type = 'Generic'
				  AND EXISTS(SELECT 1
							  FROM [PharmacyMaster].dbo.[v_PM_AllWithAffiliates] AS a
							  WHERE a.APIStatus IN ('ACTIVE', 'SUSPENDED')
							  AND LEFT(a.[APIAccountNo], 8)	= LEFT(ad.[WHAccountID], 8)
							)
				  GROUP BY WHAccountID
				  , InvDate
				  , [Type]
		   ) AS dt
	WHERE NOT EXISTS(SELECT 1
						FROM API.[dbo].[APIDailySummary] AS ad
						WHERE dt.API# = ad.API#
						AND dt.InvDateKey = ad.InvDateKey
						)
	ORDER BY API# ASC, dt.InvDateKey ASC, dt.OrderType ASC

	--Update stats
	UPDATE STATISTICS [dbo].[APIDailySummary]

END
GO
