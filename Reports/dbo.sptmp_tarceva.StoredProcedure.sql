USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sptmp_tarceva]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[sptmp_tarceva]
as
select distinct dt.pmid,dt.ncpdp,
accountname,city,state,zip,aapaccountno,aapquitdate,[status],apiaccountno,apistatus,affiliate,
phone,fax,email
from
(
select [pharm id] as ncpdp,pmid
from reports..tmp_tarceva1_pharmids_rx30 t1 
left join pharmacymaster..v_pm_allwithaffiliates t2
on t2.ncpdp=t1.[pharm id]
union
select ncpdp,t1.pmid
from reports..tmp_tarceva1_pharmids_chph t1
left join pharmacymaster..v_pm_allwithaffiliates t2
on t2.pmid=t1.pmid
) dt
left join pharmacymaster..v_pm_allwithaffiliates p on p.pmid=dt.pmid
where aapaccountno is not null and aapquitdate is null
order by accountname
GO
