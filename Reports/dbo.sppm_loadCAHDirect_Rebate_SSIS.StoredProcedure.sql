USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_loadCAHDirect_Rebate_SSIS]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 4/26/2010
-- Description:	load Cardinal   AAP Rebate
-- =============================================
CREATE PROCEDURE [dbo].[sppm_loadCAHDirect_Rebate_SSIS] 
	-- Add the parameters for the stored procedure here
	@date varchar(10) , @returncode int OUTPUT
AS
 

BEGIN
DECLARE @cmd VARCHAR(500);
DECLARE @PkgPath VARCHAR(200);
DECLARE @Val VARCHAR(10);
DECLARE @returnexec int;

 
SET @PkgPath = 'c:\SSIS\SSIS_LoadCAHDirect_Rebates\SSIS_CAHPaysDirectly.dtsx';
SET @Val = @date;

SET @cmd = 'dtexec /F "' + @PkgPath + '"';
SET @cmd = @cmd + ' /SET \Package.Variables[User::Date].Properties[Value];"' + @Val + '"';

EXEC @returnexec =    xp_cmdshell @cmd;
SET @returncode = @returnexec;

UPDATE import_Rebates_CAHDirect set ContractPerformanceRebate = 0.00 where ContractPerformanceRebate is null;
UPDATE import_Rebates_CAHDirect set PriceProtectionRebate = 0.00 where PriceProtectionRebate is null;

UPDATE import_Rebates_CAHDirect set PriceProtectionAdj = 0.00 where PriceProtectionAdj is null;
UPDATE import_Rebates_CAHDirect set GenericRebateAdj = 0.00 where GenericRebateAdj is null;
UPDATE import_Rebates_CAHDirect set COGRebate = 0.00 where COGRebate is null;

-- EXEC dbo.sppm_populate_Purchases_CHRebates_DirectPay @date - changed to just execute the one stored proc.
-- The sppm_populate_Purchases_CHRebates stored proce joins the PM_Rebates_CHAAP and import_rebates_cahdirect so
-- no need to execute to different ones now.  Just have to make sure both are populated before this is executed.
EXEC dbo.sppm_populate_Purchases_CHRebates @date 

 
END

GO
