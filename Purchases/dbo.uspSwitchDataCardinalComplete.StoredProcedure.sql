USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[uspSwitchDataCardinalComplete]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[uspSwitchDataCardinalComplete]

AS

SET NOCOUNT ON;

BEGIN

	DECLARE @p1 MONEY

	
	SELECT @p1 = dt.APIPrice
	FROM(SELECT ISNULL(SUM(CONVERT(MONEY,[API PRICE])),0.00) AS APIPrice
		FROM Staging.CardinalComplete
		) AS dt
	

	IF @p1 > 0.00
	BEGIN


		TRUNCATE TABLE [Archive].[CardinalComplete];

		ALTER TABLE [dbo].[CardinalComplete]
		SWITCH TO [Archive].[CardinalComplete];

		ALTER TABLE [Staging].[CardinalComplete]
		SWITCH TO [dbo].[CardinalComplete];

		UPDATE STATISTICS [dbo].[CardinalComplete];

	END

	ELSE IF @p1 = 0.00
	BEGIN

	--Stop SQL Job is no files were downloaded
		EXEC msdb.dbo.sp_stop_job
			@job_name = 'Cardinal Complete Db File Load'

	--Send email to advise files were not available for download
	EXEC msdb.dbo.sp_send_dbmail  
		@recipients = 'dataservices@rxaap.com;denise@apirx.com;dylan.smith@apirx.com'
		, @body = 'Cardinal Complete Load'
		, @subject = 'Current file is missing API data. Stopping the data load.' 		
		, @importance = 'High'

	END

END

GO
