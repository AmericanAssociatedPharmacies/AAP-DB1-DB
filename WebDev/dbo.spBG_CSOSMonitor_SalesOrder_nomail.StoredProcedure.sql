USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spBG_CSOSMonitor_SalesOrder_nomail]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spBG_CSOSMonitor_SalesOrder_nomail]
as
--API.dbo.spBG_CSOSMonitor_SalesOrder monitors job CsosLegisymIntegration_SalesOrder for hung condition
--schedule: Occurs every day every 5 minute(s) between 6:00:00 AM and 9:30:00 PM. Schedule will be used starting on 7/28/2014.
--tests for schedule which isn't strictly necessary if also run as sql agent job
declare @jobid varchar(255)
declare @dtlast datetime
declare @minutesago int, @threshold int

set @jobid = '7964C550-872D-44A5-B7FD-DC739688460D'



	select top 1
	@dtlast = 
	msdb.dbo.agent_datetime(run_date, run_time)
	,@minutesago = datediff(n,@dtlast,getdate()) 
	from
	MSDB.dbo.sysjobhistory
	where job_id = @jobid
	order by run_date desc, run_time desc

select @dtlast as LastRun, @minutesago as MinutesAgo






GO
