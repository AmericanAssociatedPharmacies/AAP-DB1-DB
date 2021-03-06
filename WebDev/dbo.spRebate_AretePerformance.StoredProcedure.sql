USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_AretePerformance]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE proc
 [dbo].[spRebate_AretePerformance]
 (
 @PMID Int
 )
 as
 /*
 7/16 show both pharmacymaster..v_web_PM_Rebates_APIMonthly.AreteRebateFee
 and pharmacymaster..PM_Rebates_CHAAP.[AretePerformanceRebate]
 rebate month is database month + 2 e.g. 6/1 => August

 Modified 1/18/17 per Shasta. Use case: PMID 100090 API 42018441  spRebate_AretePerformance 100090
 2/6/17 Bob Vaden:
	For the Arete Performance Rebate Table
	We need an asterisk (*) added that states Arete - AAP Rebate is based on purchases from two months prior and Arete API Rebate is based on purchases from one month prior.
	Also we also need to display the word "pending" when there is no data (aka $0.00 or $100.00) to display.
Added, but note there are no null entries in the source tables

3/17/17 January rebate not showing. Looking at the rebate tables data, it looks like the [date] 'database month' is now the rebate month for these.
It was previously entered as 2 months prior. Modified line 3 below, "[Rebate Date]"
 */
begin
select 
 --datename(month,dateadd(month,2,[Date])) + ' ' + convert(varchar(4),year(dateadd(month,2,[Date]))) as [Rebate Date]
 datename(month,[date]) + ' ' + convert(varchar(4),year([Date])) as [Rebate Date]
,case when [Arete - AAP Rebate] = -1.0 then 'Pending' else dbo.fnFormatCurrency([Arete - AAP Rebate]) end as [Arete - AAP Rebate]
,case when [Arete - API Rebate] = -1.0 then 'Pending' else dbo.fnFormatCurrency([Arete - API Rebate]) end as [Arete - API Rebate]

from
(
select
[date]
,sum([Arete - AAP Rebate]) as [Arete - AAP Rebate]
,sum([Arete - API Rebate]) as [Arete - API Rebate]

from
(
	select top 4
	[date] 
	,isnull([AretePerformanceRebate],-1.0) as [Arete - AAP Rebate] --use negative as a null flag
	,0.00 as [Arete - API Rebate]
	from
	pharmacymaster..PM_Rebates_CHAAP
	where pmid=@PMID
	--and [date] >= '6/1/2016'
	order by [date] desc
UNION

	select top 4
	[date]
	,0.00 as [Arete - AAP Rebate]
	,isnull(AreteRebateFee,-1.0) as [Arete - API Rebate]  --use negative as a null flag
	from
	pharmacymaster..v_web_PM_Rebates_APIMonthly
	where pmid=@PMID
	--and [date] >= '6/1/2016'
	order by [date] desc
) dt
	group by [Date]
) dt2
	order by [Date] desc
end

/*
QA

[spRebate_AretePerformance] 100071
[spRebate_AretePerformance] 100125
[spRebate_AretePerformance] 100415

select * from pharmacymaster..v_web_PM_Rebates_APIMonthly where AreteRebateFee is null
--none
select * from pharmacymaster..PM_Rebates_CHAAP where [AretePerformanceRebate] is null
--none

select top 1 * from PM_Rebates_APIMonthly

select * from pharmacymaster..[v_web_PM_Rebates_APIMonthly] where AreteRebateFee > 0

100110 both
100125 both
100138 both
100198
100366

select * from pharmacymaster..PM_Rebates_CHAAP where [areteperformancerebate] > 0

100029 AAP only
100071 "
105777
105784
105794

select * from pharmacymaster..[v_web_PM_Rebates_APIMonthly] where date='6/1/2016' and AreteRebateFee > 0
and pmid not in
(select pmid from pharmacymaster..PM_Rebates_CHAAP where date='6/1/2016' and [areteperformancerebate] > 0)

100022 API only
100415
100600
100873
101545

*/


GO
