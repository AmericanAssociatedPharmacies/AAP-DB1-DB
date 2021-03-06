USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spReport_Grandfathered_0810]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spReport_Grandfathered_0810]
as
-- Grandfathered Pharmacy Profile Report
-- 8/17/10 BG
-- warning: hardcoded dates
select v.PMID, 
v.aapaccountno as [AAP#],
v.apiaccountno as [API#],
v.accountname as Name,
v.City,v.state as St,v.territory as TM,
v.aapeffectivedate as [Effective],
v.AccountDescription,
v.Affiliate,
case when mc.pmid is null then 'N' else 'Y' end as [M.Care],
isnull(dtCH0410.combnetsales,0) as CHAllPVA_0410,
isnull(dtCH0510.combnetsales,0) as CHAllPVA_0510,
isnull(dtCH0610.combnetsales,0) as CHAllPVA_0610,
isnull(dtAPI0410.API_Total,0) as API_0410,
isnull(dtAPI0510.API_Total,0) as API_0510,
isnull(dtAPI0610.API_Total,0) as API_0610

from  v_PM_AllWithAffiliates  v
left join
(
select pmid,sum(combnetsales) as combnetsales
from CH_ALLPVA_SALES
where date ='4/1/2010'
group by pmid
) dtCH0410 on v.PMID=dtCH0410.PMID
left join
(
select pmid,sum(combnetsales) as combnetsales
from CH_ALLPVA_SALES
where date ='5/1/2010'
group by pmid
) dtCH0510 on v.PMID=dtCH0510.PMID
left join
(
select pmid,sum(combnetsales) as combnetsales
from CH_ALLPVA_SALES
where date = '6/1/2010'
group by pmid
) dtCH0610 on v.PMID=dtCH0610.PMID
left join
(
select pmid,sum(API_Total) as API_Total
from api..v_API_LineItem_ByPMIDbyMonth
where date ='4/1/2010'
group by pmid
) dtAPI0410 on v.PMID=dtAPI0410.PMID
left join
(
select pmid,sum(API_Total) as API_Total
from api..v_API_LineItem_ByPMIDbyMonth
where date ='5/1/2010'
group by pmid
) dtAPI0510 on v.PMID=dtAPI0510.PMID
left join
(
select pmid,sum(API_Total) as API_Total
from api..v_API_LineItem_ByPMIDbyMonth
where date = '6/1/2010'
group by pmid
) dtAPI0610 on v.PMID=dtAPI0610.PMID

left join pharmacymaster..pm_managedcare mc on v.pmid=mc.pmid and mc.mcquitdate is null and mc.chaincode is not null

where v.aapaccountno is not null and v.aapquitdate is null
--and AccountDescription like '%Grand%'
order by pmid
GO
