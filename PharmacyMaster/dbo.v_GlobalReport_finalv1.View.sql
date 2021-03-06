USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_GlobalReport_finalv1]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[v_GlobalReport_finalv1]
as
--edit the date range in v_GlobalReport_volume3
select g.pmid, 
p.aapaccountno,
p.accountname,
p.city,
p.state as st,
p.territory as tm,
p.dea,
p.affiliate as aff,
p.businessclass as bc,
--g.[date],
--g.[month], 
g.[period],
g.[Gen Src], g.[Gen Exc], g.[Gen Total], g.[CH Br], g.[CH Oth], g.[CH Total], 
g.API_BR, g.API_GEN, g.API_OTC, g.API_Total, 
g.ML_Total, g.Anda_Total, g.All_Total

from 
v_GlobalReport_volume_forPeriod g 
	left join 
v_PM_AllWithAffiliates p
	on g.pmid=p.pmid
--order by g.pmid
GO
