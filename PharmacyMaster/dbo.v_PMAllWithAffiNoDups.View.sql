USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PMAllWithAffiNoDups]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_PMAllWithAffiNoDups] as
 
select * 
from (SELECT Rank() 
      OVER (Partition BY NCPDP 
      order by aapeffectivedate desc, 
      aapquitdate asc, aapaccountno desc) as Rank,PMID , ncpdp 
      FROM    v_PM_allwithaffiliates 
      where ncpdp is not null  ) p 
where p.rank < 2
GO
