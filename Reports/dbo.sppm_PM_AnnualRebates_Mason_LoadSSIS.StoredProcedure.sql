USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_Mason_LoadSSIS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/08/2016>
-- Description:	 Load the Mason rebates
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_Mason_LoadSSIS] 
(@year varchar(4), @returncode int OUTPUT,@error varchar(8000) OUTPUT)

AS


BEGIN
 

DECLARE @cmd VARCHAR(Max);
DECLARE @PkgPath VARCHAR(Max);
DECLARE @Val VARCHAR(4);
DECLARE @returnexec int;
DECLARE @ErrorMessage varchar(8000);

SET @ErrorMessage = '';

 
--Create temp table to hold result
CREATE TABLE #temp (SomeCol VARCHAR(500))


 
SET @PkgPath = 'c:\Program Files\Microsoft SQL Server\90\DTS\Packages\SSIS_LoadAnnualRebate_Mason\SSIS_LoadAnnualRebate_MasonRebate.dtsx';
SET @Val = @year;

SET @cmd = 'dtexec /F "' + @PkgPath + '"';
SET @cmd = @cmd + ' /SET \Package.Variables[User::Year].Properties[Value];"' + @Val + '"';

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
