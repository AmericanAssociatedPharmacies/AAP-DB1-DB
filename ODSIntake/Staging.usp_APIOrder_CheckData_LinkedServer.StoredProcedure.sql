USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Staging].[usp_APIOrder_CheckData_LinkedServer]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [Staging].[usp_APIOrder_CheckData_LinkedServer]

AS

SET NOCOUNT ON;

BEGIN

	DECLARE @RowCount INT

	--Get rowcount from [Staging].[APIOrder]
	SELECT @RowCount = COUNT(*)
	FROM [Staging].[APIOrder]
	
	IF @RowCount = 0
	BEGIN
		--Send email to advise files were not available for download
		EXEC msdb.dbo.sp_send_dbmail  
			@recipients = 'scott.edwards@rxaap.com; yodi.haile@rxaap.com; lovie.moultrie@rxaap.com'
			, @body = 'No APIOrder daily record exists from linked server.'
			, @subject = 'No API Order daily record exists' 		
			, @importance = 'High'

		--Stop SQL Job is no files were downloaded
		EXEC msdb.dbo.sp_stop_job
			@job_name = 'API Order Load ETL'

	END

	ELSE

		RETURN


END




GO
