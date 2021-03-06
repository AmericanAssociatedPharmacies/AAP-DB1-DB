USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_GlobalReport_CHall_test]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_GlobalReport_CHall_test]
as
--temporarily modified 9/22/10 to include CHPH_UD Aug sales
SELECT     p.PMID AS p_pmid, c.PMID, c.Date, 
		isnull(c.CombGENTotalSrc,0)  AS [Gen Src], 
c.CombGENTotal - c.CombGENTotalSrc AS [Gen Exc], --ok to exclude ud as all ud gen = src
                      isnull(c.CombGENTotal,0)  AS [Gen Total], 
					  isnull(c.CombBrands,0) AS [CH Brx], 
					  ISNULL(c.CombOTC, 0) + ISNULL(c.CombOther, 0)  AS [CH Oth], 
                      c.CombAdminOnly AS [UD Adm], 
					  c.CombNetSales   AS [CH Total]
FROM         dbo.PM_Pharmacy AS p 
					--left outer join
					--purchases..tmp_delete_CHPH_0810 t on p.pmid=t.pmid
					LEFT OUTER JOIN
                      dbo.CH_ALLPVA_SALES AS c ON p.PMID = c.PMID AND c.Date >= '1/1/2010'
UNION
SELECT     c.PMID AS p_pmid, c.PMID, c.Date, c.CombGENTotalSrc AS [Gen Src], c.CombGENTotal - c.CombGENTotalSrc AS [Gen Exc], 
                      c.CombGENTotal AS [Gen Total], c.CombBrands AS [CH Brx], ISNULL(c.CombOTC, 0) + ISNULL(c.CombOther, 0) AS [CH Oth], 
                      c.CombAdminOnly AS [UD Adm], c.CombNetSales AS [CH Total]
FROM         dbo.CH_ALLPVA_SALES AS c LEFT OUTER JOIN
                      dbo.PM_Pharmacy AS p ON c.PMID = p.PMID AND c.Date >= '1/1/2010'
WHERE     (p.PMID IS NULL)
GO
