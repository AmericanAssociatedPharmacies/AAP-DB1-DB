USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[spreport_QPSCompliance]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spreport_QPSCompliance]
as
-- run sp_Globalreport first for the period  you want here, for example sp_Globalreport '6/10' '6/1/2010','6/1/2010'
select 
p.PMID,
p.AAPAccountno as AAPID,
p.AAPParentno as ParentID,
p.NCPDP,
p.Accountname,
p.City,
p.State,
r.[CH Total],
r.[API Total]

from v_PM_AllWithAffiliates_Filtered p
left join tmp_GlobalReport r on p.pmid=r.pmid
where p.QPS='QPS'
order by pmid

GO
