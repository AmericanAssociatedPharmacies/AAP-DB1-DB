USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_APIGeneric2]    Script Date: 12/22/2020 5:26:55 AM ******/
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
replaced [spRebate_APIGeneric] 11/2015 to allow a comma-separated list of linked PMIDs, maintained in the table RebateLinkedPMIDs
and passed as parameter BG
*/
begin
select 
top 6
datename(month,[date]) + ' ' + convert(varchar(4),year([date])) as [Rebate For],
'$' + convert(varchar(50),round([API Generic Sales],2,1),-1) as [API Generic Sales],
'$' + convert(varchar(50),round([Net Rebate to Store],2,1),-1) as [Rebate Amount],
convert(varchar(50),round([Avg Rebate Percentage]*100.0,2,1)) + '%' as [Rebate Percentage]
,(select top 1 convert(varchar,PaymentDate,101) from  pharmacymaster..pm_rebates_paymentdates d where d.RebateMonth=[date] and RebateType='API') as [Payment Date**]

from pharmacymaster..v_web_PM_Rebates_APIMonthly --changed to use view 9/2014, view sums multiple api accounts
--where cast(pmid as varchar) in (@PMIDList)
where pmid in (select * from ufn_CommaListToTable(@PMIDList))
order by [date] desc
end
GO
