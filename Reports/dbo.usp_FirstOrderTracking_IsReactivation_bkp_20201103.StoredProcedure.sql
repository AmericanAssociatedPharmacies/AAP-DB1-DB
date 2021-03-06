USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_FirstOrderTracking_IsReactivation_bkp_20201103]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_FirstOrderTracking_IsReactivation_bkp_20201103]

AS

SET NOCOUNT ON;

BEGIN

	DECLARE @Yesterday DATETIME

	SELECT @Yesterday = dateadd(day,-1, cast(getdate() as date))

	--Get 1st ordered date for new stores
	SELECT dt.PMID
	, dt.FirstDateOrdered
	INTO #foo
	FROM(SELECT PMID
		, MIN(InvDate) AS FirstDateOrdered
		FROM API.dbo.APISalesDetail
		WHERE ID > 0	
		GROUP BY PMID
		) AS dt
	WHERE FirstDateOrdered = @Yesterday

	--Get stores that have not bought in more than 1 yr for reactivations
	SELECT dt.PMID, dt.MaxInvDate
	INTO #foo2
	FROM(SELECT ca.PMID
		, DATEDIFF(dd, MIN(a.InvDate),  MAX(a.InvDate)) AS NumOfDaysOrders
		, MAX(a.InvDate) AS MaxInvDate
		FROM API.dbo.APISalesDetail AS a
		CROSS APPLY(SELECT PMID, APINumber, APIEffectiveDate, APIQuitDate
					FROM RXMaster.dbo.PharmacyDim AS pd
					WHERE APINumber IS NOT NULL
					AND a.WHAccountID = pd.APINumber
					AND a.PMID = pd.PMID
					AND a.InvDate BETWEEN pd.APIEffectiveDate AND pd.APIQuitDate
					) AS ca
		WHERE a.ID > 0	
		AND a.PMID = ca.PMID
		GROUP BY ca.PMID
		) AS dt
	WHERE dt.NumOfDaysOrders >= 365
	AND dt.MaxInvDate = @Yesterday

	--Get final results	
	SELECT dt.WHAccountID
	, dt.CustomerName
	, dt.InvNbr
	, dt.InvDate
	, dt.OrderNum
	, dt.MOT
	, dt.InvoiceTotal
	, dt.TrackNum
	, dt.RebateAmount
	, dt.IsReactivation
	FROM(SELECT CONVERT(VARCHAR(32), p.[APIAccountNo]) AS WHAccountID
		--, a.WHAccountID 
		, a.[CustomerName]
		, InvNbr
		, a.InvDate
		, a.OrderNbr AS OrderNum
		, a.CarrierDesc AS MOT
		, SUM(a.ExtSales) AS InvoiceTotal
		, CONVERT(VARCHAR(500), STUFF((SELECT ', '+ LTRIM(RTRIM(s.TrackNum))
										 FROM ShipmentInfo.[dbo].[ShipmentDataTable] AS s 
										WHERE a.OrderNbr = s.OrderNum 
										FOR XML PATH('')),1,1,''									
										)
								) AS TrackNum
		, IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM(FinalRebateAmount)) as RebateAmount
		, CONVERT(BIT,0) AS IsReactivation
		FROM API.dbo.APISalesDetail AS a
		INNER JOIN PharmacyMaster.dbo.PM_Pharmacy AS p ON a.PMID = p.PMID
		WHERE EXISTS(SELECT 1
						FROM #foo AS f
						WHERE a.PMID = f.PMID
						AND a.InvDate = f.FirstDateOrdered
						)
		GROUP BY p.[APIAccountNo]
		, a.[CustomerName]
		, InvNbr
		, a.InvDate
		, a.OrderNbr
		, a.CarrierDesc
		) AS dt
	WHERE dt.TrackNum IS NOT NULL
	

	UNION 

	SELECT dt.WHAccountID
	, dt.CustomerName
	, dt.InvNbr
	, dt.InvDate
	, dt.OrderNum
	, dt.MOT
	, dt.InvoiceTotal
	, dt.TrackNum
	, dt.RebateAmount
	, dt.IsReactivation
	FROM(SELECT CONVERT(VARCHAR(32), p.[APIAccountNo]) AS WHAccountID
		--a.WHAccountID 
		, a.[CustomerName]
		, InvNbr
		, a.InvDate
		, a.OrderNbr AS OrderNum
		, a.CarrierDesc AS MOT
		, SUM(a.ExtSales) AS InvoiceTotal
		, CONVERT(VARCHAR(500), STUFF((SELECT ', '+ LTRIM(RTRIM(s.TrackNum))
										 FROM ShipmentInfo.[dbo].[ShipmentDataTable] AS s 
										WHERE a.OrderNbr = s.OrderNum 
										FOR XML PATH('')),1,1,''
										)
							) AS TrackNum
		, IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM(FinalRebateAmount)) as RebateAmount
		, CONVERT(BIT,1) AS IsReactivation
		FROM API.dbo.APISalesDetail AS a
		INNER JOIN PharmacyMaster.dbo.PM_Pharmacy AS p ON a.PMID = p.PMID
		WHERE EXISTS(SELECT 1
						FROM #foo2 AS f
						--WHERE a.WHAccountID = f.WHAccountID
						WHERE a.PMID = f.PMID
						AND a.InvDate = f.MaxInvDate
						)
		GROUP BY p.[APIAccountNo]
		, a.[CustomerName]
		, InvNbr
		, a.InvDate
		, a.OrderNbr
		, a.CarrierDesc
		) AS dt
	

END

/* RequestID 2012

SELECT a.WHAccountID 
	, a.[CustomerName]
	, InvNbr
	, a.InvDate
	, a.OrderNbr AS OrderNum
	, a.CarrierDesc AS MOT
	, SUM(a.ExtSales) AS InvoiceTotal
	, s.TrackNum
	, IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM(FinalRebateAmount)) as RebateAmount
	, CONVERT(BIT,0) AS IsReactivation
	FROM API.dbo.APISalesDetail AS a
	INNER JOIN ShipmentInfo.[dbo].[ShipmentDataTable] AS s ON a.OrderNbr = s.OrderNum
	WHERE EXISTS(SELECT 1
					FROM #foo AS f
					WHERE a.WHAccountID = f.WHAccountID
					AND a.InvDate = f.FirstDateOrdered
					)
	GROUP BY a.WHAccountID 
	, a.[CustomerName]
	, InvNbr
	, a.InvDate
	, a.OrderNbr
	, a.CarrierDesc
	, s.TrackNum

	UNION 

	SELECT a.WHAccountID 
	, a.[CustomerName]
	, InvNbr
	, a.InvDate
	, a.OrderNbr AS OrderNum
	, a.CarrierDesc AS MOT
	, SUM(a.ExtSales) AS InvoiceTotal
	, s.TrackNum
	, IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM(FinalRebateAmount)) as RebateAmount
	, CONVERT(BIT,1) AS IsReactivation
	FROM API.dbo.APISalesDetail AS a
	INNER JOIN ShipmentInfo.[dbo].[ShipmentDataTable] AS s ON a.OrderNbr = s.OrderNum
	WHERE EXISTS(SELECT 1
					FROM #foo2 AS f
					WHERE a.WHAccountID = f.WHAccountID
					AND a.InvDate = f.MaxInvDate
					)
	GROUP BY a.WHAccountID 
	, a.[CustomerName]
	, InvNbr
	, a.InvDate
	, a.OrderNbr
	, a.CarrierDesc
	, s.TrackNum


















*/







GO
