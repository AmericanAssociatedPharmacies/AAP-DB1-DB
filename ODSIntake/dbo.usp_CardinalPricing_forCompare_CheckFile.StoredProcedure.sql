USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_CardinalPricing_forCompare_CheckFile]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CardinalPricing_forCompare_CheckFile]

AS

SET NOCOUNT ON;

BEGIN

	DECLARE @FileDir VARCHAR(1000)
	, @RowCount INT

	SET @FileDir = '\\db1\c$\data\ScanToss\DataToLoad'


	SELECT @RowCount = COUNT(*)
	FROM ODSIntake.dbo.mtvf_GetFileInfo(@FileDir)


	IF @RowCount = 0
	BEGIN

		EXEC msdb.dbo.sp_stop_job N'Load CardinalPricing_forCompare (standefer catalog)';  

		EXEC msdb.dbo.sp_send_dbmail  
		@recipients = 'scott.edwards@rxaap.com;dave.bohler@rxaap.com;mike.arndt@apirx.com;nova.sisk@rxaap.com'  
		, @subject = 'Standefer Catalog File does not exist'
		, @importance = 'High';

	END


	ELSE

		RETURN
 


END



GO
