USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_GlobalReport_CHAll]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_GlobalReport_CHAll]
as
SELECT     p.PMID AS p_pmid, c.PMID, c.Date, c.CombGENTotalSrc AS [Gen Src], c.CombGENTotal - c.CombGENTotalSrc AS [Gen Exc], 
                      c.CombGENTotal AS [Gen Total], c.CombBrands AS [CH Brx], ISNULL(c.CombOTC, 0) + ISNULL(c.CombOther, 0) AS [CH Oth], 
                      c.CombAdminOnly AS [UD Adm], c.CombNetSales AS [CH Total]
FROM         dbo.PM_Pharmacy AS p LEFT OUTER JOIN
                      CH_ALLPVA_SALES AS c ON p.PMID = c.PMID AND c.Date >= '1/1/2010'
UNION
SELECT     c.PMID AS p_pmid, c.PMID, c.Date, c.CombGENTotalSrc AS [Gen Src], c.CombGENTotal - c.CombGENTotalSrc AS [Gen Exc], 
                      c.CombGENTotal AS [Gen Total], c.CombBrands AS [CH Brx], ISNULL(c.CombOTC, 0) + ISNULL(c.CombOther, 0) AS [CH Oth], 
                      c.CombAdminOnly AS [UD Adm], c.CombNetSales AS [CH Total]
FROM         CH_ALLPVA_SALES AS c LEFT OUTER JOIN
                      dbo.PM_Pharmacy AS p ON c.PMID = p.PMID AND c.Date >= '1/1/2010'
WHERE     (p.PMID IS NULL)
GO
