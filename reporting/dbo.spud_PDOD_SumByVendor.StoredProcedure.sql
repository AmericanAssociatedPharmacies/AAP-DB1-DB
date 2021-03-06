USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_PDOD_SumByVendor]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spud_PDOD_SumByVendor]
as
set nocount on
begin
select vendor_id,vendorpair,vendor,sum(volume) as volume,
sum(rebate) as rebate,sum(wsvolume) as wsvolume,
sum(Wsadminfees) as adminfees, sum(genrebate) as GenRebate,
sum(CRFactor) as CRFactor, sum(CR90) as CR90
from dbo.PDOD_Detail
group by vendor_id,vendorpair,vendor
order by vendor
end
set nocount off

GO
