USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_FileLog]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_FileLog]

	@FileName VARCHAR(1000)
	, @Process VARCHAR(250)
	, @FileDownloadDateTime DATETIME = NULL


AS

SET NOCOUNT ON;

BEGIN


	INSERT INTO dbo.FileLog(FileName, DownloadDateTime, Process)
	VALUES (@FileName, ISNULL(@FileDownloadDateTime, GETDATE()), @Process)



END
GO
