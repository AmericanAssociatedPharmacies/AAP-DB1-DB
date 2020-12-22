USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadAPIMonthly_Rebate_SSIS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal   AAP Rebate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadAPIMonthly_Rebate_SSIS] 
	-- Add the parameters for the stored procedure here
	@date varchar(10) , @returncode int OUTPUT
AS
 

BEGIN
DECLARE @cmd VARCHAR(500);
DECLARE @PkgPath VARCHAR(200);
DECLARE @Val VARCHAR(10);
DECLARE @returnexec int;

 
SET @PkgPath = 'c:\SSIS\SSIS_LoadAPIMonthlyRebates\SSIS_LoadAPIMonthlyRebates.dtsx';
SET @Val = @date;

SET @cmd = 'dtexec /F "' + @PkgPath + '"';
SET @cmd = @cmd + ' /SET \Package.Variables[User::Date].Properties[Value];"' + @Val + '"';

EXEC @returnexec =    xp_cmdshell @cmd;
SET @returncode = @returnexec;


END

GO
