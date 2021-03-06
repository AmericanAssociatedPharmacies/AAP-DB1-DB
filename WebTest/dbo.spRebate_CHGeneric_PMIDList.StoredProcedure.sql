USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_CHGeneric_PMIDList]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
added msi and leader rebate (conditional) BG 8/12
added check fee 9/12
added price protection 2/15
added payment date 6/15
*/

--drop proc [spRebate_CHGeneric_test]

CREATE proc [dbo].[spRebate_CHGeneric_PMIDList]
(
	@PMIDList varchar(255)
)
as
begin

declare @leader float
--declare @msi float
declare @checkfee float

select @leader = 
sum(isnull(leaderrebate,0.0)) from 
pharmacymaster..PM_Rebates_CHAAP
--where pmid= @PMID
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] in (select distinct top 6 [date] from pharmacymaster..PM_Rebates_CHAAP order by [date] desc)

select @checkfee = 
sum(isnull([check fee],0.0)) from 
pharmacymaster..PM_Rebates_CHAAP
--where pmid= @PMID
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] in (select distinct top 6 [date] from pharmacymaster..PM_Rebates_CHAAP order by [date] desc)


IF @checkfee = 0.0
BEGIN
IF @leader = 0.0 --and @msi = 0.0
	BEGIN

	select top 4
	datename(month,[date]) + ' ' + convert(varchar(4),year([date])) as [Rebate Date],
	'$' + convert(varchar(50),round([SourceGenericSales],2,1),-1) as [Generic Sales],
	'$' + convert(varchar(50),round([GenericRebate],2,1),-1) as [Generic Rebate Amount],
	convert(varchar(50),round([EffRebatePerc],2,1)) + '%' as [Rebate %],
	convert(varchar(50),round([HRTA],2,1)) + '%' as [HRTA %],
	'$' + convert(varchar(50),round([msirebate],2,1),-1) as [MSI Rebate],
	'$' + convert(varchar(50),round(isnull([PriceProtectionRebate],0.0),2,1),-1) as [Price Protection],
	'$' + convert(varchar(50),round([PayToStore],2,1),-1) as [Total]
	,(select top 1 convert(varchar,PaymentDate,101) from  pharmacymaster..pm_rebates_paymentdates d where d.RebateMonth=[date] and RebateType='CH') as [Payment Date**]
	from
	pharmacymaster..PM_Rebates_CHAAP
	--where pmid=@PMID
	where pmid in (select * from ufn_CommaListToTable(@PMIDList))
	order by [date] desc

	END
ELSE
	BEGIN
	select top 4
	datename(month,[date]) + ' ' + convert(varchar(4),year([date])) as [Rebate Date],
	'$' + convert(varchar(50),round([SourceGenericSales],2,1),-1) as [Generic Sales],
	'$' + convert(varchar(50),round([GenericRebate],2,1),-1) as [Generic Rebate Amount],
	convert(varchar(50),round([EffRebatePerc],2,1)) + '%' as [Rebate %],
	convert(varchar(50),round([HRTA],2,1)) + '%' as [HRTA %],
	'$' + convert(varchar(50),round([msirebate],2,1),-1) as [MSI Rebate],
	'$' + convert(varchar(50),round([leaderrebate],2,1),-1) as [Leader Rebate],
	'$' + convert(varchar(50),round(isnull([PriceProtectionRebate],0.0),2,1),-1) as [Price Protection],
	'$' + convert(varchar(50),round([PayToStore],2,1),-1) as [Total]	
	,(select top 1 convert(varchar,PaymentDate,101) from  pharmacymaster..pm_rebates_paymentdates d where d.RebateMonth=[date] and RebateType='CH') as [Payment Date**]
	from
	pharmacymaster..PM_Rebates_CHAAP
	--where pmid=@PMID
	where pmid in (select * from ufn_CommaListToTable(@PMIDList))
	order by [date] desc
		
	END
END
ELSE --checkfee
BEGIN
IF @leader = 0.0 --and @msi = 0.0
	BEGIN

	select top 4
	datename(month,[date]) + ' ' + convert(varchar(4),year([date])) as [Rebate Date],
	'$' + convert(varchar(50),round([SourceGenericSales],2,1),-1) as [Generic Sales],
	'$' + convert(varchar(50),round([GenericRebate],2,1),-1) as [Generic Rebate Amount],
	convert(varchar(50),round([EffRebatePerc],2,1)) + '%' as [Rebate %],
	convert(varchar(50),round([HRTA],2,1)) + '%' as [HRTA %],
	'$' + convert(varchar(50),round([msirebate],2,1),-1) as [MSI Rebate],
	'$' + convert(varchar(50),round(isnull([PriceProtectionRebate],0.0),2,1),-1) as [Price Protection],
	'$' + convert(varchar(50),round([check fee],2,1),-1) as [Check Fee],
	'$' + convert(varchar(50),round([PayToStore],2,1),-1) as [Total]
	,(select top 1 convert(varchar,PaymentDate,101) from  pharmacymaster..pm_rebates_paymentdates d where d.RebateMonth=[date] and RebateType='CH') as [Payment Date**]
	from
	pharmacymaster..PM_Rebates_CHAAP
	--where pmid=@PMID
	where pmid in (select * from ufn_CommaListToTable(@PMIDList))
	order by [date] desc

	END
ELSE
	BEGIN
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
	'$' + convert(varchar(50),round([PayToStore],2,1),-1) as [Total]	
	,(select top 1 convert(varchar,PaymentDate,101) from  pharmacymaster..pm_rebates_paymentdates d where d.RebateMonth=[date] and RebateType='CH') as [Payment Date**]
	from
	pharmacymaster..PM_Rebates_CHAAP
	--where pmid=@PMID
	where pmid in (select * from ufn_CommaListToTable(@PMIDList))
	order by [date] desc
		
	END
END --checkfee
end
GO
