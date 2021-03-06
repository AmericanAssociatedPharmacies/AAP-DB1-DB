USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spRLGL_report_test2]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spRLGL_report_test2]
as
select dt.*,p.accountname,p.city,p.state,p.AAPstatus
from
(
select convert(varchar(8),convert(datetime,left(rundate,len(rundate)-9)),1) as rundate
,login,ncpdp,rxnum,rxdate,RLGL
from tmp_rlgl_071114
where demo is null

and RLGL not like '%error%'
) dt
left join pharmacymaster..v_test p on dt.ncpdp=p.ncpdp
where aapstatus='ACTIVE'
order by rundate,ncpdp,rxnum
GO
