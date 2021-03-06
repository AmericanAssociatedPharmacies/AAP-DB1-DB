USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_GlobalReport_CHALL_and_API]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_GlobalReport_CHALL_and_API]
as
SELECT     ch.p_pmid, ch.PMID, ch.Date, ch.[Gen Src], ch.[Gen Exc], ch.[Gen Total], ch.[CH Brx], ch.[CH Oth], ch.[UD Adm], ch.[CH Total], a.PMID AS a_pmid, 
                      a.date AS a_date, a.API_BR, a.API_GEN, a.API_OTC, a.API_BR + a.API_GEN + a.API_OTC AS API_Total
FROM         dbo.v_GlobalReport_CHall AS ch LEFT OUTER JOIN
                      API.dbo.v_API_ByMonth_ExtSales2010 AS a ON ch.p_pmid = a.PMID AND ch.Date = a.date
UNION
SELECT     - 1 AS p_pmid, - 1 AS pmid, a.date, ch.[Gen Src], ch.[Gen Exc], ch.[Gen Total], ch.[CH Brx], ch.[CH Oth], ch.[UD Adm], ch.[CH Total], a.PMID AS a_pmid, 
                      a.date AS a_date, a.API_BR, a.API_GEN, a.API_OTC, a.API_BR + a.API_GEN + a.API_OTC AS API_Total
FROM         API.dbo.v_API_ByMonth_ExtSales2010 AS a LEFT OUTER JOIN
                      dbo.v_GlobalReport_CHall AS ch ON a.PMID = ch.p_pmid AND a.date = ch.Date
WHERE     (a.PMID = - 1) OR
                      (ch.p_pmid IS NULL)
GO
