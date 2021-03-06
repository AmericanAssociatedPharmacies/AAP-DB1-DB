USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_MCenter_report1]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_MCenter_report1]
as
select
m.id,m.date_posted,m.title,
count(distinct l.PMID) as Pharmacies,
count(l.id) as Clicks
from MessageCenter_Messages m
left join (select * from MessageCenter_Log where userrole is null) l on l.messageid=m.id
where (m.date_expires is null or m.date_expires > getdate())
--and userrole is null
group by 
m.id,m.date_posted,m.title
order by m.id
GO
