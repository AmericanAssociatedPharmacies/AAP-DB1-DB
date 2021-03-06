USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[spReport_API2011Q2_mailmerge_Keystone]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc
[dbo].[spReport_API2011Q2_mailmerge_Keystone]
as
--mailmerge step in monthly CH rebate file process BG
--replace table names and edit [month], edit Leader Rebate if not EOQ
begin
drop table reports..tmp_API2011Q2_mailmerge_Keystone

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
'Q2 2011' as [month],

[API Acct#],
[API Total Whse Sales] as [WarehouseSales],
[Avg Rebate Percentage],
[Rebate to Pay Acct/Admin] as StoreRebate,



p.aapaccountno as aapid,
--p.territory,
t.firstname + ' ' + t.lastname as TMName

into reports..tmp_API2011Q2_mailmerge_Keystone
from reports..import_API2011Q2 r

left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid
left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid
left join pharmacymaster..v_address_primary a on r.pmid=a.pmid
left join  pharmacymaster..pm_territory t on p.territory=t.territory

where [Print Rebate Letter] = 1
and [Rebate to Pay Acct/Admin] >= 10.00
and [pay account]=1
and [rebate administrator] like 'KEYSTONE%' 


order by r.pmid


select * from reports..tmp_API2011Q2_mailmerge_Keystone order by [vendor id]
end


GO
