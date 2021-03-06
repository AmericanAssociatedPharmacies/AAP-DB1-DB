USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_APIGeneric_PFOA]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spRebate_APIGeneric_PFOA]
(
	@PMID int
)
as
/*
B.Grant 6/2014
changed from quarterly to monthly 4/2014. 
PFOA data does not include 1% holdback prior to 7/2014, applied here. The calling program is rebate_report.php 
removed quarterly display and limited to 6 mos 12/11/14 bg
added payment date 6/15
*/
begin

declare @pfoa_adjustment float
set @pfoa_adjustment = 0.99


select 
top 6
datename(month,[date]) + ' ' + convert(varchar(4),year([date])) as [Rebate For],
'$' + convert(varchar(50),round([API Generic Sales],2,1),-1) as [API Generic Sales],
case when [date] < '7/1/2014' then
'$' + convert(varchar(50),round([Net Rebate to Store]*@pfoa_adjustment,2,1),-1) 
else
'$' + convert(varchar(50),round([Net Rebate to Store],2,1),-1)
end as [Rebate Amount]
,(select top 1 convert(varchar,PaymentDate,101) from  pharmacymaster..pm_rebates_paymentdates d 
	where d.RebateMonth=[date] and RebateType='API' order by PaymentDate desc) as [Payment Date**]

--,convert(varchar(50),round([Avg Rebate Percentage]*100.0,2,1)) + '%' as [Rebate Percentage]

from pharmacymaster..v_web_PM_Rebates_APIMonthly --changed to use view 9/2014, view sums multiple api accounts
where pmid=@PMID

order by [date] desc


end

GO
