USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[spReport_CHRebate_HVRebate0511_mailmerge_add]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc
[dbo].[spReport_CHRebate_HVRebate0511_mailmerge_add]
as
--mailmerge for HV rebate 5/23/11
begin
drop table reports..tmp_HVRebate0511_mailmerge_add

select r.pmid as [Vendor ID],
ch.[chaccountnoprimary],
case when (p.ownername is null or ltrim(p.ownername)='') then p.contactfullname else p.ownername end as Contact,
p.[accountname] as [Account Name],
case when (p.corporatename is null or ltrim(p.corporatename)='') then p.accountname else p.corporatename end as [Corporate Name],
--x.Group_Name as PMAffiliation,
f.address,
f.address2,
f.city,
f.state,
f.zip,
'April 2011' as [month],

r.[AAP Brand RX Sales],
r.[High Volume Incentive],
r.[COG Reduction],

p.aapaccountno as aapid,
--p.territory,
t.firstname + ' ' + t.lastname as TMName

into reports..tmp_HVRebate0411_mailmerge_add
from reports..import_HighVolRebate0411_add r
left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid
left join pharmacymaster..v_address_mailing_financials f on r.pmid=f.pmid
left join pharmacymaster..v_address_primary a on r.pmid=a.pmid
left join  pharmacymaster..pm_territory t on p.territory=t.territory
left join pharmacymaster..pm_chaccounts_adj ch on r.pmid=ch.pmid
--where [Pay to store] >= 10.00
order by r.pmid


select * from reports..tmp_HVRebate0411_mailmerge_add order by [vendor id]
end
GO
