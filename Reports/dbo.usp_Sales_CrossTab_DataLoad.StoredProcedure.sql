USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_Sales_CrossTab_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_Sales_CrossTab_DataLoad]

AS

SET NOCOUNT ON;

BEGIN

--DECLARE @StartDate DATETIME
--, @EndDate DATETIME

----Need to set the 1st date to the 1st day of the year of the previous year to catch any changes
--SET @StartDate = '20100101'
----DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) -1, 0)
----Current DATETIME without time values
--SET @EndDate = '20180206'
----DATEADD(DAY, 0, DATEDIFF(DAY, 0, GETDATE()))


	MERGE [dbo].[SalesCrossTab] AS t
	USING(SELECT TOP 100 PERCENT p.PMID
		, p.YearDate
		, 'API' AS SalesSource
		, 'Brand Rx' As [SalesType]
		, SUM(ISNULL(p.[1], 0.00)) AS Jan
		, SUM(ISNULL(p.[2], 0.00))  AS Feb
		, SUM(ISNULL(p.[3], 0.00))  AS Mar
		, SUM(ISNULL(p.[4], 0.00))  AS Apr
		, SUM(ISNULL(p.[5], 0.00))  AS May
		, SUM(ISNULL(p.[6], 0.00))  AS Jun
		, SUM(ISNULL(p.[7], 0.00))  AS Jul
		, SUM(ISNULL(p.[8], 0.00))  AS Aug
		, SUM(ISNULL(p.[9], 0.00))  AS Sep
		, SUM(ISNULL(p.[10], 0.00))  AS Oct
		, SUM(ISNULL(p.[11], 0.00))  AS Nov
		, SUM(ISNULL(p.[12], 0.00))  AS [Dec]
		FROM(SELECT PMID
			, APIBrandSales
			, MonthDate
			, CONVERT(SMALLINT, DATEPART(YY, CreditDate))  AS YearDate
			FROM Reports.Staging.Sales
			--WHERE CreditDate >= @StartDate
			--AND CreditDate < @EndDate
			) AS dt	
		PIVOT(SUM(APIBrandSales)
				FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
				) AS p
		GROUP BY p.PMID, p.YearDate
		) AS s(PMID, YearDate, SalesSource , SalesType, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, [Dec])
		ON t.PMID = s.PMID 
			AND t.YearDate = s.YearDate
			AND t.SalesSource = s.SalesSource
			AND t.SalesType = s.SalesType
		WHEN MATCHED THEN
		UPDATE SET Jan = s.Jan
		, Feb = s.Feb
		, Mar = s.Mar
		, Apr = s.Apr
		, May = s.May
		, Jun = s.Jun
		, Jul = s.Jul
		, Aug = s.Aug
		, Sep = s.Sep
		, Oct = s.Oct
		, Nov = s.Nov
		, [Dec] = s.[Dec]
		WHEN NOT MATCHED THEN
		INSERT (PMID, YearDate, SalesSource, SalesType, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, [Dec])
		VALUES(s.PMID, s.YearDate, s.SalesSource, s.SalesType, s.Jan, s.Feb, s.Mar, s.Apr, s.May, s.Jun, s.Jul, s.Aug, s.Sep, s.Oct, s.Nov, s.[Dec]);
	

		--Generic RX
		MERGE [dbo].[SalesCrossTab] AS t
		USING(SELECT TOP 100 PERCENT p.PMID
			, p.YearDate
			, 'API' AS SalesSource
			, 'Generic Rx' As [SalesType]
			, SUM(ISNULL(p.[1], 0.00)) AS Jan
			, SUM(ISNULL(p.[2], 0.00))  AS Feb
			, SUM(ISNULL(p.[3], 0.00))  AS Mar
			, SUM(ISNULL(p.[4], 0.00))  AS Apr
			, SUM(ISNULL(p.[5], 0.00))  AS May
			, SUM(ISNULL(p.[6], 0.00))  AS Jun
			, SUM(ISNULL(p.[7], 0.00))  AS Jul
			, SUM(ISNULL(p.[8], 0.00))  AS Aug
			, SUM(ISNULL(p.[9], 0.00))  AS Sep
			, SUM(ISNULL(p.[10], 0.00))  AS Oct
			, SUM(ISNULL(p.[11], 0.00))  AS Nov
			, SUM(ISNULL(p.[12], 0.00))  AS [Dec]
			FROM(SELECT PMID
				, APIGenericSales
				, MonthDate
				, CONVERT(SMALLINT, DATEPART(YY, CreditDate))  AS YearDate
				FROM Reports.Staging.Sales
				--WHERE CreditDate >= @StartDate
				--AND CreditDate < @EndDate
				) AS dt	
			PIVOT(SUM(APIGenericSales)
					FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
					) AS p
			GROUP BY p.PMID, p.YearDate
			) AS s(PMID, YearDate, SalesSource , SalesType, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, [Dec])
		ON t.PMID = s.PMID 
			AND t.YearDate = s.YearDate
			AND t.SalesSource = s.SalesSource
			AND t.SalesType = s.SalesType
		WHEN MATCHED THEN
		UPDATE SET Jan = s.Jan
		, Feb = s.Feb
		, Mar = s.Mar
		, Apr = s.Apr
		, May = s.May
		, Jun = s.Jun
		, Jul = s.Jul
		, Aug = s.Aug
		, Sep = s.Sep
		, Oct = s.Oct
		, Nov = s.Nov
		, [Dec] = s.[Dec]
		WHEN NOT MATCHED THEN
		INSERT (PMID, YearDate, SalesSource, SalesType, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, [Dec])
		VALUES(s.PMID, s.YearDate, s.SalesSource, s.SalesType, s.Jan, s.Feb, s.Mar, s.Apr, s.May, s.Jun, s.Jul, s.Aug, s.Sep, s.Oct, s.Nov, s.[Dec]);
		

		--OTC
		MERGE [dbo].[SalesCrossTab] AS t
		USING(SELECT TOP 100 PERCENT p.PMID
		, p.YearDate
		, 'API' AS SalesSource
		, 'OTC' As [SalesType]
		, SUM(ISNULL(p.[1], 0.00)) AS Jan
		, SUM(ISNULL(p.[2], 0.00))  AS Feb
		, SUM(ISNULL(p.[3], 0.00))  AS Mar
		, SUM(ISNULL(p.[4], 0.00))  AS Apr
		, SUM(ISNULL(p.[5], 0.00))  AS May
		, SUM(ISNULL(p.[6], 0.00))  AS Jun
		, SUM(ISNULL(p.[7], 0.00))  AS Jul
		, SUM(ISNULL(p.[8], 0.00))  AS Aug
		, SUM(ISNULL(p.[9], 0.00))  AS Sep
		, SUM(ISNULL(p.[10], 0.00))  AS Oct
		, SUM(ISNULL(p.[11], 0.00))  AS Nov
		, SUM(ISNULL(p.[12], 0.00))  AS [Dec]
		FROM(SELECT PMID
			, APIOTCSales
			, MonthDate
			, CONVERT(SMALLINT, DATEPART(YY, CreditDate)) AS YearDate
			FROM Reports.Staging.Sales
			--WHERE CreditDate >= @StartDate
			--AND CreditDate < @EndDate
			) AS dt	
		PIVOT(SUM(APIOTCSales)
				FOR MonthDate IN([1],[2],[3],[4],[5],[6],[7],[8],[9],[10],[11],[12]) 	
				) AS p
		GROUP BY p.PMID, p.YearDate
		) AS s(PMID, YearDate, SalesSource , SalesType, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, [Dec])
		ON t.PMID = s.PMID 
			AND t.YearDate = s.YearDate
			AND t.SalesSource = s.SalesSource
			AND t.SalesType = s.SalesType
		WHEN MATCHED THEN
		UPDATE SET Jan = s.Jan
		, Feb = s.Feb
		, Mar = s.Mar
		, Apr = s.Apr
		, May = s.May
		, Jun = s.Jun
		, Jul = s.Jul
		, Aug = s.Aug
		, Sep = s.Sep
		, Oct = s.Oct
		, Nov = s.Nov
		, [Dec] = s.[Dec]
		WHEN NOT MATCHED THEN
		INSERT (PMID, YearDate, SalesSource, SalesType, Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, [Dec])
		VALUES(s.PMID, s.YearDate, s.SalesSource, s.SalesType, s.Jan, s.Feb, s.Mar, s.Apr, s.May, s.Jun, s.Jul, s.Aug, s.Sep, s.Oct, s.Nov, s.[Dec]);

	
END


GO
