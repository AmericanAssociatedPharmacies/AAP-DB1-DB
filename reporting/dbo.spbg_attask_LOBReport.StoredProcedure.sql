USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spbg_attask_LOBReport]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spbg_attask_LOBReport]
(
@mo int, @yr int
)
as
begin

select * from
(
select name,[type],LOB,sum(hours) as total_hrs from
(
--helpdesk--
select 
'Help Desk' as [type],
u.name,
hr.hours,
CONVERT(VARCHAR(8), attask.dbo.fnJavaTimestamp2SQLDatetime(hr.entrydate), 1) as entered,
isnull(prj.name,'NO_PROJECattask..t_NAME') as prjname,

isnull(tasks.name,isnull(op.name,'No taskname')) as taskname,


--helpdesk project LOB is IT, optask LOBs vary, task LOBs all null
--isnull(p2.textval,isnull(p1.textval,'NO LOB')) as LOB
case when p2.textval is null and p1.textval is null
	then 
	case when ht.name = 'Sick' or ht.name = 'Vacation Time' 
		then 'Sick/Vacation'
		else 'NO LOB ' + ht.name
	end
	else isnull(p2.textval,isnull(p1.textval,'NO LOB')) 
	end as LOB
from attask..t_hours hr 
left join attask..t_users u on hr.ownerguid=u.guid
left join attask..t_projects prj on hr.projectguid = prj.guid
left join attask..t_optasks op on hr.optaskguid=op.guid
left join attask..t_tasks tasks on hr.taskguid=tasks.guid
left join attask..t_hourtypes ht on hr.hourtypeguid=ht.guid
left join attask..t_parametervalues p1 on p1.objguid=prj.guid and p1.parametername='Line of Business'
left join attask..t_parametervalues p2 on p2.objguid=op.guid and p2.parametername='Line of Business'
--left join attask..t_parametervalues p3 on p3.objguid=tasks.guid and p3.parametername='Line of Business'
where year(dateadd(ss, hr.entrydate/1000, '19700101')) = @yr
and month(dateadd(ss, hr.entrydate/1000, '19700101')) = @mo
and isnull(prj.name,'NO_PROJECattask..attask..t_NAME') like '%Help Desk%'

union
--projects--
select 
'Project' as [type],
u.name,
hr.hours,
CONVERT(VARCHAR(8), attask.dbo.fnJavaTimestamp2SQLDatetime(hr.entrydate), 1) as entered,
isnull(prj.name,'NO_PROJECattask..t_NAME') as prjname,

isnull(tasks.name,isnull(op.name,'No taskname')) as taskname,


--helpdesk project LOB is IT, optask LOBs vary, task LOBs all null
--isnull(p2.textval,isnull(p1.textval,'NO LOB')) as LOB
case when p2.textval is null and p1.textval is null
	then 
	case when ht.name = 'Sick' or ht.name = 'Vacation Time' 
		then 'Sick/Vacation'
		else 'NO LOB ' + ht.name
	end
	else isnull(p2.textval,isnull(p1.textval,'NO LOB')) 
	end as LOB

from attask..t_hours hr 
left join attask..t_users u on hr.ownerguid=u.guid
left join attask..t_projects prj on hr.projectguid = prj.guid
left join attask..t_optasks op on hr.optaskguid=op.guid
left join attask..t_tasks tasks on hr.taskguid=tasks.guid
left join attask..t_hourtypes ht on hr.hourtypeguid=ht.guid
left join attask..t_parametervalues p1 on p1.objguid=prj.guid and p1.parametername='Line of Business'
left join attask..t_parametervalues p2 on p2.objguid=op.guid and p2.parametername='Line of Business'
--left join attask..t_parametervalues p3 on p3.objguid=tasks.guid and p3.parametername='Line of Business'
where year(dateadd(ss, hr.entrydate/1000, '19700101')) = @yr
and month(dateadd(ss, hr.entrydate/1000, '19700101')) = @mo
and isnull(prj.name,'NO_PROJECattask..attask..t_NAME') not like '%Help Desk%'
) dt
group by LOB,name,[type]
) dt2
--pivot (max(total_hrs) for LOB in ([AAP],[Accounting],[API],[Central Pay],[IT],[Legislative Affairs],[Managed Care],[Marketing],[PBM],[Preferred Partners],[Sales],[Shared Services],[NO LOB], [NO LOB Sick], [NO LOB Vacation])) p
--pivot (max(total_hrs) for LOB in ([AAP],[Accounting],[API],[Central Pay],[IT],[Legislative Affairs],[Managed Care],[Marketing],[PBM],[Preferred Partners],[Sales],[Shared Services], [Sick/Vacation],[NO LOB])) p
pivot (max(total_hrs) for LOB in ([AAP],[Accounting],[API],[Central Pay],[IT],[Managed Care],[Marketing],[PBM],[Preferred Partners],[Sales],[Shared Services], [Website], [Sick/Vacation],[NO LOB],[NO LOB Other])) p
order by name,type
end
GO
