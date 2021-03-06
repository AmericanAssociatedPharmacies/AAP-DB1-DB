USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_SLXAccount_PMID]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_SLXAccount_PMID]
as
select p.pmid,s.*
from
reporting..v_SLXAccount s
left join pharmacymaster..pm_pharmacy p
	on (s.udacctno is not null and s.udacctno=p.udaccountno)
	or (s.aapid is not null and s.aapid=p.aapaccountno)
	or (s.WHACCOUNTID is not null and s.WHACCOUNTID = p.apiaccountno)
	or (s.dea is not null and s.dea=p.dea)
	or (s.ncpdp is not null and s.ncpdp=p.ncpdp)
where type<>'Prospect'

GO
