USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadPPRebatesQtr_SSIS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal   AAP Rebate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadPPRebatesQtr_SSIS] 
	-- Add the parameters for the stored procedure here
	  @in_period varchar(6), @returncode int OUTPUT
AS
 

BEGIN
DECLARE @cmd VARCHAR(500);
DECLARE @PkgPath VARCHAR(200);
DECLARE @period VARCHAR(6);
DECLARE @returnexec int;


SET @PkgPath = 'c:\Program Files\Microsoft SQL Server\90\DTS\Packages\SSIS_LoadPPRebatesQtr\SSIS_LoadPPRebatesQtr.dtsx ';
SET @period = @in_period;

SET @cmd = 'dtexec /F "' + @PkgPath + '"';
SET @cmd = @cmd + ' /SET \Package.Variables[User::Period].Properties[Value];"' + @period + '"';

EXEC @returnexec =    xp_cmdshell @cmd;
SET @returncode = @returnexec;


END

GO
