USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_CHPriceProtDetail_replaced022315]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[spRebate_CHPriceProtDetail_replaced022315]
--ALTER proc [dbo].[spRebate_CHPriceProtDetail]
(
	@PMID int,
	@dt datetime
)
/*
Detail linked from paid amount in website financial-services/rebate_report.php
Column aliases based on feedback WB,BE
Starts with 8/14 rebate paid in 9/2014 payment file made 10/2014
sum of 'isvalid=Y' entries matches payment amount for "8/14"
note that the [date] column is a varchar and must match exactly, "09/01/2014" not 9/1/14
*/
as
begin
select date
--,v.pmid
,'$' + convert(varchar(50),round(priceprotectionduetodate,2,1),-1) as [Due To Date]
,CorpItemNumber as [Item#]
,Description
,NDC
--,ProtectedSelPrice as [Protected Price]
--,NewSellPrice as [New Price]
,'$' + convert(varchar(50),round(isnull(ProtectedSelPrice,0.0),2,1),-1)  as [Protected Price]
,'$' + convert(varchar(50),round(isnull(NewSellPrice,0.0),2,1),-1)  as [New Price]
,convert(varchar,ProtectionStartDate,101) as [Protection Start]
,convert(varchar,ProtectionEndDate,101) as [Protection End]
,AvgMonthlyUsage as [Protected Qty] --[Avg Usage]
,ActualUsageToDate as [Usage To Date]
--,convert(varchar,PerOfMax * 100) + '%' as [%Used] --[%ofMax]  --removed 11/10/14
from pharmacymaster..CA_PriceProtection p 
	--there are a few accounts like nnnnn-A and nnnnn-B, exclude:
	left join pharmacymaster..v_CHAccountPMID a on convert(int,a.CHAcct)  = p.customernumber and a.CHAcct not like '%-%'	
	--left join pharmacymaster..v_test v on v.PMID = a.PMID
	--where v.pmid = @PMID
	where a.pmid=@PMID
	and [date]=@dt
	--and isvalid='y'  --removed 11/10/14
end


GO
