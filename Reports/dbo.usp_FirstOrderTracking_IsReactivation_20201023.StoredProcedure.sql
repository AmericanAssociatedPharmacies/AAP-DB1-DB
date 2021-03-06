USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_FirstOrderTracking_IsReactivation_20201023]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_FirstOrderTracking_IsReactivation_20201023]

AS

SET NOCOUNT ON;

BEGIN


	DECLARE @StartDate DATETIME
	, @EndDate DATETIME
	, @PreviousBusinessDate DATETIME

	--Get previous business day. Get one day less than previous business day and 365 days retro from that.	
	SELECT @StartDate = DATEADD(YEAR, -1, DATEADD(DAY,-1,MAX(TheDate))) 
	, @EndDate = DATEADD(DAY,-1,MAX(TheDate)) 
	, @PreviousBusinessDate = MAX(TheDate) 
	FROM ODSIntake.dbo.DateDim
	WHERE IsWeekDay = 1
	AND TheDate < CONVERT(DATE, GETDATE())


	--Get 1st ordered date for new stores. This will look at API Account #'s (pre and post S2k) and will show the most current PMID regardless of history.
	SELECT dt.PMID, dt.FirstDateOrdered
	INTO #foo
	FROM(SELECT cj.PMID
		, MIN(InvDate) AS FirstDateOrdered
		FROM API.dbo.APISalesDetail AS a
		CROSS JOIN(SELECT pm.PMID, pm.APIAccountNo, pm.APIAccountNumHistorical, pd.APIEffectiveDate, pd.APIQuitDate
					FROM PharmacyMaster.dbo.PM_Pharmacy AS pm
					INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON pm.PMID = pd.PMID
					WHERE pd.APIEffectiveDate IS NOT NULL	
					AND pm.APIAccountNo IS NOT NULL
					) AS cj
		WHERE a.ID > 0	
		AND (a.WHAccountID = cj.APIAccountNo
				OR a.WHAccountID = cj.APIAccountNumHistorical
			)
		GROUP BY cj.PMID
		) AS dt
	WHERE dt.FirstDateOrdered = @PreviousBusinessDate

	--Get stores for reactivation
	;WITH 
	CTE1 AS --Get all PMID's
		(SELECT PMID
			FROM RXMaster.dbo.PharmacyDim
			WHERE APIEffectiveDate IS NOT NULL	
		)
	, CTE2 AS -- Get complete list of all PMID's that did not have sales in the previous 365 days. 
		(SELECT a.PMID, ISNULL(b.YearCount, 0) AS YearCount	
			FROM CTE1 AS a
			LEFT OUTER JOIN(SELECT cj.PMID, COUNT(*) AS YearCount
							FROM API.dbo.APISalesDetail AS a
							CROSS JOIN(SELECT pm.PMID, pm.APIAccountNo, pm.APIAccountNumHistorical, pd.APIEffectiveDate, pd.APIQuitDate
										FROM PharmacyMaster.dbo.PM_Pharmacy AS pm
										INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON pm.PMID = pd.PMID
										WHERE pd.APIEffectiveDate IS NOT NULL	
										AND pm.APIAccountNo IS NOT NULL
										) AS cj
							WHERE a.ID > 0	
							AND (a.WHAccountID = cj.APIAccountNo
									OR a.WHAccountID = cj.APIAccountNumHistorical
								)
							AND a.InvDate BETWEEN cj.APIEffectiveDate AND cj.APIQuitDate
							AND a.InvDate BETWEEN @StartDate AND @EndDate
							GROUP BY cj.PMID
							) AS b ON a.PMID = b.PMID
			WHERE b.YearCount IS NULL
		)	
	, CTE3 AS -- Results from CTE2 and had sales prior to 1 year and didn't have sales over the previous 365 days.
		(SELECT dt.PMID, cj.PreviousYrCount
			FROM(SELECT PMID
				FROM CTE2
				WHERE YearCount = 0
			) AS dt
		CROSS JOIN(SELECT cj.PMID, COUNT(*) AS PreviousYrCount
							FROM API.dbo.APISalesDetail AS a
							CROSS JOIN(SELECT pm.PMID, pm.APIAccountNo, pm.APIAccountNumHistorical, pd.APIEffectiveDate, pd.APIQuitDate
										FROM PharmacyMaster.dbo.PM_Pharmacy AS pm
										INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON pm.PMID = pd.PMID
										WHERE pd.APIEffectiveDate IS NOT NULL	
										AND pm.APIAccountNo IS NOT NULL
										) AS cj
							WHERE a.ID > 0	
							AND (a.WHAccountID = cj.APIAccountNo
									OR a.WHAccountID = cj.APIAccountNumHistorical
								)
							AND a.InvDate < @StartDate 
							AND a.InvDate BETWEEN cj.APIEffectiveDate AND cj.APIQuitDate
							GROUP BY cj.PMID
					) AS cj
		WHERE dt.PMID = cj.PMID
		AND cj.PreviousYrCount > 0			
		) 
	, CTE4 AS -- Results from CTE3 and had 1st sales based on previous business date. Results from CTE4 show any reactivation PMID's.
		(SELECT c.PMID, d.MinInvDate
		 FROM CTE3 AS c
		 INNER JOIN(SELECT dt.PMID
					, ca.MinInvDate  
					FROM(SELECT pm.PMID, pm.APIAccountNo, pm.APIAccountNumHistorical, pd.APIEffectiveDate, pd.APIQuitDate
								FROM PharmacyMaster.dbo.PM_Pharmacy AS pm
								INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON pm.PMID = pd.PMID
								WHERE pd.APIEffectiveDate IS NOT NULL	
								AND pm.APIAccountNo IS NOT NULL
						) AS dt
					CROSS APPLY(SELECT dt.PMID
								, MAX(InvDate) AS MinInvDate -- "Min" InvDate for a reactivation...as in the 1st date of sales since for the reactivation
								FROM API.dbo.APISalesDetail AS a
								WHERE a.ID > 0	
								AND a.InvDate = @PreviousBusinessDate
								AND a.InvDate BETWEEN dt.APIEffectiveDate AND dt.APIQuitDate
								AND (a.WHAccountID = dt.APIAccountNo
										OR a.WHAccountID = dt.APIAccountNumHistorical
									)								
								GROUP BY a.PMID
							  ) AS ca
					WHERE dt.PMID = ca.PMID 
					) AS d ON c.PMID = d.PMID		
		)
		SELECT PMID, MinInvDate
		INTO #foo2
		FROM CTE4

	--Get final results	
	
	--1st Order
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
		, TRY_CONVERT(DECIMAL(15,2),IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM(FinalRebateAmount))) AS RebateAmount
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

	--Reactivation
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
		, TRY_CONVERT(DECIMAL(15,2),IIF(COUNT(DISTINCT APIItemNbr) < 5, 0, SUM(FinalRebateAmount))) AS RebateAmount
		, CONVERT(BIT,1) AS IsReactivation
		FROM API.dbo.APISalesDetail AS a
		INNER JOIN PharmacyMaster.dbo.PM_Pharmacy AS p ON a.PMID = p.PMID
		WHERE EXISTS(SELECT 1
						FROM #foo2 AS f
						--WHERE a.WHAccountID = f.WHAccountID
						WHERE a.PMID = f.PMID
						AND a.InvDate = f.MinInvDate
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

/* Invalid SQL code
	--SELECT dt.PMID
	--, dt.FirstDateOrdered
	--INTO #foo
	--FROM(SELECT PMID
	--	, MIN(InvDate) AS FirstDateOrdered
	--	FROM API.dbo.APISalesDetail
	--	WHERE ID > 0	
	--	GROUP BY PMID
	--	) AS dt
	--WHERE FirstDateOrdered = @PreviousBusinessDate
	*/

	----Get stores that have not bought in more than 1 yr
	--;WITH 
	--CTE1 AS --Get all PMID's
	--(SELECT PMID, APIEffectiveDate, APIQuitDate
	--	FROM RXMaster.dbo.PharmacyDim
	--	WHERE APIEffectiveDate IS NOT NULL	
	--)
	--, CTE2 AS -- Get complete list of all PMID's that did not have sales in the previous 365 days. 
	--(SELECT a.PMID, ISNULL(b.YearCount, 0) AS YearCount	
	--	FROM CTE1 AS a
	--	LEFT OUTER JOIN(SELECT cj.PMID, COUNT(*) AS YearCount
	--					FROM API.dbo.APISalesDetail AS a
	--					CROSS JOIN(SELECT pm.PMID, pm.APIAccountNo, pm.APIAccountNumHistorical, pd.APIEffectiveDate, pd.APIQuitDate
	--								FROM PharmacyMaster.dbo.PM_Pharmacy AS pm
	--								INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON pm.PMID = pd.PMID
	--								WHERE pd.APIEffectiveDate IS NOT NULL	
	--								AND pm.APIAccountNo IS NOT NULL
	--								) AS cj
	--					WHERE a.ID > 0	
	--					AND (a.WHAccountID = cj.APIAccountNo
	--							OR a.WHAccountID = cj.APIAccountNumHistorical
	--						)
	--					AND a.InvDate BETWEEN @StartDate AND @EndDate
	--					GROUP BY cj.PMID
	--					) AS b ON a.PMID = b.PMID
	--	--LEFT OUTER JOIN(SELECT PMID, COUNT(*) AS YearCount	
	--	--				FROM  API.dbo.APISalesDetail 
	--	--				WHERE InvDate BETWEEN @StartDate AND @EndDate
	--	--				AND ID > 0
	--	--				GROUP BY PMID
	--	--				) AS b ON a.PMID = b.PMID
	--	WHERE b.YearCount IS NULL
	--)
	--, CTE3 AS -- Results from CTE2 and had sales prior to 1 year and didn't have sales over the previous 365 days.
	--(SELECT dt.PMID, cj.PreviousYrCount
	-- FROM(SELECT PMID
	--		FROM CTE2
	--		WHERE YearCount = 0
	--	) AS dt
	--CROSS JOIN(SELECT cj.PMID, COUNT(*) AS PreviousYrCount
	--					FROM API.dbo.APISalesDetail AS a
	--					CROSS JOIN(SELECT pm.PMID, pm.APIAccountNo, pm.APIAccountNumHistorical, pd.APIEffectiveDate, pd.APIQuitDate
	--								FROM PharmacyMaster.dbo.PM_Pharmacy AS pm
	--								INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON pm.PMID = pd.PMID
	--								WHERE pd.APIEffectiveDate IS NOT NULL	
	--								AND pm.APIAccountNo IS NOT NULL
	--								) AS cj
	--					WHERE a.ID > 0	
	--					AND (a.WHAccountID = cj.APIAccountNo
	--							OR a.WHAccountID = cj.APIAccountNumHistorical
	--						)
	--					AND a.InvDate < @StartDate 
	--					GROUP BY cj.PMID
	--			) AS cj
	----CROSS JOIN(SELECT PMID, COUNT(*) AS PreviousYrCount
	----			FROM API.dbo.APISalesDetail
	----			WHERE InvDate < @StartDate 
	----			AND ID > 0
	----			GROUP BY PMID
	----			) AS cj
	--WHERE dt.PMID = cj.PMID
	--AND cj.PreviousYrCount > 0			
	--) 
	--, CTE4 AS -- Results from CTE3 and had 1st sales based on previous business date. Results from CTE4 show any reactivation PMID's.
	--(SELECT dt.PMID, dt.MinInvDate
	--	FROM(SELECT a.PMID
	--		, MAX(InvDate) AS MinInvDate  -- "Min" InvDate for a reactivation
	--		FROM CTE3 AS a
	--		INNER JOIN API.dbo.APISalesDetail AS b ON a.PMID = b.PMID
	--		AND b.ID > 0
	--		GROUP BY a.PMID
	--		) AS dt
	--	WHERE dt.MinInvDate = @PreviousBusinessDate
	--)
	--SELECT PMID, MinInvDate
	--INTO #foo2
	--FROM CTE4


	/* Invalid SQL code	
	--SELECT dt2.PMID
	--, dt2.MaxInvDate
	--INTO #foo2
	--FROM API.dbo.APISalesDetail AS a
	--INNER JOIN(SELECT PMID, COUNT(*) AS YearCount
	--			FROM API.dbo.APISalesDetail
	--			WHERE InvDate BETWEEN @StartDate AND @EndDate
	--			GROUP BY PMID
	--			) AS dt1 ON a.PMID = dt1.PMID
	--INNER JOIN(SELECT PMID
	--			, MAX(InvDate) AS MaxInvDate
	--			, COUNT(*) AS YesterdayCount
	--			FROM API.dbo.APISalesDetail
	--			WHERE InvDate = @PreviousBusinessDate
	--			GROUP BY PMID
	--			) AS dt2 ON a.PMID = dt2.PMID
	--WHERE a.ID > 0	
	--AND dt1.YearCount = 0
	--AND dt2.YesterdayCount > 0
	*/




	--SELECT dt.PMID, dt.MaxInvDate
	--INTO #foo2
	--FROM(SELECT ca.PMID
	--	, DATEDIFF(dd, MIN(a.InvDate),  MAX(a.InvDate)) AS NumOfDaysOrders
	--	, MAX(a.InvDate) AS MaxInvDate
	--	FROM API.dbo.APISalesDetail AS a
	--	CROSS APPLY(SELECT PMID, APINumber, APIEffectiveDate, APIQuitDate
	--				FROM RXMaster.dbo.PharmacyDim AS pd
	--				WHERE APINumber IS NOT NULL
	--				AND a.WHAccountID = pd.APINumber
	--				AND a.PMID = pd.PMID
	--				AND a.InvDate BETWEEN pd.APIEffectiveDate AND pd.APIQuitDate
	--				) AS ca
	--	WHERE a.ID > 0	
	--	AND a.PMID = ca.PMID
	--	GROUP BY ca.PMID
	--	) AS dt
	--WHERE dt.NumOfDaysOrders >= 365
	--AND dt.MaxInvDate = @Yesterday








GO
