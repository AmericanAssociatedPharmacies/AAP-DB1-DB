USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Staging].[usp_APIInvoice_CheckData_LinkedServer]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Staging].[usp_APIInvoice_CheckData_LinkedServer]

AS

SET NOCOUNT ON;

BEGIN

	DECLARE @RowCount INT

	--Get rowcount from [Staging].[APIInvoiceImport]
	SELECT @RowCount = COUNT(*)
	FROM [Staging].[APIInvoiceImport]
	
	IF @RowCount = 0
	BEGIN
		--Send email to advise files were not available for download
		EXEC msdb.dbo.sp_send_dbmail  
			@recipients = 'dave.bohler@rxaap.com; scott.edwards@rxaap.com; yodi.haile@rxaap.com'
			, @body = 'No APIInvoice daily sales record exists from linked server.'
			, @subject = 'No APIInvoice daily sales record exists' 		
			, @importance = 'High'

		--Stop SQL Job is no files were downloaded
		EXEC msdb.dbo.sp_stop_job
			@job_name = 'APIInvoice Data Load'

		

	END

	ELSE

		RETURN


END



GO
