USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spMCenter_MCNPPBashasHQOnly]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc
[dbo].[spMCenter_MCNPPBashasHQOnly]
(
@PMID int
) 
as
/*
--MC + NPP - Bashas + Bashas HQ
*/
declare @buf int
select @buf=PMID
from pharmacymaster..v_pm_allwithaffiliates
 where 
 (
 chaincode is not null
 and mcquitdate is null
 and (aapquitdate is null or isNPP=-1) --include NPPs
 and isnull(aapparentno,0) <> 11377 --exclude Bashas
) or PMID=100364 --include Bashas HQ

select case when @buf is null then 0 else 1 end as result
GO
