USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_PreferredPartner]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spRebate_PreferredPartner]
(
-- limited to 6 mos 12/11/14 bg
	@PMID int
)
as
--declare @startperiod varchar(8)
--set @startperiod = '2014Q1'
select
top 2 --limits to 6 mos for quarterly
Period as [Rebate For]
,'$ ' + convert(varchar(50),round((isnull([Paid To Store],0.0)+isnull([Paid To Affiliate],0.0)),2,1),-1) as [Rebate Amount]
--,[Paid To Store]+[Paid To Affiliate] as [Rebate Amount]
from pharmacymaster..pm_rebates_ppartner
--from pharmacymaster..v_VendorVolumeSales --todo: this is 2014Q3 only
where pmid=@PMID
--and period >= @startperiod
order by period desc
GO
