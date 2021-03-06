USE [intranet]
GO
/****** Object:  StoredProcedure [dbo].[spTimeDetailByProject]    Script Date: 12/22/2020 4:34:59 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spTimeDetailByProject]
(
@month int
,@year int --e.g. 2016
) as
select 
projectname,LOB, sum(total) as total_hours from 
(select
case when (projectname is null or projectname='') then (LOB + ' - ' + Resource) else projectname end as projectname
,LOB
,total from intranet..timesheet 
where month=@month and year=@year
) dt 
group by projectname,LOB
having sum(total) > 0.0
order by projectname
GO
