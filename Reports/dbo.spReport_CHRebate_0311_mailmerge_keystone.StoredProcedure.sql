USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[spReport_CHRebate_0311_mailmerge_keystone]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc
[dbo].[spReport_CHRebate_0311_mailmerge_keystone]
as
--mailmerge step in monthly CH rebate file process BG
--replace table names and edit [month], edit Leader Rebate if not EOQ
begin
--mailmerge keystone
--replace tablenames and edit [month]
drop table reports..tmp_CHGR0311_mailmerge_keystone

select r.pmid as [Vendor ID],
case when (p.ownername is null or ltrim(p.ownername)='') then p.contactfullname else p.ownername end as Contact,
p.[accountname] as [Account Name],
case when (p.corporatename is null or ltrim(p.corporatename)='') then p.accountname else p.corporatename end as [Corporate Name],
--x.Group_Name as PMAffiliation,
f.address,
f.address2,
f.city,
f.state,
f.zip,
'March 2011' as [month],

r.[SumOfCCA = AAP Generics 872, 25676, 25677] as SourceSales,
round(r.[calculated generic rebate],2) as GenericRebate,
round(r.[leader rebate],2) as LeaderRebate, --only at end of quarter
round(r.[pay to affiliate office],2) as StoreRebate,
case when r.[SumOfCCA = AAP Generics 872, 25676, 25677] = 0
	then 0
	else round(round(r.[calculated generic rebate],2)*100/r.[SumOfCCA = AAP Generics 872, 25676, 25677],2) 
end as AverageRebatePct,
--aap.dbo.csfnHRTA2(r.[SumOfCCA = AAP Generics 872, 25676, 25677],[sort code]) as HRTA,
round(isnull(r.hrta,0)*100,0) as HRTA,

p.aapaccountno as aapid,
--p.territory,
t.firstname + ' ' + t.lastname as TMName

into reports..tmp_CHGR0311_mailmerge_keystone
from reports..import_CHRebate0311 r
left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid
left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid
left join pharmacymaster..v_address_primary a on r.pmid=a.pmid
left join  pharmacymaster..pm_territory t on p.territory=t.territory
where [Pay to affiliate office] >= 10.00 and affiliate like 'KEYSTONE%'
order by r.pmid


select * from reports..tmp_CHGR0311_mailmerge_keystone order by [vendor id]
end
GO
