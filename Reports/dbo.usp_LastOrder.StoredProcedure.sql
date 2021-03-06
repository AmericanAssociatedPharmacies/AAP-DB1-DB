USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_LastOrder]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_LastOrder]

	@TM VARCHAR(1000) = NULL
	, @API# VARCHAR(25) = NULL
		,@AccountName VARCHAR(200) = NULL
	

AS


SET NOCOUNT ON;

BEGIN


	DECLARE @T TABLE(TM VARCHAR(5) PRIMARY KEY CLUSTERED
				)

	INSERT INTO @T(TM)
	SELECT DISTINCT Item
	FROM Reports.[dbo].[DelimitedSplit8K](@TM, ',')

	SELECT l.AccountName
	, l.City
	, l.[API#]
	, l.[Status]
	, l.AppRecvd
	, l.APIActivated
	, l.LastOrder
	, l.DaysLastOrder
	, l.MaxUnits
	, l.AvgUnits
	, l.LastUnits
	, l.YearToDateUnits
	, l.[#GRXOrders]
	, l.[TM]
	FROM [dbo].[LastOrderSummary] AS l
	INNER JOIN [PharmacyMaster].dbo.[v_PM_AllWithAffiliates] AS B ON l.[API#] = B.APIAccountNo
	WHERE EXISTS(SELECT 1
					FROM @T AS t
					WHERE B.Territory = ISNULL(t.TM, t.TM) 	   
						)
	
	AND l.AccountName LIKE ISNULL(CONCAT(@AccountName,'%'), l.AccountName)
	AND l.API# = ISNULL(@API#, l.API#)



	--SELECT dt.AccountName
	--, dt.City
	--, dt.API#
	--, [Status]
	--, dt.AppRecvd
	--, dt.APIActivated
	--, I.LastOrder
	--, J.DaysLastOrder
	--, K.MaxUnits
	--, (N.YearToDateUnits/O.[#GRXOrders]) AS AvgUnits
	--, MAX(M.LastUnits) AS LastUnits
	--, N.YearToDateUnits
	--, O.[#GRXOrders]
	--FROM(SELECT AccountName
	--	   , City
	--	   , [APIAccountNo] AS API#
	--	   , LEFT([APIAccountNo], 8) AS [WHAccountID]
	--	   , APIStatus  AS [Status]
	--	   , NULL AS [AppRecvd]
	--	   , [AAPAccountNo] AS [AAP#]
	--	   , NULL AS [APIActivated] 
	--	   FROM [PharmacyMaster].dbo.[v_PM_AllWithAffiliates] AS a
	--	   WHERE EXISTS(SELECT 1
	--						FROM @T AS t
	--						WHERE a.Territory = t.TM	   
	--					)
	--	   ) AS dt
	--LEFT OUTER JOIN API.dbo.APISalesDetail AS a ON dt.WHAccountID = LEFT(a.[WHAccountID], 8) AND a.InvDate >= '20170401'
	--INNER JOIN(SELECT LEFT([WHAccountID], 8) AS WHAccountID
	--			, CONVERT(DATE, MAX(InvDate)) AS LastOrder
	--			FROM [API].[dbo].[APISalesDetail]
	--			WHERE InvDate >= '20170101'
	--			GROUP BY WHAccountID
	--					 ) AS I ON I.WHAccountID = dt.WHAccountID                                        
	--INNER JOIN(SELECT LEFT([WHAccountID], 8) AS WHAccountID
	--					 , DATEDIFF(DAY, MAX(InvDate), DATEADD(dd, DATEDIFF(dd, 0, getdate()-1), 0)) AS DaysLastOrder
	--					 FROM [API].[dbo].[APISalesDetail]
	--					 WHERE InvDate >= '20170101'
	--					 GROUP BY [WHAccountID]
	--			 ) AS J ON J.WHAccountID = dt.WHAccountID
	--INNER JOIN(SELECT dt.WHAccountID
	--					 , MAX(dt.MaxUnits) AS MaxUnits
	--					 FROM(SELECT LEFT([WHAccountID], 8) AS WHAccountID
	--						   , InvDate
	--						   , COUNT(APIItemNbr) AS MaxUnits
	--						   FROM [API].[dbo].[APISalesDetail] 
	--						   WHERE InvDate >= '20170101'
	--						   GROUP BY WHAccountID
	--						   , InvDate 
	--						   ) AS dt       
	--						   GROUP BY dt.WHAccountID                      
	--		   ) AS K ON K.WHAccountID = dt.WHAccountID
	--INNER JOIN(SELECT LEFT([WHAccountID], 8) AS WHAccountID
	--						   , InvDate
	--						   , COUNT(APIItemNbr) AS LastUnits
	--						   FROM [API].[dbo].[APISalesDetail]
	--						   WHERE InvDate >= '20170101'
	--						   GROUP BY WHAccountID, InvDate                   
	--		   ) AS M ON M.WHAccountID = dt.WHAccountID AND M.InvDate = I.LastOrder
	--INNER JOIN(SELECT LEFT([WHAccountID], 8) AS WHAccountID
	--					 , CONVERT(INT, COUNT([APIItemNbr]))  AS YearToDateUnits
	--					 FROM [API].[dbo].[APISalesDetail]
	--			WHERE InvDate >= '20170101'
	--			GROUP BY WHAccountID 
	--					 ) AS N ON N.WHAccountID = dt.WHAccountID
	--INNER JOIN(SELECT LEFT([WHAccountID], 8) AS WHAccountID
	--					 , COUNT(DISTINCT InvDate) AS [#GRXOrders]
	--					 FROM [API].[dbo].[APISalesDetail]
	--					 WHERE [Type] = 'Generic'
	--					 AND InvDate >= '20170101'
	--								  AND InvDate < DATEADD(DAY, 0, DATEDIFF(DAY, 0, GETDATE()))
	--								  AND ExtSales > 0
	--					 GROUP BY [WHAccountID]
	--		   ) AS O ON O.WHAccountID = dt.WHAccountID
	--GROUP BY dt.AccountName
	--, dt.City
	--, dt.API#
	--, [Status]
	--, dt.AppRecvd
	--, dt.APIActivated
	--, I.LastOrder
	--, J.DaysLastOrder
	--, K.MaxUnits
	--, N.YearToDateUnits
	--, O.[#GRXOrders]


END

GO
