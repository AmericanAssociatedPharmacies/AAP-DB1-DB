USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[spReport_CHRebate_0611_mailmerge_ExcludeLeaderOnly]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select top 1 * from pharmacymaster..v_pm_rebates_chaap

create proc
[dbo].[spReport_CHRebate_0611_mailmerge_ExcludeLeaderOnly]
as
--mailmerge step in monthly CH rebate file process BG
--replace table names and edit [month], edit Leader Rebate if not EOQ
begin
drop table reports..tmp_CHGR0611_mailmerge_ExcludeLeaderOnly

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
'June 2011' as [month],

--r.[SumOfCCA = AAP Generics 872, 25676, 25677] as SourceSales,
r.SourceSales,
--round(r.[calculated generic rebate],2) as GenericRebate,
--round(r.[leader rebate to pay out],2) as LeaderRebate, --only at end of quarter
round(r.[GenericRebate],2) as GenericRebate,
round(r.[LeaderRebate],2) as LeaderRebate, --note no 'to pay out' column 12/10
round(r.[MSIRebate],2) as MSIRebate,
--0.0 as LeaderRebate,
round(r.[pay to store],2) as StoreRebate,
--case when r.[SumOfCCA = AAP Generics 872, 25676, 25677] = 0
--	then 0
--	else round(round(r.[calculated generic rebate],2)*100/r.[SumOfCCA = AAP Generics 872, 25676, 25677],2) 
--end as AverageRebatePct,
--aap.dbo.csfnHRTA2(r.[SumOfCCA = AAP Generics 872, 25676, 25677],[sort code]) as HRTA,
[effectivepct] as AverageRebatePct,
round(isnull(r.hrta,0.0)*100,3) as HRTA, --note 3 places

p.aapaccountno as aapid,
--p.territory,
t.firstname + ' ' + t.lastname as TMName

into reports..tmp_CHGR0611_mailmerge_ExcludeLeaderOnly
--from reports..import_CHRebate0611 r
from pharmacymaster..v_pm_rebates_chaap r
left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid
left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid
left join pharmacymaster..v_address_primary a on r.pmid=a.pmid
left join  pharmacymaster..pm_territory t on p.territory=t.territory
where r.date = '6/1/11' and [Pay to store] >= 10.00
and ([pay to store] <> [MSIRebate] and [pay to store]<>[LeaderRebate]) 
order by r.pmid


select * from reports..tmp_CHGR0611_mailmerge_ExcludeLeaderOnly order by [vendor id]
end



GO
