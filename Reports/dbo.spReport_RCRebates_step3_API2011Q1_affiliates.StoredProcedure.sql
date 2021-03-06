USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[spReport_RCRebates_step3_API2011Q1_affiliates]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spReport_RCRebates_step3_API2011Q1_affiliates]
as
-- Report Card Rebates step 3 
-- no change except table names from spReport_RCRebates_step3_API2011Q1
-- add pharmacy descriptions and use isnull,0 on all fields
-- excludes affiliates where GR is paid to aff. office
-- source: report_RCRebates_API2011Q1_pivotedData, v_Address_Mailing_Financials, v_PM_AllWithAffiliates
-- output: report_RCRebates_API2011Q1


begin
drop table reports..report_RCRebates_API2011Q1_affiliates
--go

select 
p.Territory as TM,
p.pmid,
p.aapaccountno as [AAP#],
p.aapparentno as [Parent#],
p.apiaccountno as [API#],
CONVERT(VARCHAR(8), p.AAPEffectiveDate, 1)  as [AAP Eff],
CONVERT(VARCHAR(8), p.AAPQuitDate, 1)  as [AAP Quit],
p.AccountDescription as [Description],
p.Affiliate,
p.[accountname] as [Account DBA Name],
p.[corporatename] as [Account Corporate Name],
p.Addr1 as [Address],
p.City, p.State as St,
(select case when p.ownername is null or ltrim(p.ownername)='' then 
	case when (select distinct contactfullname from pharmacymaster..v_Address_Mailing_Financials 
		where pharmacymaster..v_Address_Mailing_Financials.pmid=p.pmid) is null then p.contactfullname
	else (select distinct contactfullname from pharmacymaster..v_Address_Mailing_Financials 
		where pharmacymaster..v_Address_Mailing_Financials.pmid=p.pmid) end
	else p.ownername end ) as Contact,
--from chr mailmerge--case when (p.ownername is null or ltrim(p.ownername)='') then p.contactfullname else p.ownername end as Contact,
case when p.MCQuitDate is null then p.Chaincode else null end as [MC Network],

isnull(r.[PP Rebate 2011Q1],0) as [PP Rebate 2011Q1],
isnull(r.[PP Rebate 2011Q2],0) as [PP Rebate 2011Q2],
isnull(r.[PP Rebate 2011Q3],0) as [PP Rebate 2011Q3],
isnull(r.[PP Rebate 2011Q4],0) as [PP Rebate 2011Q4],
isnull(r.[Total PP Rebate 2011],0) as [Total PP Rebate 2011],
isnull(r.[Q1 API Whse Rebate],0) as [Q1 API Whse Rebate],
isnull(r.[Q1 API Generic Rebate%],0) as [Q1 API Generic Rebate%],
isnull(r.[Q2 API Whse Rebate],0) as [Q2 API Whse Rebate],
isnull(r.[Q2 API Generic Rebate%],0) as [Q2 API Generic Rebate%],
isnull(r.[Q3 API Whse Rebate],0) as [Q3 API Whse Rebate],
isnull(r.[Q3 API Generic Rebate%],0) as [Q3 API Generic Rebate%],
isnull(r.[Q4 API Whse Rebate],0) as [Q4 API Whse Rebate],
isnull(r.[Q4 API Generic Rebate%],0) as [Q4 API Generic Rebate%],
isnull(r.[Total API Whse Rebate 2011],0) as [Total API Whse Rebate 2011],
isnull(r.[Leader AAP 2011Q1],0) as [Leader AAP 2011Q1],
isnull(r.[Leader AAP 2011Q2],0) as [Leader AAP 2011Q2],
isnull(r.[Leader AAP 2011Q3],0) as [Leader AAP 2011Q3],
isnull(r.[Leader AAP 2011Q4],0) as [Leader AAP 2011Q4],
isnull(r.[Total Leader AAP 2011],0) as [Total Leader AAP 2011],

isnull(r.[01/11 Source Sales],0) as [01/11 Source Sales],
isnull(r.[01/11 AAP Gen Rebate],0) as [01/11 AAP Gen Rebate],
isnull(r.[01/11 Avg%],0) as [01/11 Avg%],
isnull(r.[01/11 HRTA%],0) as [01/11 HRTA%],
isnull(r.[02/11 Source Sales],0) as [02/11 Source Sales],
isnull(r.[02/11 AAP Gen Rebate],0) as [02/11 AAP Gen Rebate],
isnull(r.[02/11 Avg%],0) as [02/11 Avg%],
isnull(r.[02/11 HRTA%],0) as [02/11 HRTA%],
isnull(r.[03/11 Source Sales],0) as [03/11 Source Sales],
isnull(r.[03/11 AAP Gen Rebate],0) as [03/11 AAP Gen Rebate],
isnull(r.[03/11 Avg%],0) as [03/11 Avg%],
isnull(r.[03/11 HRTA%],0) as [03/11 HRTA%],

isnull(r.[Total CH AAP Gen Rebate 2011],0) as [Total CH AAP Gen Rebate 2011],

isnull(r.[Planogram Rebate 2011],0) as [Planogram Rebate 2011],
isnull(r.[API Generic Incentive 2011],0) as [API Generic Incentive 2011],
isnull(r.[AAP Patronage Dividend 2011],0) as [AAP Patronage Dividend 2011],

isnull(r.[Total YTD All Rebates 2011],0) as [Total YTD All Rebates 2011]


into reports..report_RCRebates_API2011Q1_affiliates

from reports..report_RCRebates_API2011Q1_pivotedData r
left join pharmacymaster..v_PM_AllWithAffiliates p on r.pmid=p.pmid

where p.pmid is not null
and isnull([Total YTD All Rebates 2011],0) <>0
--and ((p.Affiliate is null or p.Affiliate='')
--or (p.Affiliate not in ('PIPCO','PFOA') and p.Affiliate not like 'KEYSTONE%' and p.Affiliate not like 'LEGEND%'))
and (p.Affiliate in ('PIPCO','PFOA') or p.Affiliate like 'KEYSTONE%' or p.Affiliate like 'LEGEND%')
--PFOA added _0211

select * from reports..report_RCRebates_API2011Q1_affiliates
end
GO
