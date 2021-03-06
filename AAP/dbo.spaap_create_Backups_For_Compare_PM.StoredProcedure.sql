USE [AAP]
GO
/****** Object:  StoredProcedure [dbo].[spaap_create_Backups_For_Compare_PM]    Script Date: 12/22/2020 4:10:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <08/29/2008>
-- Description:	Remove duplicates from StoreMember for the AccountMaster table
-- =============================================
CREATE PROCEDURE [dbo].[spaap_create_Backups_For_Compare_PM]

AS
	BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
 
--   IF EXISTS(SELECT name FROM sys.tables
--        WHERE name = 'APIAccountMaster_Orig_bkp')
--          DROP TABLE APIAccountMaster_Orig_bkp
--
--	SELECT * into api..APIAccountMaster_Orig_bkp from api..APIAccountMaster_Orig

  exec api..spapi_create_Backups_For_Compare_PM
 
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'SSIS_PharmacyMasterUD_ALL_bkp')
          DROP TABLE SSIS_PharmacyMasterUD_ALL_bkp
   SELECT * into  SSIS_PharmacyMasterUD_ALL_bkp from  SSIS_PharmacyMasterUD_ALL


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PMUpdate_All_staging_bkp')
          DROP TABLE PMUpdate_All_staging_bkp
  
   SELECT * into  PMUpdate_All_staging_bkp from PMUpdate_All_staging

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PMUpdate_All_bkp')
          DROP TABLE PMUpdate_All_bkp
 
   SELECT * into   PMUpdate_All_bkp from  PMUpdate_All 

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'pharmacymaster_bkp')
          DROP TABLE pharmacymaster_bkp
 
   SELECT * into   pharmacymaster_bkp from  pharmacymaster


   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'aapaccount_bkp2')
          DROP TABLE aapaccount_bkp2
 
   SELECT * into  aapaccount_bkp2 from  aapaccount
END








GO
