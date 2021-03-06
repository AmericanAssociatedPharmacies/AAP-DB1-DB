USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_GlobalReport_CHALL_and_API_092010]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_GlobalReport_CHALL_and_API_092010]
as
--7/20 replaced line amount view with extended sales view
--all PMIDs + challpva joined to api
--union part 1 sales for those in pm part 2 those not in pm
select p_pmid,ch.pmid as pmid,ch.[date] as [date],
[Gen Src],[Gen Exc],[Gen Total],[CH Brx],[CH Oth],[UD Adm],[CH Total],
a.pmid as a_pmid,
a.date as a_date,
a.API_BR,a.API_GEN,a.API_OTC,
a.API_BR+a.API_GEN+a.API_OTC as API_Total

from v_GlobalReport_CHall ch
--left join api..v_API_ByMonth_LineAmount2010 a 
left join api..v_API_ByMonth_ExtSales2010 a
on ch.p_pmid=a.pmid and ch.date=a.date
--was on ch.pmid 07/20/10 13:02:10

union
--APIs without PMIDs - totals for balancing
--this was a bug in the 7/27 version: "where p_pmid is null" 
--changed to "where a.pmid = -1"

select -1 as p_pmid,
-1 as pmid,
a.[date] as [date],
[Gen Src],[Gen Exc],[Gen Total],[CH Brx],[CH Oth],[UD Adm], [CH Total],
a.pmid as a_pmid,
a.date as a_date,
a.API_BR,a.API_GEN,a.API_OTC,
a.API_BR+a.API_GEN+a.API_OTC as API_Total
from
--api..v_API_ByMonth_LineAmount2010 a
api..v_API_ByMonth_ExtSales2010 a
left join v_GlobalReport_CHall ch on a.pmid=ch.p_pmid and a.date=ch.date
--where p_pmid is null	
where a.pmid = -1 or (ch.p_pmid is null)
GO
