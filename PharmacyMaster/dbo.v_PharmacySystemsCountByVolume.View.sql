USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_PharmacySystemsCountByVolume]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_PharmacySystemsCountByVolume]
as
select software,
count(1) as [count],
sum(volume_last12mos) as volume_last12mos_total,
avg(volume_last12mos) as volume_last12mos_average,
min(volume_last12mos) as volume_last12mos_min,
max(volume_last12mos) as volume_last12mos_max
from
v_PharmacySystemsByVolume v
left join pm_pharmacy p on p.pmid=v.pmid
where p.aapaccountno is not null and p.aapquitdate is null
group by software
GO
