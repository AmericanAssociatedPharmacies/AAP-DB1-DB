USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadFinAddrList_SSIS]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/22/2010
-- Description:	load Financial Address from API Operator  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadFinAddrList_SSIS] 
     @returncode int OUTPUT
	-- Add the parameters for the stored procedure here
 
AS
 

BEGIN
DECLARE @cmd VARCHAR(500);
DECLARE @PkgPath VARCHAR(200);
DECLARE @Val VARCHAR(10);
DECLARE @returnexec int;
 



SET @PkgPath = 'c:\SSIS\SSIS_UpdatePM_FinAddr\SSIS_UpdatePM_FinAddr.dtsx ';

SET @cmd = 'dtexec /F "' + @PkgPath + '"';
EXEC @returnexec =  xp_cmdshell @cmd;

SET @returncode = @returnexec;



END

GO
