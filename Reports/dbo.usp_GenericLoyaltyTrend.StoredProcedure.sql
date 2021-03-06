USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_GenericLoyaltyTrend]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_GenericLoyaltyTrend]


AS

SET NOCOUNT ON;

BEGIN

DECLARE @StartYear DATETIME
, @CurrentDate DATETIME
, @GenLoyalty MONEY

	SET @StartYear = DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)
	SET @CurrentDate = DATEADD(DAY, 0, DATEDIFF(DAY, 0, GETDATE()))
	SET @GenLoyalty = 36000.00


	SELECT p.AccountName
	, ISNULL(t.FirstName +  ' ' + t.LastName, '') AS TMName
	, dt.LastPurchaseDate
	, dt.GenericLoyaltyTrend
	FROM(SELECT WHAccountID
			, Territory
			, MAX([InvDate]) AS LastPurchaseDate
			, CONVERT(MONEY, (SUM(ExtSales) - @GenLoyalty)) AS GenericLoyaltyTrend
			FROM API.[dbo].[APISalesDetail]
			WHERE InvDate >= @StartYear
			AND InvDate < @CurrentDate
			AND Qty > 0
			GROUP BY WHAccountID
			, Territory
		) AS dt
	INNER JOIN PharmacyMaster.dbo.PM_Pharmacy AS p ON dt.WHAccountID = p.APIAccountNo
	LEFT OUTER JOIN PharmacyMaster.dbo.PM_Territory AS t ON t.Territory = p.Territory
	WHERE dt.GenericLoyaltyTrend < 0
	ORDER BY p.AccountName ASC

END
GO
