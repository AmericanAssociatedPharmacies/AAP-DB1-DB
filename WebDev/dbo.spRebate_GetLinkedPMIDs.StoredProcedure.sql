USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRebate_GetLinkedPMIDs]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spRebate_GetLinkedPMIDs]

	@PMID int

as

SET NOCOUNT ON;

begin

declare @list varchar(50)

select @list=LinkedPMIDs 
from RebateLinkedPMIDs where PMID=@PMID


select case 
		when @list is null then cast(@PMID as varchar) 
		else cast(@PMID as varchar) + ',' + @list 
		end as PMIDList
end


GO
