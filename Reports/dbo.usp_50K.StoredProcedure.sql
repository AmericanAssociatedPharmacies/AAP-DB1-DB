USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_50K]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_50K]
AS
     SET NOCOUNT ON;
    BEGIN
        SELECT dt.Year, 
               dt.Month, 
               SUM(dt.Qualified) AS Count
        FROM
        (
            SELECT a.PMID, 
                   MONTH(a.date) AS Month, 
                   YEAR(a.date) AS Year, 
                   SUM(a.AAPNetSales) AS CAH,
                   CASE
                       WHEN SUM(a.AAPNetSales) <= 50000
                       THEN 0
                       ELSE 1
                   END AS Qualified
            FROM PharmacyMaster.dbo.ALL_Volume AS a
                 INNER JOIN PharmacyMaster.dbo.PM_Pharmacy AS b ON a.PMID = b.PMID
            WHERE YEAR(a.Date) >= 2018
                  AND a.Date < DATEADD(month, DATEDIFF(month, 0, ISNULL(b.AAPQuitDate, '29991231')), 0) -- Exclude stores where quit date in that month are not counted towards that months total
                  AND b.AAPAccountNo IS NOT NULL -- Exclude all pharmacies that DO NOT have an AAP#
            GROUP BY a.PMID, 
                     a.Date, 
                     MONTH(a.date), 
                     YEAR(a.date)
        ) AS dt
        WHERE dt.Qualified = 1
        GROUP BY dt.Year, 
                 dt.Month
        ORDER BY dt.Year ASC, 
                 dt.Month ASC;
    END;
GO
