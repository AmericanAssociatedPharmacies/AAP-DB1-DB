USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_APIHVTotal]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRebate_APIHVTotal]
(
	@PMID int
)
as
begin
declare @hv float
select @hv = sum(isnull([high volume incentive],0.0)) 
from 
pharmacymaster..pm_rebates_highvolume
where pmid= @PMID
and [date] in (select distinct top 4 [date] from pharmacymaster..pm_rebates_highvolume order by [date] desc)
select isnull(@hv,0.0) as hvtotal 
end
GO
