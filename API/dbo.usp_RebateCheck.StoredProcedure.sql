USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_RebateCheck]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_RebateCheck]


AS


SET NOCOUNT ON;
SET ANSI_WARNINGS OFF;

BEGIN

	TRUNCATE TABLE dbo.RebateCheck

	INSERT INTO dbo.RebateCheck(InvDate, Rebate)
	SELECT InvDate
	, SUM(ISNULL(Rebate, 0.00)) AS Rebate
	FROM [dbo].[APISalesDetail]
	WHERE InvDate >= DATEADD(yy, DATEDIFF(yy, 0, GETDATE()), 0)
	AND Type = 'Generic'
	GROUP BY InvDate

	UPDATE x
	SET IsZero = IIF(Rebate = 0.00, 1, 0)
	FROM dbo.RebateCheck AS x

	IF EXISTS(SELECT 1
				FROM dbo.RebateCheck
				WHERE Rebate = 0.00
				)

	BEGIN

		--Send email to advise files were not available for download
		EXEC msdb.dbo.sp_send_dbmail  
			@recipients = 'dave.bohler@rxaap.com; scott.edwards@rxaap.com; yodi.haile@rxaap.com'
			, @body = 'Please query the dbo.RebateCheck table in API on DB1 to see which dates did not load any rebate data.'
			, @subject = 'No rebate amounts for generics' 		
			, @importance = 'High'


	END


END
GO
