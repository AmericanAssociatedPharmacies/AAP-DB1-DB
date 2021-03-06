USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sprep_QPSAudit]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sprep_QPSAudit]
as
select v.pmid,v.aapaccountno as AAPid,v.accountname as name,
v.city,v.state,v.computersoftware as system_PMaster,s.RXCOMPUTER as system_Saleslogix
from  v_PM_AllWithAffiliates_Filtered v
left join reporting..v_slxaccount s on v.ncpdp=s.ncpdp
where v.qps='qps'
and aapaccountno is not null and aapquitdate is null
order by pmid
GO
