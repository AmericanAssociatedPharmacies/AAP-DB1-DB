USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_Update_CHPH_AAP_CustSummary]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Update_CHPH_AAP_CustSummary]
AS

--Insert new month's data into the summary table.
--If the month is already in the summary table, it's data will be updated in the update statement. 

INSERT INTO Purchases.dbo.CHPH_AAP_CustomerSummary
SELECT b.PMID		
	, b.Date
	, SUM(b.BrandUnits) as BrandUnits
	, SUM(b.GenericUnits) as GenericUnits
	, SUM(b.BrandSales) as BrandSales
	, SUM(b.GenericSales) as GenericSales
FROM (
	SELECT c.PMID
		,DATEADD(mm, DATEDIFF(mm, 0, c.Inv_Date), 0) as Date
		,IIF(c.BRAND = 'B' AND c.ContractNo NOT IN (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245), SUM(SHIP_QTY), 0) AS BrandUnits
		,IIF(c.ContractNo IN (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245), SUM(SHIP_QTY), 0) AS GenericUnits
		,IIF(c.BRAND = 'B' AND c.ContractNo NOT IN (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245), SUM(EXT_COST), 0) AS BrandSales
		,IIF(c.ContractNo IN (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245), SUM(EXT_COST), 0) AS GenericSales
	FROM Purchases..CHPH_AAP AS c
	WHERE PMID IS NOT NULL 
	AND Inv_Date >= DATEADD(mm, 1, (SELECT MAX(Date) FROM Purchases.dbo.CHPH_AAP_CustomerSummary))
	GROUP BY PMID, DATEADD(mm, DATEDIFF(mm, 0, c.Inv_Date), 0), Brand, ContractNo
	) as b
GROUP BY b.PMID, b.Date


--Update the CHPH_AAP_CustomerSummary table
--Date is limited to update data within the current year.
--This is because we do annual audits of the sales data, so data from the
--previous years are likely not to change.
--There are cases where we catch incorrect sales data from recent, previous dates, so we want
--to verify those totals for the current year are verified every day, just in case.

UPDATE cs 
SET cs.PMID = a.PMID
	,cs.BrandUnits = a.BrandUnits
	,cs.GenericUnits = a.GenericUnits
	,cs.BrandSales = a.BrandSales
	,cs.GenericSales = a.GenericSales

FROM Purchases.dbo.CHPH_AAP_CustomerSummary as cs
INNER JOIN (SELECT PMID		
					, Date
					, SUM(b.BrandUnits) as BrandUnits
					, SUM(b.GenericUnits) as GenericUnits
					, SUM(b.BrandSales) as BrandSales
					, SUM(b.GenericSales) as GenericSales
			FROM (
					SELECT c.PMID
						,DATEADD(mm, DATEDIFF(mm, 0, c.Inv_Date), 0) as Date
						,IIF(c.BRAND = 'B' AND c.ContractNo NOT IN (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245), SUM(SHIP_QTY), 0) AS BrandUnits
						,IIF(c.ContractNo IN (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245), SUM(SHIP_QTY), 0) AS GenericUnits
						,IIF(c.BRAND = 'B' AND c.ContractNo NOT IN (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245), SUM(EXT_COST), 0) AS BrandSales
						,IIF(c.ContractNo IN (25676, 25677, 58705, 29731, 26776, 66685, 66684, 73246, 73245), SUM(EXT_COST), 0) AS GenericSales
					FROM Purchases..CHPH_AAP AS c
					WHERE PMID IS NOT NULL 
					AND Inv_Date >= CAST(YEAR(GETDATE()) as varchar(4)) + '0101'
					GROUP BY PMID, DATEADD(mm, DATEDIFF(mm, 0, c.Inv_Date), 0), Brand, ContractNo
					) as b
			GROUP BY b.PMID, b.Date
			) as a
ON cs.PMID = a.PMID AND cs.Date = a.Date
WHERE cs.PMID = a.PMID 
AND cs.Date = a.Date
AND (cs.BrandUnits <> a.BrandUnits 
		OR cs.GenericUnits <> a.GenericUnits 
		OR ROUND(cs.BrandSales,2) <> ROUND(a.BrandSales,2)
		OR ROUND(cs.GenericSales,2) <> ROUND(a.GenericSales,2))
GO
