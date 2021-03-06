USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spQC_SCANActivityReport]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spQC_SCANActivityReport]
as

select dt2.*,p.ncpdp,p.accountname,p.city,p.state
from
(
select pmid
,year,month
,count(pmid) as [views]
from
(
select pmid,year(date_accessed) as [year],month(date_accessed) as [month] 
from Log_QC
 where tabname like 'SCAN_data'
 and userrole is null
) dt
group by  pmid
,year,month
) dt2
left join pharmacymaster..v_test p on p.pmid=dt2.pmid
  order by accountname,month desc,year desc
GO
