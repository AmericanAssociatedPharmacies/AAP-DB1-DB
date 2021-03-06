USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_CHPriceProtDetail]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE proc [dbo].[spRebate_CHPriceProtDetail]
(
	@PMID int,
	@dt datetime
)
/*
BG 10/2014
Detail linked from paid amount in website financial-services/rebate_report.php
Note that the file date in pharmacymaster..PM_Rebates_CHAAP is ONE MONTH GREATER than the detail file date
in  pharmacymaster..CA_PriceProtection
Starts with 8/14 rebate paid in 9/2014 payment file made 10/2014

sum of 'isvalid=Y' entries should match payment amount
note that the [date] column is a varchar and must match exactly, "09/01/2014" not 9/1/14

Column aliases based on feedback WB,BE
*/
as
begin
select date
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
where customernumber in 
	(select right('000000'+CHAcct,6) as customernumber from pharmacymaster..v_CHAccountPMID --added padding 2/25/15 bg
	where pmid=@PMID and CHAcct not like '%-%') 	--there are a few accounts like nnnnn-A and nnnnn-B, exclude:
and [date]=@dt
--and isvalid='y' --column removed 11/14

end


GO
