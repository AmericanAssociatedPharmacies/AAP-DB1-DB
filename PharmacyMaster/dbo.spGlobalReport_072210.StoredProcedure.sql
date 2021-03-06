USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spGlobalReport_072210]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGlobalReport_072210]	-- was _2
@period varchar(20),
@datestart datetime,
@dateend datetime
--example spGlobalReport_2 'Q1QA','1/1/2010','3/1/2010'

as

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
g.[Gen Src], g.[Gen Exc], g.[Gen Total], g.[CH Br], g.[CH Oth], g.[UD Adm],g.[CH Total], 
g.API_BR, g.API_GEN, g.API_OTC, g.API_Total, 
g.ML_Total, g.Anda_Total, g.All_Total

from 
(
select g.pmid, 
@period as period,
sum(g.[Gen Src]) as [Gen Src], sum(g.[Gen Exc]) as [Gen Exc], sum(g.[Gen Total]) as [Gen Total], 
sum(g.[CH Br]) as [CH Br], sum(g.[CH Oth]) as [CH Oth], sum(g.[UD Adm]) as [UD Adm], sum(g.[CH Total]) as [CH Total], 
sum(g.API_BR) as [API_BR], sum(g.API_GEN) as [API_GEN], sum(g.API_OTC) as [API_OTC], 
sum(g.API_Total) as [API_Total], 
sum(g.ML_Total) as ML_Total, sum(g.Anda_Total) as Anda_Total, sum(g.All_Total) as All_Total
from 
v_GlobalReport_volume g
where [date]>=@datestart and [date]<=@dateend
group by g.pmid
) g
	left join 
v_PM_AllWithAffiliates p
	on g.pmid=p.pmid
order by dbo.GlobalReport_KludgeSort(g.pmid)
GO
