USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_APIGeneric2]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRebate_APIGeneric2]
(
	@PMIDList varchar(255)
)
as
/*
10/5/2016 changed date from 15th to 10th per Joni. 


9/13/16: delay showing current (payout) month until 15th of the month. 'payment for'/accrual month = 7/2016, payout month=9/2016
so if today < 9/15/2016, show dates prior to 7/1/2016 ([date] always 1st of month), otherwise show prior to 8/1/2016

declare @DelayTill10th datetime
select @DelayTill10th = case when datepart(day,getdate()) >= 15 
	then dateadd(month,-2,getdate()) 
	else dateadd(month,-3,getdate()) end  --9/13=>6/13 returns through 6/1, 9/15=>7/15 returns through 7/1, 10/1=>7/1, 10/16=>8/16
add
where.. [date] <= @DelayTill10th

replaced [spRebate_APIGeneric] 11/2015 to allow a comma-separated list of linked PMIDs, maintained in the table RebateLinkedPMIDs
and passed as parameter BG. 9/2016: Although this was a requirement at the time, I don't think anyone is maintaining the table.


*/
begin
declare @DelayTill10th datetime
select @DelayTill10th = case when datepart(day,getdate()) >= 10 -- previously @DelayTill15th changed date from 15th to 10th per Joni  10/5/2016 
	then dateadd(month,-2,getdate()) 
	else dateadd(month,-3,getdate()) end

select 
top 6
datename(month,[date]) + ' ' + convert(varchar(4),year([date])) as [Rebate For],
'$' + convert(varchar(50),round([API Generic Sales],2,1),-1) as [API Generic Sales],
'$' + convert(varchar(50),round([Net Rebate to Store],2,1),-1) as [Rebate Amount],
--convert(varchar(50),round([Avg Rebate Percentage]*100.0,2,1)) + '%' as [Rebate Percentage]
[Avg Rebate Percentage] as [Rebate Percentage]
,(select top 1 convert(varchar,PaymentDate,101) from  pharmacymaster..pm_rebates_paymentdates d 
	where d.RebateMonth=[date] and RebateType='API' order by PaymentDate desc) as [Payment Date**] 

from pharmacymaster..v_web_PM_Rebates_APIMonthly --changed to use view 9/2014, view sums multiple api accounts
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
and [date] <= @DelayTill10th
order by [date] desc
end

/*
tests:

declare @DelayTill15th datetime 
select @DelayTill15th = case when datepart(day,getdate()) >= 15 then dateadd(month,-2,getdate()) else dateadd(month,-3,getdate()) end
select @DelayTill15th
--returns 6/13 on 9/13
 
declare @DelayTill15th datetime
declare @dt datetime
set @dt = '9/13/2016' --returns 6/13, won't show 7/1
--set @dt = '9/15/2016' --returns 7/15, shows 7/1
--set @dt = '10/1/2016'  --returns 7/1, shows 7/1
--set @dt = '10/16/2016'  --returns 8/16, shows 8/1
select @DelayTill15th = case when datepart(day,@dt) >= 15 then dateadd(month,-2,@dt)  else dateadd(month,-3,@dt) end
select @DelayTill15th 

select top 1 * from pharmacymaster..v_web_PM_Rebates_APIMonthly order by date desc
pmid 100071 
[spRebate_APIGeneric2] 100071


*/
GO
