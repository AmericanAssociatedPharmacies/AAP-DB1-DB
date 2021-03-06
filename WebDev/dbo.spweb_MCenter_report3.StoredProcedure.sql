USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_MCenter_report3]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_MCenter_report3]
( @messageid int)
as
begin
declare @start datetime
set @start = (select min(date_read) from messagecenter_log)
select hr, count(hr) as perhour
from
(
select 
date_read, datediff(hour, @start, date_read) as hrElapsed,
--datepart(hh,date_read) as hr
--RIGHT('0'+LTRIM(RIGHT(CONVERT(varchar,date_read,100),8)),7) as hr
left(CONVERT(varchar,date_read,100),15)+'00 ' 
+  right(CONVERT(varchar,date_read,100),2)as hr
from webdev..messagecenter_log
where messageid=@messageid
) dt
group by hrElapsed,hr
order by hrElapsed --desc
end
GO
