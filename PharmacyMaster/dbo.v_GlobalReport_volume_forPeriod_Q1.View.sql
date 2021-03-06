USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_GlobalReport_volume_forPeriod_Q1]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_GlobalReport_volume_forPeriod_Q1]
as
select g.pmid, 
'Q1/2010' as period,
sum(g.[Gen Src]) as [Gen Src], sum(g.[Gen Exc]) as [Gen Exc], sum(g.[Gen Total]) as [Gen Total], 
sum(g.[CH Br]) as [CH Br], sum(g.[CH Oth]) as [CH Oth], sum(g.[CH Total]) as [CH Total], 
sum(g.API_BR) as [API_BR], sum(g.API_GEN) as [API_GEN], sum(g.API_OTC) as [API_OTC], 
sum(g.API_Total) as [API_Total], 
sum(g.ML_Total) as ML_Total, sum(g.Anda_Total) as Anda_Total, sum(g.All_Total) as All_Total
from 
v_GlobalReport_volume g
where [month] in ('1/2010','2/2010','3/2010')
group by g.pmid
GO
