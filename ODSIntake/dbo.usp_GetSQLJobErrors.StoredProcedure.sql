USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetSQLJobErrors]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_GetSQLJobErrors]

	@FinalDate VARCHAR(20) = NULL
	, @IsError INT = NULL

AS

SET NOCOUNT ON;

BEGIN

	SET @FinalDate = ISNULL(@FinalDate, '19000101')

	SELECT CONVERT(VARCHAR(255), j.[name]) AS JobName
	, CONVERT(VARCHAR(255), s.step_name) AS JobStepName
	, h.step_id AS StepID
	, msdb.dbo.agent_datetime(run_date, run_time) AS 'RunDateTime'
	, h.sql_severity
	, CONVERT(VARCHAR(8000), h.message) AS ErrorMessage
	, CONVERT(VARCHAR(255), h.server) AS ServerName
	, CONVERT(BIT, CASE
					WHEN h.message LIKE '%failed%' THEN 1
					ELSE 0
					END
			  ) AS IsError
	FROM msdb.dbo.sysjobhistory h  
	INNER JOIN msdb.dbo.sysjobs AS j  ON h.job_id = j.job_id  
	INNER JOIN msdb.dbo.sysjobsteps s ON j.job_id = s.job_id 
									AND h.step_id = s.step_id  
	WHERE h.run_status = ISNULL(@IsError, h.run_status) -- Failure = 0 
	AND h.run_date > @FinalDate  
	ORDER BY h.job_id ASC, h.instance_id ASC, h.step_id ASC, run_date ASC, run_time ASC


END

GO
