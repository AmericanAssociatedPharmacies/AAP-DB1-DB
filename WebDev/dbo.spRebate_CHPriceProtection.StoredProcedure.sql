USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_CHPriceProtection]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRebate_CHPriceProtection]
(
	@PMID int
)
/*
BG 10/27/14
Originally started with 8/14 rebate paid in 9/2014 payment file, date adjustment removed 2/15
Note that the rebate-paid file date shown here is 1 month greater than the detail in pharmacymaster..CA_PriceProtection
*/
as
begin
declare @startdate_CHMonthly datetime
set @startdate_CHMonthly = '9/1/2014'
select 
top 6
convert(varchar,[date],101) as [filedate]
-- ***HACK FOR FIRST MONTH, removed 2/15 BG***
--,case when [date]='9/1/2014' then 'August 2014' else datename(month,[date]) + ' ' + convert(varchar(4),year([date])) end as [Rebate For]
,datename(month,[date]) + ' ' + convert(varchar(4),year([date])) as [Rebate For]
,'$' + convert(varchar(50),round(isnull([PriceProtectionRebate],0.0),2,1),-1) as [Rebate Amount]
--,'' as Detail

from pharmacymaster..PM_Rebates_CHAAP
	where pmid=@PMID
	and [date] >= @startdate_CHMonthly
	order by [date] desc
end
GO
