USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_StartMedispanETL]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_StartMedispanETL]

AS

SET NOCOUNT ON;

BEGIN

		EXEC msdb.dbo.sp_start_job
			@job_name = 'Medispan ETL'


END
GO
