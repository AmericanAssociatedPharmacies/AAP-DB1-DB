USE [PharmacyMaster]
GO
/****** Object:  View [dbo].[v_MLAdminVolume2010]    Script Date: 12/22/2020 9:24:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[v_MLAdminVolume2010]
as
--select  
--p.pmid, v.dt as [date], v.volume
--from reporting..volumenorm v left join pharmacymaster..pm_pharmacy p
--	on (v.acct_no = p.udaccountno or v.acct_no=p.aapaccountno)
--
--where dt >= '1/1/2010' and v.vendor_id=79 and v.volume<>0

select  
p.pmid, v.date as [date], v.Totalsales as Volume
from pharmacymaster..miamiluken v left join pharmacymaster..pm_pharmacy p
	on (v.pmid = p.pmid)

where date >= '1/1/2010' and v.Totalsales<>0
GO
