USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_GenericIncentive]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spRebate_GenericIncentive]
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
,'$' + convert(varchar(50),round(cast([TotalGenerics] as money),2,1),-1) as [Total Generics]
,'$' + convert(varchar(50),round(cast([GenericIncentive] as money),2,1),-1) as [Rebate Amount]
--'$' + convert(varchar(50),round([API Generic Sales],2,1),-1) as [API Generic Sales],
from
PharmacyMaster..PM_AnnualRebates
where pmid=@PMID
order by [Year] desc

end
GO
