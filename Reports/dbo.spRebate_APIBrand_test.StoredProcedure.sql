USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_APIBrand_test]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[spRebate_APIBrand_test]
(
	@PMIDList varchar(255)
)
as
begin
declare @monthsInNewTable int
declare @startDateNewTable datetime
declare @latestDateNewTable datetime
declare @startDateOldTable datetime

select @startDateNewTable = min([date]) from pharmacymaster..PM_BrandCredits_APIMonthly
select @latestDateNewTable= max([date]) from pharmacymaster..PM_BrandCredits_APIMonthly
select @monthsInNewTable = datediff(mm,@startDateNewTable,@latestDateNewTable)
select @startDateOldTable = dateadd(mm,(@monthsInNewTable-6),@startDateNewTable)

select
max([Credit For])
,max([API Brand Rx Purchases])
, max([API Brand Rx Incentive Credit])
from
(
select  
[date],
datename(month,[date]) + ' ' + convert(varchar(4),year([date]))  as [Credit For],
'$' + convert(varchar(50),round([API Brand Sales],2,1),-1) as [API Brand Rx Purchases],
'$' + convert(varchar(50),round([Brand Credits Disbursed],2,1),-1) as [API Brand Rx Incentive Credit]
from pharmacymaster..v_web_PM_Rebates_APIMonthly --changed to use view 9/2014, view sums multiple api accounts
where [date] > '01/01/2016'
and pmid in (select * from ufn_CommaListToTable(107219))
 
 
UNION
select top 6
[date],
datename(month,[date]) + ' ' + convert(varchar(4),year([date]))  as [Credit For],

'$' + convert(varchar(50),round([BrandSales],2,1),-1) as [API Brand Rx Purchases],
'$' + convert(varchar(50),round([BrandCredits],2,1),-1) as [API Brand Rx Incentive Credit]
from pharmacymaster..PM_BrandCredits_APIMonthly --changed to use new table 4/2016
where pmid in (select * from ufn_CommaListToTable(107219))
 
) dt group by [date] 
order by [date] desc
end
/*


select top 100 * from pharmacymaster..PM_BrandCredits_APIMonthly where [date]='05/01/2016' order by pmid
[spRebate_APIBrand2] 100053
select top 100 * from pharmacymaster..v_web_PM_Rebates_APIMonthly  where [date]='05/01/2016' order by pmid

*/


GO
