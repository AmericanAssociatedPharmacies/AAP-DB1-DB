USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadAPIMonthly_BrandCredits_SSIS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal   AAP Rebate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadAPIMonthly_BrandCredits_SSIS] 
	-- Add the parameters for the stored procedure here
		@date varchar(10) , @returncode int OUTPUT,@error varchar(8000) OUTPUT
AS
 

BEGIN
DECLARE @cmd VARCHAR(500);
DECLARE @PkgPath VARCHAR(200);
DECLARE @Val VARCHAR(10);
DECLARE @returnexec int;
DECLARE @ErrorMessage varchar(8000);

SET @ErrorMessage = '';
--Create temp table to hold result
CREATE TABLE #temp (SomeCol VARCHAR(500))
 
--SET @PkgPath = 'c:\Program Files\Microsoft SQL Server\90\DTS\Packages\SSIS_LoadAPIMonthlyBrandCredits\SSIS_LoadAPIMonthlyBrandCredits.dtsx';
--SET @Val = @date;
--
--SET @cmd = 'dtexec /F "' + @PkgPath + '"';
--SET @cmd = @cmd + ' /SET \Package.Variables[User::Date].Properties[Value];"' + @Val + '"';
--
--EXEC @returnexec =    xp_cmdshell @cmd;
--SET @returncode = @returnexec;
--
--BEGIN
--DECLARE @cmd VARCHAR(500);
--DECLARE @PkgPath VARCHAR(200);
--DECLARE @Val VARCHAR(10);
--DECLARE @returnexec int;
--DECLARE @ErrorMessage varchar(8000);
--
--SET @ErrorMessage = '';
----Create temp table to hold result
--CREATE TABLE #temp (SomeCol VARCHAR(500))


SET @PkgPath = 'c:\SSIS\SSIS_LoadAPIMonthlyBrandCredits\SSIS_LoadAPIMonthlyBrandCredits.dtsx';
SET @Val = @date;

SET @cmd = 'dtexec /F "' + @PkgPath + '"';
SET @cmd = @cmd + ' /SET \Package.Variables[User::Date].Properties[Value];"' + @Val + '"';

INSERT #temp
EXEC @returnexec =    xp_cmdshell @cmd;
SET @returncode = @returnexec;
BEGIN
    SELECT @ErrorMessage = @ErrorMessage + SomeCol   
    FROM #temp
    WHERE SomeCol IS NOT NULL
 
    --Display error message and return code
    --SELECT @ErrorMessage as ErrorMessage  ,@ReturnCode as ReturnCode
	SET @error = @ErrorMessage;
END
 


END

GO
