USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[spReport_CHRebate0611_Summary]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spReport_CHRebate0611_Summary]
as
--qa2
--summarizes CH Rebate monthly file C:\reports\CHRebates\sql\prior to creating reports and import files


select 1 as [sort],
'all' as type, 
count(pmid) as [stores #],
--count(case when [pay to store] = 0 then null else [pay to store] end) as [pay store #],
sum(case when [pay to store] = 0 then 0 else 1 end) as [pay store #],
sum([pay to store]) as [pay store $], 
sum(round([pay to store],2)) as [rounded pay store $], 
sum(case when [pay to affiliate office] = 0 then 0 else 1 end) as [pay affiliate #],
sum([pay to affiliate office]) as [pay to affiliate office $], 
sum(round([pay to affiliate office],2)) as [rounded pay affiliate $]
from pharmacymaster..v_pm_rebates_chaap where date='6/1/11'

union
select  2 as [sort],'>= $10' as type, 
count(pmid) as [stores #],
sum(case when [pay to store] <10 then 0 else 1 end) as [pay store #],
sum(case when [pay to store] <10 then 0 else [pay to store] end) as [pay store $],
sum(case when round([pay to store],2) <10 then 0 else round([pay to store],2) end) as [rounded pay store $],
sum(case when [pay to affiliate office] <10 then 0 else 1 end) as [pay affiliate #],
sum(case when [pay to affiliate office] <10 then 0 else [pay to affiliate office] end) as [pay to affiliate office $],
sum(case when [pay to affiliate office] <10 then 0 else round([pay to affiliate office],2) end) as [rounded pay affiliate $]
from pharmacymaster..v_pm_rebates_chaap where date='6/1/11'
and ([pay to store] >= 10 or [pay to affiliate office] >= 10)


union
select  3 as [sort],
'< $10' as type, 
count(pmid) as [stores #],
sum(case when [pay to store] >=10 or [pay to store] = 0  then 0 else 1 end) as [pay store #],
sum(case when [pay to store] >=10 or [pay to store] = 0  then 0 else [pay to store] end) as [pay store $],
sum(case when [pay to store] >=10 or [pay to store] = 0  then 0 else round([pay to store],2) end) as [rounded pay store $],
sum(case when [pay to affiliate office] >=10 or [pay to affiliate office]= 0  then 0 else 1 end) as [pay affiliate #],
sum(case when [pay to affiliate office] >=10  then 0 else [pay to affiliate office] end) as [pay to affiliate office $],
sum(case when [pay to affiliate office] >=10  then 0 else round([pay to affiliate office],2) end) as [rounded pay affiliate $]
from pharmacymaster..v_pm_rebates_chaap where date='6/1/11'
and ([pay to store]+[pay to affiliate office]) < 10

union
select  4 as [sort],
'0 payment' as type, 
count(pmid) as [stores #],
count([pay to store]) as [pay store #],
sum([pay to store]) as [pay store $], 
sum(round([pay to store],2)) as [rounded pay store $], 
null [pay affiliate #],
null as [pay to affiliate office $], 
null as [rounded pay affiliate $]
from pharmacymaster..v_pm_rebates_chaap where date='6/1/11'
and ([pay to store] + [pay to affiliate office] = 0)
GO
