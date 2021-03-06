USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spbg_attask_LOBRaw]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spbg_attask_LOBRaw]
(
@mo int, @yr int
)
as
select 
username,
CONVERT(VARCHAR(8), attask.dbo.fnJavaTimestamp2SQLDatetime(hr.entrydate), 1) as entered,
prj.name,op.name,tasks.name,hours,p1.textval,p2.textval
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
GO
