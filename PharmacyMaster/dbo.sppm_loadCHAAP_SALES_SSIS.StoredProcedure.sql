USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadCHAAP_SALES_SSIS]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal CHPH file for AAP
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadCHAAP_SALES_SSIS] 
	-- Add the parameters for the stored procedure here
	@date varchar(10) , @returncode int OUTPUT
AS
 

BEGIN
DECLARE @cmd VARCHAR(500);
DECLARE @PkgPath VARCHAR(200);
DECLARE @Val VARCHAR(10);
DECLARE @returnexec int;


SET @PkgPath = 'c:\Program Files\Microsoft SQL Server\90\DTS\Packages\SSIS_CHLoadSales\SSIS_CHLoadSales.dtsx';
SET @Val = @date;

SET @cmd = 'dtexec /F "' + @PkgPath + '"';
SET @cmd = @cmd + ' /SET \Package.Variables[User::Date].Properties[Value];"' + @Val + '"';

EXEC @returnexec =   xp_cmdshell @cmd;
SET @returncode = @returnexec;


END

GO
