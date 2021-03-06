USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spGlobalReport_delete_0810]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spGlobalReport_delete_0810]
@period varchar(20),
@datestart datetime,
@dateendArg datetime
--this adds in a temp table with CHPH estimates of 8/10 UD PVA volume
--example spGlobalReport 'Q1QA','1/1/2010','3/1/2010'
--7/27/10 renamed fields and added QA columns
as
declare @dateend datetime
select @dateend = case when @dateendArg='' then @datestart else @dateendArg end

select g.pmid as PMID, 
p.aapaccountno as [AAP #],
p.aapparentno as [Parent #],
p.accountname as [Account Name],
p.City,
p.state as St,
p.territory as TM,
p.DEA,
p.affiliate as Affiliate,
p.businessclass as BC,
--g.[date],
--g.[month], 
g.[Period], --hide or remove in final report
isnull(g.[Gen Src],0) as [Gen Src], 
isnull(g.[Gen Exc],0) as [Gen Exc], 
isnull(g.[Gen Total],0) as [Gen Total], 
isnull(g.[CH Br],0) as [CH Br], 
isnull(g.[CH Oth],0) as [CH Oth], 
isnull(g.[UD Adm],0) as [UD No Category*],
isnull(g.[CH Total],0) as [CH Total], 
isnull(g.API_GEN ,0) as [API Gen],
isnull(g.API_BR,0) as [API Br],  
isnull(g.API_OTC,0) as [API OTC], 
isnull(g.API_Total,0) as [API Total], 
isnull(g.ML_Total,0) as [ML Total], 
isnull(g.Anda_Total,0) as [Anda Total], 
isnull(g.All_Total,0) as [All Total]

from 
(
select g.pmid, 
@period as period,
sum(isnull(g.[Gen Src],0)+ isnull(t.UDGeneric,0)) as [Gen Src], 
sum(isnull(g.[Gen Exc],0)) as [Gen Exc], 
sum(isnull(g.[Gen Total],0) + isnull(t.UDGeneric,0)) as [Gen Total], 
sum(isnull(g.[CH Br],0) + isnull(t.UDBrand,0)) as [CH Br], 
sum(isnull(g.[CH Oth],0) + isnull(t.UDOTC,0)) as [CH Oth], 
sum(isnull(g.[UD Adm],0)) as [UD Adm], 
sum(isnull(g.[CH Total],0) + isnull(t.UDNetSales,0)) as [CH Total], 
sum(isnull(g.API_BR,0)) as [API_BR], 
sum(isnull(g.API_GEN,0)) as [API_GEN], 
sum(isnull(g.API_OTC,0)) as [API_OTC], 
sum(isnull(g.API_Total,0)) as [API_Total], 
sum(isnull(g.ML_Total,0)) as ML_Total, 
sum(isnull(g.Anda_Total,0)) as Anda_Total, 
sum(isnull(g.All_Total,0)) as All_Total
from 
tmp_GlobalReport_volume g
left join
purchases..tmp_delete_CHPH_0810 t on g.pmid=t.pmid
--tmp_delete_CHPH0810 t on g.pmid=t.pmid
where [date]>=@datestart and [date]<=@dateend
group by g.pmid
) g
	left join 
v_PM_AllWithAffiliates p
	on g.pmid=p.pmid

order by dbo.GlobalReport_KludgeSort(g.pmid) 
GO
