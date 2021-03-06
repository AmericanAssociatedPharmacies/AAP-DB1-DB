USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_CheckFileExist]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_CheckFileExist]

	@FilePath VARCHAR(500)
	, @FileName VARCHAR(250)

AS

SET NOCOUNT ON;

BEGIN

DECLARE @Exists INT
	, @FullFilePath VARCHAR(1000)

	SET @FullFilePath = @FilePath + '\' + @FileName
 
	EXEC master.dbo.xp_fileexist @FullFilePath, @Exists OUT;

	INSERT INTO [dbo].[FileCheck](FilePath, [FileName], DoesFileExist, VerifiedDate)
	VALUES(@FilePath, @FileName, CONVERT(BIT, @Exists), GETDATE())
 
	SELECT [Exists] = @Exists;

END
GO
