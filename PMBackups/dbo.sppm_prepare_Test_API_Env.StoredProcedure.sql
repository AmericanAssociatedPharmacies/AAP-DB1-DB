USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_Test_API_Env]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/22/2010>
-- Description:	Prepare and Environment to  test new API code
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_Test_API_Env]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table

--Prepare the API table UNCOMMENT BEFORE RUN AGAIN !!!!!
--   IF EXISTS(SELECT name FROM sys.tables
--        WHERE name = 'tmp_APIAccountMaster_Orig')
--          DROP TABLE tmp_APIAccountMaster_Orig
--  
--   SELECT * into  tmp_APIAccountMaster_Orig from api..apiaccountmaster_orig 

--Pharmacy Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_Pharmacy_bkp_ForAPITest')
          DROP TABLE PM_Pharmacy_bkp_ForAPITest
  
   SELECT * into  PM_Pharmacy_bkp_ForAPITest from PharmacyMaster..PM_Pharmacy

 IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_Pharmacy_test')
          DROP TABLE tmp_PM_Pharmacy_test
  
   SELECT * into  tmp_PM_Pharmacy_test from PM_Pharmacy_bkp_ForAPITest

--Address Master Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_AddressMaster_bkp')
          DROP TABLE PM_AddressMaster_bkp
  
   SELECT * into  PM_AddressMaster_bkp from PharmacyMaster..PM_AddressMaster

 IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_AddressMaster_test')
          DROP TABLE tmp_PM_AddressMaster_test
  
   SELECT * into  tmp_PM_AddressMaster_test from PM_AddressMaster_bkp


--Cred Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_Cred_bkp')
          DROP TABLE PM_Cred_bkp
  
   SELECT * into  PM_Cred_bkp from PharmacyMaster..PM_Cred

 IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_Cred_test')
          DROP TABLE tmp_PM_Cred_test
  
   SELECT * into  tmp_PM_Cred_test from PM_Cred_bkp


--VendorAcct Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_VendorAccts_bkp')
          DROP TABLE PM_VendorAccts_bkp
  
   SELECT * into  PM_VendorAccts_bkp from PharmacyMaster..PM_VendorAccts

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_VendorAcct_test')
          DROP TABLE tmp_PM_VendorAcct_test
  
   SELECT * into  tmp_PM_VendorAcct_test from PM_VendorAccts_bkp

--VendorDC Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_VendorDC_bkp')
          DROP TABLE PM_VendorDC_bkp
  
   SELECT * into  PM_VendorDC_bkp from PharmacyMaster..PM_VendorDC

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_VendorDC_test')
          DROP TABLE tmp_PM_VendorDC_test
  
   SELECT * into  tmp_PM_VendorDC_test from PM_VendorDC_bkp

-- Groups Xref Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_Groups_Xref_bkp')
          DROP TABLE PM_Groups_Xref_bkp
  
   SELECT * into  PM_Groups_Xref_bkp from PharmacyMaster..pm_groups_xref

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_Groups_Xref_test')
          DROP TABLE tmp_PM_Groups_Xref_test
  
   SELECT * into  tmp_PM_Groups_Xref_test from PM_Groups_Xref_bkp
 

END


--drop table tmp_PM_Pharmacy_test
--select * into tmp_PM_Pharmacy_test from PM_Pharmacy_bkp_ForAPITest
--drop table  tmp_PM_AddressMaster_test
--select * into tmp_PM_AddressMaster_test from PM_Addressmaster_bkp
--drop table tmp_PM_Cred_test
--select * into tmp_PM_Cred_test from PM_Cred_bkp
--drop table tmp_PM_VendorAcct_test
--select * into tmp_PM_VendorAcct_test from PM_VendorAccts_bkp
--
--drop table tmp_PM_Groups_Xref_test
--select * into tmp_PM_Groups_Xref_test from PM_Groups_Xref_bkp







GO
