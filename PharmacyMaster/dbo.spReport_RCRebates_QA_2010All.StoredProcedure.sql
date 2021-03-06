USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spReport_RCRebates_QA_2010All]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spReport_RCRebates_QA_2010All]
as
select 1 as sort, 'RC' as source,'[Planogram Rebate 2010]' as type,sum([Planogram Rebate 2010]) from reports..report_RCRebates_2010All
union
select 2 as sort,'import' as source,'[rebate]' as type,sum([rebate]) as total from reports..import_PlanogramRebate2010
	s left join pharmacymaster..v_pm_allwithaffiliates p on s.pmid=p.pmid
	where  ((p.Affiliate is null or p.Affiliate='')
	or (p.Affiliate not in ('PIPCO','PFOA') and p.Affiliate not like 'KEYSTONE%' and p.Affiliate not like 'LEGEND%'))
union
select 3 as sort,'RC' as source,'[API Generic Incentive 2010]' as type,sum([API Generic Incentive 2010])  as total from reports..report_RCRebates_2010All
union
select 4 as sort,'import' as source,'[Generic Incentive]' as type,sum([Generic Incentive]) as total from reports..import_APIGenericIncentive041311
	s left join pharmacymaster..v_pm_allwithaffiliates p on s.pmid=p.pmid
	where  ((p.Affiliate is null or p.Affiliate='')
	or (p.Affiliate not in ('PIPCO','PFOA') and p.Affiliate not like 'KEYSTONE%' and p.Affiliate not like 'LEGEND%'))
union
select 5 as sort,'RC' as source,'[AAP Patronage Dividend 2010]' as type,sum([AAP Patronage Dividend 2010]) as total from reports..report_RCRebates_2010All
union
select 6 as sort,'import' as source,'[total pd]' as type,sum(isnull([total pd],0)) as total from reports..import_PatDiv2010
	s left join pharmacymaster..v_pm_allwithaffiliates p on s.pmid=p.pmid
	where  ((p.Affiliate is null or p.Affiliate='')
	or (p.Affiliate not in ('PIPCO','PFOA') and p.Affiliate not like 'KEYSTONE%' and p.Affiliate not like 'LEGEND%'))
union
select 7 as sort,'RC' as source,'total less new' as type,sum([Total YTD All Rebates 2010]-[Planogram Rebate 2010]-[API Generic Incentive 2010]-[AAP Patronage Dividend 2010]) as total from reports..report_RCRebates_2010All
union
select 8 as sort,'0211' as source,'[Total YTD All Rebates 2010]' as type,sum([Total YTD All Rebates 2010]) as total from reports..report_RCRebates_0211
	s left join pharmacymaster..v_pm_allwithaffiliates p on s.pmid=p.pmid
	where  ((p.Affiliate is null or p.Affiliate='')
	or (p.Affiliate not in ('PIPCO','PFOA') and p.Affiliate not like 'KEYSTONE%' and p.Affiliate not like 'LEGEND%'))

GO
