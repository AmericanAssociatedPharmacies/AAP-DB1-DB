USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_APIHV]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spRebate_APIHV]
(
	@PMID int
)
as
begin
	select top 6
	datename(month,[date]) + ' ' + convert(varchar(4),year([date])) as [Rebate Date],
	'$' + convert(varchar(50),round(isnull([high volume incentive],0.0),2,1),-1) as [High Volume Rebate]
	from
	pharmacymaster..pm_rebates_highvolume
	where pmid=@PMID
	order by [date] desc
end
GO
