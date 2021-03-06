USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_APITrue10Total]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spRebate_APITrue10Total]
(
	@PMID int
)
as
begin
declare @rtotal float
select @rtotal = sum(isnull([True10Rebate],0.0)) 
from 
pharmacymaster..[v_web_PM_Rebates_APIMonthly]
where pmid= @PMID
and [date] in (select distinct top 4 [date] from pharmacymaster..[v_web_PM_Rebates_APIMonthly] where [date] > '1/1/2016' order by [date] desc)
select isnull(@rtotal,0.0) as true10total 
end
GO
