USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_30daysLastPurchase]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_30daysLastPurchase]


AS

SET NOCOUNT ON;

BEGIN

DECLARE @StartYear DATETIME
, @CurrentDate DATETIME

	--@StartYear is 1st date of previous year
	SET @StartYear = DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) - 1, 0)
	SET @CurrentDate = DATEADD(DAY, 0, DATEDIFF(DAY, 0, GETDATE()))


	SELECT p.AccountName
	, p.Territory
	, CONVERT(DATE, dt.LastPurchaseDate) AS LastPurchaseDate
	, FORMAT(dt.SalesYTD, 'C', 'en-us') AS SalesYTD
	, dt.DaysSinceLastPurchase AS DaysSinceLastPurchase
	, p.Email
	FROM(SELECT WHAccountID
			, MAX([InvDate]) AS LastPurchaseDate
			, SUM(ExtSales) AS SalesYTD
			, DATEDIFF(dd, MAX([InvDate]), GETDATE()) AS DaysSinceLastPurchase
			FROM API.[dbo].[APISalesDetail]
			WHERE InvDate >= @StartYear
			AND InvDate < @CurrentDate
			AND Qty > 0
			GROUP BY WHAccountID
		) AS dt
	INNER JOIN PharmacyMaster.dbo.PM_Pharmacy AS p ON dt.WHAccountID = p.APIAccountNo
	WHERE dt.DaysSinceLastPurchase >= 30
	AND APIAccountNo IS NOT NULL 
	AND APIAccountNo != '' 
	AND	APIAccountNo NOT LIKE '%-%' 
	AND	APIStatus  = 'ACTIVE'
	ORDER BY p.AccountName ASC

END

GO
