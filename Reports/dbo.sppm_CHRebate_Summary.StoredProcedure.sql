USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_CHRebate_Summary]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[sppm_CHRebate_Summary]
(@in_month varchar(2),@in_year varchar(4))
as
--qa2
--summarizes CH Rebate monthly file C:\reports\CHRebates\sql\prior to creating reports and import files
-- This doesn't appear to be used anywhere

	DECLARE @date  varchar(10);
	SET @date = @in_month + '/1/' + @in_year;

select 1 as [sort],
'all' as type, 
count(pmid) as [stores #],
--count(case when PayToStore = 0 then null else PayToStore end) as [pay store #],
sum(case when PayToStore = 0 then 0 else 1 end) as [pay store #],
sum(PayToStore) as [pay store $], 
sum(round(PayToStore,2)) as [rounded pay store $], 
sum(case when PayToAffiliateOffice = 0 then 0 else 1 end) as [pay affiliate #],
sum(PayToAffiliateOffice) as [pay to affiliate office $], 
sum(round(PayToAffiliateOffice,2)) as [rounded pay affiliate $]
from pharmacymaster..pm_rebates_chaap where date= @date

union
select  2 as [sort],'>= $10' as type, 
count(pmid) as [stores #],
sum(case when PayToStore <10 then 0 else 1 end) as [pay store #],
sum(case when PayToStore <10 then 0 else PayToStore end) as [pay store $],
sum(case when round(PayToStore,2) <10 then 0 else round(PayToStore,2) end) as [rounded pay store $],
sum(case when PayToAffiliateOffice <10 then 0 else 1 end) as [pay affiliate #],
sum(case when PayToAffiliateOffice <10 then 0 else PayToAffiliateOffice end) as [pay to affiliate office $],
sum(case when PayToAffiliateOffice <10 then 0 else round(PayToAffiliateOffice,2) end) as [rounded pay affiliate $]
from pharmacymaster..pm_rebates_chaap where date= @date
and (PayToStore >= 10 or PayToAffiliateOffice >= 10)


union
select  3 as [sort],
'< $10' as type, 
count(pmid) as [stores #],
sum(case when PayToStore >=10 or PayToStore = 0  then 0 else 1 end) as [pay store #],
sum(case when PayToStore >=10 or PayToStore = 0  then 0 else PayToStore end) as [pay store $],
sum(case when PayToStore >=10 or PayToStore = 0  then 0 else round(PayToStore,2) end) as [rounded pay store $],
sum(case when PayToAffiliateOffice >=10 or PayToAffiliateOffice= 0  then 0 else 1 end) as [pay affiliate #],
sum(case when PayToAffiliateOffice >=10  then 0 else PayToAffiliateOffice end) as [pay to affiliate office $],
sum(case when PayToAffiliateOffice >=10  then 0 else round(PayToAffiliateOffice,2) end) as [rounded pay affiliate $]
from pharmacymaster..pm_rebates_chaap where date= @date
and (PayToStore + PayToAffiliateOffice) < 10

union
select  4 as [sort],
'0 payment' as type, 
count(pmid) as [stores #],
count(PayToStore) as [pay store #],
sum(PayToStore) as [pay store $], 
sum(round(PayToStore,2)) as [rounded pay store $], 
null [pay affiliate #],
null as [pay to affiliate office $], 
null as [rounded pay affiliate $]
from pharmacymaster..pm_rebates_chaap where date= @date
and (PayToStore + PayToAffiliateOffice = 0)
GO
