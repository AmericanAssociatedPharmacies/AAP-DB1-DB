USE [HSMonitor]
GO
/****** Object:  StoredProcedure [dbo].[FetchWebdocsCustomizationQueue]    Script Date: 12/22/2020 4:30:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[FetchWebdocsCustomizationQueue]
	@nextAttemptDelayInMinutes int = 0
AS
BEGIN
	BEGIN TRAN

	UPDATE WebdocsCustomizationQueue
	SET NumberOfAttempts = NumberOfAttempts + 1
	WHERE HasExecuted = 0 AND NextExecutionAttempt <= GETDATE();

	SELECT * FROM WebdocsCustomizationQueue
	WHERE HasExecuted = 0 AND NextExecutionAttempt <= GETDATE();

	UPDATE WebdocsCustomizationQueue
	SET	NextExecutionAttempt = DATEADD(minute, @nextAttemptDelayInMinutes, GETDATE())
	WHERE HasExecuted = 0 AND NextExecutionAttempt <= GETDATE();

	COMMIT TRAN
END
GO
