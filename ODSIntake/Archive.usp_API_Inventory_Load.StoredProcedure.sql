USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Archive].[usp_API_Inventory_Load]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Archive].[usp_API_Inventory_Load]

AS

SET NOCOUNT ON

BEGIN


DECLARE @p1 DATETIME
, @p2 DATETIME


	DECLARE C1 CURSOR FOR
	SELECT dt.StartDate, dt.EndDate
	FROM(SELECT DISTINCT DATEADD(DAY,0,DATEDIFF(DAY,0,RowCreatedDate)) AS StartDate
			, DATEADD(DAY,1,DATEDIFF(DAY,0,RowCreatedDate)) AS EndDate
			FROM [Staging].[API_Inventory]
		) AS dt
	WHERE dt.StartDate < '20190521'
	ORDER BY dt.StartDate ASC

	OPEN C1

	FETCH NEXT 
	FROM C1
	INTO @p1, @p2

	WHILE @@FETCH_STATUS = 0
	BEGIN

		SET IDENTITY_INSERT [Archive].[API_Inventory] ON;
	
		INSERT INTO [Archive].[API_Inventory](RowID, LPSROM, LPLZON, LPLCID, LPPRDC, LPBATC, LPFPUT, LPLPUT, LPLOQT, LPPIQT, LPSTTC, LPLIST, LPPIPR, LPPUPR, LPSDAT, LPLOCT, LPRQNC, LPUQNC, LPNCCN, LPSENC, LPORFN, LPORFL, LPLCRE, LPQCYN, LPTDCD, LPHLBA, RowversionID, ETLDateKey, ETLDate, ETLTime)
		SELECT a.RowID, LPSROM, LPLZON, LPLCID, LPPRDC, LPBATC, LPFPUT, LPLPUT, LPLOQT, LPPIQT, LPSTTC, LPLIST, LPPIPR, LPPUPR, LPSDAT, LPLOCT, LPRQNC, LPUQNC, LPNCCN, LPSENC, LPORFN, LPORFL, LPLCRE, LPQCYN, LPTDCD, LPHLBA, CONVERT(VARBINARY(8),RowversionID) AS RowversionID, CONVERT(INT, CONVERT(varchar(20), [RowCreatedDate],112)) AS ETLDateKey
		, CONVERT(DATE, [RowCreatedDate]) AS ETLDate
		, CONVERT(TIME, [RowCreatedDate]) AS ETLTime
		FROM [Staging].[API_Inventory] AS a
		CROSS APPLY(SELECT RowID
					, ROW_NUMBER() OVER(PARTITION BY LPSROM, LPLZON, LPLCID, LPPRDC, LPBATC, LPFPUT, LPLPUT, LPLOQT, LPPIQT, LPSTTC
												, LPLIST, LPPIPR, LPPUPR, LPSDAT, LPLOCT, LPRQNC, LPUQNC, LPNCCN, LPSENC, LPORFN, LPORFL, LPLCRE, LPQCYN, LPTDCD, LPHLBA, [RowCreatedDate] 
												ORDER BY (SELECT 1)) AS RN 
					FROM [Staging].[API_Inventory]
					WHERE RowCreatedDate >= @p1
					AND RowCreatedDate < @p2
					) AS ca
		WHERE ca.RN = 1
		AND ca.RowID = a.RowID
		ORDER BY a.RowID ASC;

		SET IDENTITY_INSERT [Archive].[API_Inventory] OFF;

		UPDATE STATISTICS [Archive].[API_Inventory];

		DELETE x
		FROM [Staging].[API_Inventory] AS x
		INNER JOIN [Archive].[API_Inventory] AS a ON x.RowID = a.RowID;

		UPDATE STATISTICS [Staging].[API_Inventory];


		FETCH NEXT 
		FROM C1
		INTO @p1, @p2

	END

	CLOSE C1
	DEALLOCATE C1

	DBCC SHRINKFILE(2,1)

END
GO
