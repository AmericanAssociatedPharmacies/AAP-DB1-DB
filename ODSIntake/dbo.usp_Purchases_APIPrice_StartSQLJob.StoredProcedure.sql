USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_Purchases_APIPrice_StartSQLJob]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Purchases_APIPrice_StartSQLJob]


AS

SET NOCOUNT ON;


BEGIN

	EXEC msdb.dbo.sp_start_job
		@job_name = 'Purchases APIPrice ETL'

END


GO
