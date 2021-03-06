USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_MCenter_report2]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_MCenter_report2]
(@messageid int)
as
select L.*,p.accountname,p.city,p.state,p.aapstatus,p.apistatus,
case when p.ismanagedcare=0 then '' else 'ACTIVE' end as mcare
from
(select pmid,date_read  from MessageCenter_Log  where userrole is null and messageid=@messageid) L
left join pharmacymaster..v_pm_allwithaffiliates p on L.PMID=P.PMID 
order by 2
GO
