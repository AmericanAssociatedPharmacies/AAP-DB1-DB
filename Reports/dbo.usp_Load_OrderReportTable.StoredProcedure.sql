USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_Load_OrderReportTable]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [dbo].[usp_Load_OrderReportTable]


AS

SET NOCOUNT ON;

BEGIN

	DECLARE @CurrentYr DATETIME

	--SET @CurrentYr = CAST('01 Jan'+ DATENAME(YEAR,GETDATE()) AS datetime) 

	SELECT @CurrentYr = DATEADD(yy, DATEDIFF(yy, 0, MAX(InvDate)), 0)
	FROM API.dbo.APISalesDetail


	--Truncate Staging table
	TRUNCATE TABLE [Staging].[LastOrderSummary]

	--Get all sales data for current yr
	INSERT INTO [Staging].[LastOrderSummary](AccountName, City, API#, [Status], AppRecvd, APIActivated, TM)
	SELECT DISTINCT dt.AccountName
	, dt.City
	, dt.API#
	, [Status]
	, dt.AppRecvd
	, dt.APIActivated
	, TM
	FROM(SELECT AccountName
				, City
				, [APIAccountNo] AS API#
				, LEFT([APIAccountNo], 8) AS [WHAccountID]
				, APIStatus  AS [Status]
				, NULL AS [AppRecvd]
				, [AAPAccountNo] AS [AAP#]
				, NULL AS [APIActivated] 
				, a.TM
				FROM [PharmacyMaster].dbo.[v_PM_AllWithAffiliates] AS a
				WHERE APIStatus IN ('ACTIVE', 'SUSPENDED')
				AND [APIAccountNo] NOT LIKE '%-%'
				) AS dt
	INNER JOIN API.dbo.APISalesDetail AS a ON dt.WHAccountID = LEFT(a.[WHAccountID], 8) 
	WHERE a.InvDate >= @CurrentYr  
	AND Type = 'Generic'


	--Update LastOrder
	UPDATE [Staging].[LastOrderSummary]
	SET LastOrder = I.LastOrder
	FROM [Staging].[LastOrderSummary] AS dt 
	INNER JOIN(SELECT LEFT([WHAccountID], 8) AS WHAccountID
							, CONVERT(DATE, MAX(InvDate)) AS LastOrder
							FROM [API].[dbo].[APISalesDetail]
							WHERE InvDate >= @CurrentYr
							AND Type = 'Generic'
							AND DATEPART(dw, InvDate) >= 2
							AND DATEPART(dw, InvDate) < 7
							GROUP BY WHAccountID
											) AS I ON I.WHAccountID = dt.API# 


	--Update DaysLastOrder
	UPDATE [Staging].[LastOrderSummary]
	SET DaysLastOrder = j.DaysLastOrder
	FROM [Staging].[LastOrderSummary] AS dt 
	  INNER JOIN(SELECT dt.WHAccountID
					, ca.DaysLastOrder
					FROM(SELECT LEFT([WHAccountID], 8) AS WHAccountID
						, MAX(InvDate) AS MaxInvDate
						FROM [API].[dbo].[APISalesDetail]
						WHERE InvDate >= @CurrentYr
						AND Type = 'Generic'
						GROUP BY [WHAccountID]
						) AS dt
					CROSS APPLY(SELECT COUNT(*) AS DaysLastOrder
								FROM dbo.DateDim 
								WHERE TheDate > dt.MaxInvDate
								AND TheDate < DATEADD(DAY, 0, DATEDIFF(DAY, 0, GETDATE()))	
								AND IsWeekDay = 1		
							) AS ca
				   ) AS J ON J.WHAccountID = dt.API#


	--Update MaxUnits
	UPDATE [Staging].[LastOrderSummary]
	SET MaxUnits = K.MaxUnits
	FROM [Staging].[LastOrderSummary] AS dt 
	 INNER JOIN(SELECT dt.WHAccountID
					, MAX(dt.MaxUnits) AS MaxUnits
					FROM(SELECT LEFT([WHAccountID], 8) AS WHAccountID
								, InvDate
								, SUM(Qty) AS MaxUnits
								FROM [API].[dbo].[APISalesDetail] 
								WHERE InvDate >= @CurrentYr
								AND Type = 'Generic'
								AND DATEPART(dw, InvDate) >= 2
								AND DATEPART(dw, InvDate) < 7
								GROUP BY WHAccountID
								, InvDate 
								) AS dt       
								GROUP BY dt.WHAccountID                      
					   ) AS K ON K.WHAccountID = dt.API#


	--Update LastUnits
	UPDATE [Staging].[LastOrderSummary]
	SET LastUnits = M.LastUnits
	FROM [Staging].[LastOrderSummary] AS dt
	INNER JOIN(SELECT LEFT([WHAccountID], 8) AS WHAccountID
				, InvDate
				, SUM(Qty) AS LastUnits
				FROM [API].[dbo].[APISalesDetail]
				WHERE InvDate >= @CurrentYr 
				AND Type = 'Generic'
				AND DATEPART(dw, InvDate) >= 2
				AND DATEPART(dw, InvDate) < 7
				GROUP BY WHAccountID, InvDate                   
						) AS M ON M.WHAccountID = dt.API# AND M.InvDate = dt.LastOrder

	--Update YearToDateUnits
	UPDATE [Staging].[LastOrderSummary]
	SET YearToDateUnits = N.YearToDateUnits
	FROM [Staging].[LastOrderSummary]AS dt
		 INNER JOIN(SELECT LEFT([WHAccountID], 8) AS WHAccountID
					, CONVERT(INT, SUM(Qty))  AS YearToDateUnits
					 FROM [API].[dbo].[APISalesDetail]
					WHERE InvDate >= @CurrentYr
					AND Type = 'Generic'
					AND DATEPART(dw, InvDate) >= 2
					AND DATEPART(dw, InvDate) < 7
					GROUP BY WHAccountID 
									) AS N ON N.WHAccountID = dt.API#

	--Update #GRXOrders
	UPDATE [Staging].[LastOrderSummary]
	SET [#GRXOrders] = O.[#GRXOrders]
	FROM [Staging].[LastOrderSummary] AS dt
	   INNER JOIN(SELECT LEFT([WHAccountID], 8) AS WHAccountID
					, COUNT(DISTINCT InvDate) AS [#GRXOrders]
					FROM [API].[dbo].[APISalesDetail]
					WHERE [Type] = 'Generic'
					AND InvDate >= @CurrentYr 
					AND DATEPART(dw, InvDate) >= 2
					AND DATEPART(dw, InvDate) < 7
					GROUP BY [WHAccountID]
				   ) AS O ON O.WHAccountID = dt.API#


	--Update YTDSales
	UPDATE [Staging].[LastOrderSummary]
	SET YTDSales = P.YTDSales
	FROM [Staging].[LastOrderSummary] AS dt
	INNER JOIN(SELECT LEFT([WHAccountID], 8) AS WHAccountID
				, CONVERT(MONEY, SUM([ExtSales])) AS YTDSales
				FROM [API].[dbo].[APISalesDetail]
				WHERE [Type] = 'Generic'
				AND InvDate >= @CurrentYr
				AND DATEPART(dw, InvDate) >= 2
				AND DATEPART(dw, InvDate) < 7
				GROUP BY [WHAccountID]            
			) AS P ON P.WHAccountID = dt.API#


	--Update AvgUnits
	UPDATE [Staging].[LastOrderSummary]
	SET AvgUnits = (YearToDateUnits/[#GRXOrders])


	--TRUNCATE Archive table
	TRUNCATE TABLE [Archive].[LastOrderSummary]


	--Switch data to Archive table
	ALTER TABLE [dbo].[LastOrderSummary]
	SWITCH TO [Archive].[LastOrderSummary]


	--INSERT data from Staging table into prod table 
	INSERT INTO [dbo].[LastOrderSummary](AccountName, City, API#, Status, AppRecvd, APIActivated, LastOrder, DaysLastOrder, MaxUnits, AvgUnits, LastUnits, YearToDateUnits, #GRXOrders, YTDSales, TM, RowCreatedDate, RowUpdatedDate)
	SELECT AccountName, City, API#, Status, AppRecvd, APIActivated, LastOrder, DaysLastOrder
	, MaxUnits, AvgUnits, LastUnits, YearToDateUnits, #GRXOrders, YTDSales, TM, RowCreatedDate, RowUpdatedDate
	FROM Staging.LastOrderSummary


	--Update STATISTICS ON Prod table
	UPDATE STATISTICS [dbo].[LastOrderSummary]

END







GO
