USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_Planogram]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spRebate_Planogram]
(
	@PMID int
)
as
/*
4/2015 bg
*/
begin

select 
top 1
[Year]
,'$' + convert(varchar(50),round(cast([PlanOGramRebate] as money),2,1),-1) as [Rebate Amount]
--'$' + convert(varchar(50),round([API Generic Sales],2,1),-1) as [API Generic Sales],
from
PharmacyMaster..PM_AnnualRebates
where pmid=@PMID
order by [Year] desc

end
GO
