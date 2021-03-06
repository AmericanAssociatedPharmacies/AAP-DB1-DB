USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadAPIPayTerms_SSIS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load API Pay terms for SLX load
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadAPIPayTerms_SSIS] 
	-- Add the parameters for the stored procedure here
	  @returncode int OUTPUT
AS
 

BEGIN
DECLARE @cmd VARCHAR(500);
DECLARE @PkgPath VARCHAR(200);
DECLARE @returnexec int;

 
SET @PkgPath = 'c:\Program Files\Microsoft SQL Server\90\DTS\Packages\SSIS_LoadAPIPayTermsSLX\SSIS_LoadAPIPayTermsSLX.dtsx';

SET @cmd = 'dtexec /F "' + @PkgPath + '"';

EXEC @returnexec =    xp_cmdshell @cmd;
SET @returncode = @returnexec;


END

GO
