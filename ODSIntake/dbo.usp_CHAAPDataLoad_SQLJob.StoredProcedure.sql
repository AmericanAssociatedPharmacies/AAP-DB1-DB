USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_CHAAPDataLoad_SQLJob]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CHAAPDataLoad_SQLJob]

AS

SET NOCOUNT ON;

BEGIN

		EXEC msdb.dbo.sp_start_job
			@job_name = 'CHAAP Data Load'


END
GO
