USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_CompanyGoals_Goal3]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CompanyGoals_Goal3]
AS
     SELECT t1.Year
          , t1.Month
          , SUM(t1.Qualified) AS Count
     FROM
(
    SELECT a.PMID
         , MONTH(a.date) AS Month
         , YEAR(a.date) AS Year
         , SUM(a.AAPNetSales) AS CAH
         , CASE
               WHEN SUM(a.AAPNetSales) < 50000
               THEN 0
               WHEN DATEADD(month, DATEDIFF(month, 0, b.AAPQuitDate), 0) = a.Date
               THEN 0
               ELSE 1
           END AS Qualified
    FROM PharmacyMaster.dbo.ALL_Volume AS a
         INNER JOIN PharmacyMaster.dbo.PM_Pharmacy AS b ON a.PMID = b.PMID
    WHERE YEAR(a.Date) IN(2019, 2020)
         AND b.AccountDescription <> 'Affiliate Group Pharmacy'
    GROUP BY a.PMID
           , b.AAPQuitDate
           , a.Date
           , MONTH(a.date)
           , YEAR(a.date)
) AS t1
     GROUP BY t1.Year
            , t1.Month
     ORDER BY t1.Year
            , t1.Month;
    
GO
