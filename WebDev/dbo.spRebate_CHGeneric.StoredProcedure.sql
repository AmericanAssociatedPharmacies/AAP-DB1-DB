USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_CHGeneric]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
this replaces spRebate_CHGeneric, spRebate_CHGeneric_PMIDList
BG 2012 - show recent CH rebates, with conditional rows.
added msi and leader rebate (conditional) BG 8/12
added check fee 9/12
added price protection 2/15
added payment date 6/15
added NCPA fee 3/16
changed code to use alter table for conditional columns 3/16

--[spRebate_CHGeneric_test] '105784'
---grant exec on [spRebate_CHGeneric] to webdevuser
*/

CREATE proc [dbo].[spRebate_CHGeneric]
(
	@PMIDList varchar(255)
)
as
begin

declare @leader float
--declare @msi float
declare @checkfee float
declare @ncpa float
 
--todo: last leader rebate in 2015, may no longer need included/excluded
select @leader = 
sum(isnull(leaderrebate,0.0)) from 
pharmacymaster..PM_Rebates_CHAAP
--where pmid= @PMID
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] in (select distinct top 4 [date] from pharmacymaster..PM_Rebates_CHAAP order by [date] desc)

select @checkfee = 
sum(isnull([check fee],0.0)) from 
pharmacymaster..PM_Rebates_CHAAP
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] in (select distinct top 4 [date] from pharmacymaster..PM_Rebates_CHAAP order by [date] desc)

select @ncpa = 
sum(isnull(NCPAMembershipFee,0.0)) from 
pharmacymaster..PM_Rebates_CHAAP
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] in (select distinct top 4 [date] from pharmacymaster..PM_Rebates_CHAAP order by [date] desc)


	select top 4
	datename(month,[date]) + ' ' + convert(varchar(4),year([date])) as [Rebate Date],
	'$' + convert(varchar(50),round([SourceGenericSales],2,1),-1) as [Generic Sales],
	'$' + convert(varchar(50),round([GenericRebate],2,1),-1) as [Generic Rebate Amount],
	convert(varchar(50),round([EffRebatePerc],2,1)) + '%' as [Rebate %],
	convert(varchar(50),round([HRTA],2,1)) + '%' as [HRTA %],
	'$' + convert(varchar(50),round([msirebate],2,1),-1) as [MSI Rebate],
	'$' + convert(varchar(50),round([leaderrebate],2,1),-1) as [Leader Rebate],
	'$' + convert(varchar(50),round(isnull([PriceProtectionRebate],0.0),2,1),-1) as [Price Protection],
	'$' + convert(varchar(50),round([check fee],2,1),-1) as [Check Fee],	
	'$-' + convert(varchar(50),round([NCPAMembershipFee],2,1),-1) as [NCPA Fee],	
	'$' + convert(varchar(50),round([AretePerformanceRebate],2,1),-1) as [Arete Rebate],
	'$' + convert(varchar(50),round([COGRebate],2,1),-1) as [Other],
	'$' + convert(varchar(50),round([PayToStore],2,1),-1) as [Total]	
	,(select top 1 convert(varchar,PaymentDate,101) from  pharmacymaster..pm_rebates_paymentdates d where d.RebateMonth=[date] and RebateType='CH') as [Payment Date**]
	into #tempCHGeneric
	from
	pharmacymaster..PM_Rebates_CHAAP
	--where pmid=@PMID
	where pmid in (select * from ufn_CommaListToTable(@PMIDList))
	order by [date] desc
	
IF @checkfee = 0.0
	begin
	ALTER TABLE #tempCHGeneric DROP COLUMN [Check Fee]
	end
if  @leader = 0.0
	begin
	ALTER TABLE #tempCHGeneric DROP COLUMN [Leader Rebate]
	end
if  @ncpa = 0.0
	begin
	ALTER TABLE #tempCHGeneric DROP COLUMN [NCPA Fee]
	end
select *
from #tempCHGeneric
end	

GO
