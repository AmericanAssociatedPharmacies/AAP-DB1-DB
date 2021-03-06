USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_MCenter_report_daily]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_MCenter_report_daily]
( @messageid int)
as
begin
declare @start datetime
set @start = (select min(date_read) from messagecenter_log)
select [day], count([day]) as PerDay
from
(
select 
date_read, datediff(day, @start, date_read) as dayElapsed,
left(CONVERT(varchar,date_read,100),11) as [day]
from webdev..messagecenter_log
where messageid=@messageid
) dt
group by dayElapsed,[day]
order by dayElapsed --desc
end
GO
