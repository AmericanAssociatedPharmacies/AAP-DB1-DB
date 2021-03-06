USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadNCPDPProviderInformation]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Chris Stone
-- Create date: 12/30/2011
-- Description:	load NCPDP Provider Information File
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadNCPDPProviderInformation] 
     @returncode int OUTPUT
	-- Add the parameters for the stored procedure here
 
AS
 

BEGIN
DECLARE @cmd VARCHAR(500);
DECLARE @PkgPath VARCHAR(200);
DECLARE @Val VARCHAR(10);
DECLARE @returnexec int;

SET @PkgPath = 'C:\Program Files\Microsoft SQL Server\90\DTS\Packages\LoadNCPDP\NCPDPProviderInformationImport.dtsx ';

SET @cmd = 'dtexec /F "' + @PkgPath + '"';
EXEC @returnexec =     xp_cmdshell @cmd;
SET @returncode = @returnexec;


END

GO
