USE [Reports]
GO
/****** Object:  StoredProcedure [Staging].[usp_Sales_DataLoad]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[usp_Sales_DataLoad]

	@StartDate DATETIME = NULL
	, @EndDate DATETIME = NULL

AS

SET NOCOUNT ON;

BEGIN

	/*Set default input parmaters to Jan 1st of previous year from current date
	and end date to current year.*/
	SET @StartDate = ISNULL(@StartDate, DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) -1, 0))
	SET @EndDate = ISNULL(@EndDate, DATEADD(DAY, 0, DATEDIFF(DAY, 0, GETDATE())))


	INSERT INTO Reports.Staging.Sales(PMID, CreditDate, APIBrandSales, APIGenericSales, APIOTCSales, MonthDate)
	SELECT ISNULL(dt.PMID, f.PMID) AS PMID
	, ISNULL(dt.CreditFor, f.CreditFor) AS CreditDate
	, CONVERT(MONEY, ISNULL(dt.APIBrandSales, f.APIBrandSales)) AS APIBrandSales
	, CONVERT(MONEY, ISNULL(dt.APIGenericSales, f.APIGenericSales)) as APIGenericSales
	, CONVERT(MONEY, ISNULL(dt.APIOTCSales, f.APIOTCSales)) as APIOTCSales
	, CONVERT(tinyint, ISNULL(dt.MonthDate, f.MonthDate)) AS MonthDate
	--, ISNULL(DATEPART(MM, dt.CreditFor), DATEPART(MM, f.CreditFor)) AS MonthDate       
	FROM(SELECT PMID
			, Date as [CreditFor]
			, WHAPIBrand as [APIBrandSales]
			, WHAPIGeneric as APIGenericSales
			, WHAPIOTC as APIOTCSales
			, DATEPART(MM, Date) AS MonthDate
			FROM PharmacyMaster.dbo.ALL_Volume as av
			WHERE Date >= @StartDate AND Date < @EndDate           
			) AS dt
	FULL OUTER JOIN(SELECT a.PMID
								, SalesFor AS [CreditFor]    
								, SUM(APIBrandRx) as [APIBrandSales]
								, SUM(APIGenericRx) as APIGenericSales
								, SUM(APIOTC) as APIOTCSales
								, DATEPART(MM, SalesFor) AS MonthDate
								FROM (SELECT p.PMID
											, DATEADD(month, DATEDIFF(month, 0, InvDate), 0) as SalesFor
											, CASE WHEN Type = 'Brand' THEN SUM(ExtSales) ELSE 0 END AS APIBrandRx
											, CASE WHEN Type = 'Generic' THEN SUM(ExtSales) ELSE 0 END AS APIGenericRx
											, CASE WHEN Type = 'OTC' THEN SUM(ExtSales) ELSE 0 END AS APIOTC
										FROM API.dbo.APISalesDetail AS A
										INNER JOIN PharmacyMaster.dbo.PM_Pharmacy AS p ON A.WHAccountID = LEFT(p.APIAccountNo, 8)
										WHERE InvDate >= @startDate AND InvDate < @endDate
										--AND WHAccountID like @ApiAccountNumber + '%'
										GROUP BY p.PMID
										, DATEADD(month, DATEDIFF(month, 0, InvDate), 0), Type
										) as a
										GROUP BY PMID
										, SalesFor                                             
								) AS f ON dt.PMID = f.PMID 
								AND dt.CreditFor = f.CreditFor


END
GO
