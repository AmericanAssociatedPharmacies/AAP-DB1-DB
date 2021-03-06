USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_execProfitMinderCHPH_SSIS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal   AAP Rebate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_execProfitMinderCHPH_SSIS] 
	-- Add the parameters for the stored procedure here
	@in_month varchar(02) , @in_year varchar(04), @returncode int OUTPUT
AS
 

BEGIN
DECLARE @cmd VARCHAR(500);
DECLARE @PkgPath VARCHAR(200);
DECLARE @month VARCHAR(02);
DECLARE @year VARCHAR(04);
DECLARE @returnexec int;


SET @PkgPath = 'c:\Program Files\Microsoft SQL Server\90\DTS\Packages\SSIS_ProfitMinderCHPH\SSIS_ProfitMinderCHPH.dtsx ';
SET @month = @in_month;
SET @year = @in_year;

SET @cmd = 'dtexec /F "' + @PkgPath + '"';
SET @cmd = @cmd + ' /SET \Package.Variables[User::InMonth].Properties[Value];"' + @month + '"';
SET @cmd = @cmd + ' /SET \Package.Variables[User::InYear].Properties[Value];"' + @year + '"';

EXEC @returnexec =    xp_cmdshell @cmd;
SET @returncode = @returnexec;


END

GO
