USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_GenericIncentive_LoadSSIS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Load the API Generic Incentive table from Diana 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_GenericIncentive_LoadSSIS] 
(@year varchar(4), @returncode int OUTPUT,@error varchar(8000) OUTPUT)

AS


BEGIN

--BECAUSE This comes in 2 payments the second payment file will be indentical to the first excpet there
--will be a value in the second payment - so to avoid duplicates delete the year for the Generic Incentives
--before it's loaded
 

	DELETE from reports..import_RebateGenericIncentiveSum where year = @year;
	DELETE from reports..import_RebateGenericIncentive where year  = @year;

DECLARE @cmd VARCHAR(1500);
DECLARE @PkgPath VARCHAR(200);
DECLARE @Val VARCHAR(4);
DECLARE @returnexec int;
DECLARE @ErrorMessage varchar(8000);

SET @ErrorMessage = '';

 
--Create temp table to hold result
CREATE TABLE #temp (SomeCol VARCHAR(500))


 
SET @PkgPath = 'c:\SSIS\SSIS_LoadAnnualRebate_GenericIncentive\SSIS_LoadAnnualRebate_GenericIncentive.dtsx';
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
