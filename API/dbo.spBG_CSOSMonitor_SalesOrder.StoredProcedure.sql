USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spBG_CSOSMonitor_SalesOrder]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE proc [dbo].[spBG_CSOSMonitor_SalesOrder]
as
--API.dbo.spBG_CSOSMonitor_SalesOrder monitors job CsosLegisymIntegration_SalesOrder for hung condition
--schedule: Occurs every day every 5 minute(s) between 6:00:00 AM and 9:30:00 PM. Schedule will be used starting on 7/28/2014.
--tests for schedule which isn't strictly necessary if also run as sql agent job
declare @jobid varchar(255),@recipientlist varchar(255), @diagnosticlist varchar(255)
declare @dtlast datetime
declare @minutesago int, @threshold int
declare @start_hr int, @start_min int, @end_hr int, @end_min int
declare @mailsent char(1), @useSQLAgentSchedule char(1)
declare @sbuf varchar(255)

set @jobid = '7964C550-872D-44A5-B7FD-DC739688460D'
set @recipientlist = 'itoperations@uniteddrugs.com;kevin.haney@apirx.com;6026251148@vtext.com' --delimited by ;
set @diagnosticlist = 'bruce.grant@uniteddrugs.com;brucegrant@gmail.com'
set @start_hr = 6
set @start_min = 00
set @end_hr = 21
set @end_min = 30
set @threshold = 15
set @mailsent = 'N'
set @useSQLAgentSchedule = 'Y'  --Y:relies on SQL Agent schedule to not run this monitor before or after the job's schedule
								--N:use the schedule above

if (@useSQLAgentSchedule = 'N' and ((datepart(hh,getdate()) < @start_hr and datepart(n,getdate()) < @start_min) 
	or (datepart(hh,getdate())>@end_hr and datepart(n,getdate()) > @end_min)))
	select @minutesago = -1
else
	begin
	select top 1
	@dtlast = 
	msdb.dbo.agent_datetime(run_date, run_time)
	,@minutesago = datediff(n,@dtlast,getdate()) 
	from
	MSDB.dbo.sysjobhistory
	where job_id = @jobid
	order by run_date desc, run_time desc
	end

if (@minutesago > @threshold) 
	begin
	set @sbuf = 'CSOS Sales Order job: Last run: ' + convert(varchar,@dtlast) 
			+ ' was ' + convert(varchar,@minutesago) + ' minutes ago, exceeds threshold of ' + convert(varchar,@threshold) + ' minutes. '
			+ ' Check sql agent job CsosLegisymIntegration_SalesOrder; alert sent from job CSOS_Monitor_SalesOrder'
	exec msdb..sp_send_dbmail @profile_name='uddw1',
		@recipients=@recipientlist,
    @subject = 'CSOS Sales Order Monitor alert!',
    @body = @sbuf,
    @body_format = 'HTML' 
    set @mailsent = 'Y'
	end
/*	
else
	begin

	declare @subj varchar(255)
	set @subj = 'CSOS SOM last='+ convert(varchar,@dtlast)+ ' ago=' + convert(varchar,@minutesago)
	set @sbuf = 'Diagnostic not over threshold: CSOS Sales Order job: Last run: ' + convert(varchar,@dtlast) 
			+ ' was ' + convert(varchar,@minutesago) + ' minutes ago, vs threshold of ' + convert(varchar,@threshold) + ' minutes. '
			+ ' Check sql agent job CsosLegisymIntegration_SalesOrder; alert sent from job CSOS_Monitor_SalesOrder'
	exec msdb..sp_send_dbmail @profile_name='uddw1',
		@recipients=@diagnosticlist,
    @subject = @subj,
    @body = @sbuf,
    @body_format = 'HTML' 
    set @mailsent = 'D'
	end
*/

	
select @dtlast as LastRun, @minutesago as MinutesAgo, @threshold as Threshold,@mailsent as MailSent


GO
