USE [PMBackups]
GO
/****** Object:  StoredProcedure [dbo].[sppm_prepare_Prod_API_Env]    Script Date: 12/22/2020 4:47:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/11/2010>
-- Description:	Prepare an Environment to run API Update in test before Prod
-- =============================================
CREATE PROCEDURE [dbo].[sppm_prepare_Prod_API_Env]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
  

--NOTE ********** This will replace code above once we cut over
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'APIAccountMaster_orig_bkp')
          DROP TABLE APIAccountMaster_orig_bkp
  
   SELECT * into  APIAccountMaster_orig_bkp from tmp_APIAccountMaster_Orig

--Need to set any DEA that are blank to null in PM_Pharmacy - this seems to mess it up

Update PharmacyMaster..PM_Pharmacy set DEA = null where DEA = '';

--Pharmacy Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_Pharmacy_bkp_BeforeAPIUpdate')
          DROP TABLE PM_Pharmacy_bkp_BeforeAPIUpdate
  
   SELECT * into  PM_Pharmacy_bkp_BeforeAPIUpdate from PharmacyMaster..PM_Pharmacy

-- IF EXISTS(SELECT name FROM sys.tables
--        WHERE name = 'tmp_PM_Pharmacy_test')
--          DROP TABLE tmp_PM_Pharmacy_test
  
 --  SELECT * into  tmp_PM_Pharmacy_test from PM_Pharmacy_bkp_BeforeAPIUpdate  - doing this later because of keys

--Address Master Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_AddressMaster_bkp_BeforeAPIUpdate')
          DROP TABLE PM_AddressMaster_bkp_BeforeAPIUpdate
  
   SELECT * into  PM_AddressMaster_bkp_BeforeAPIUpdate from PharmacyMaster..PM_AddressMaster

 IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_AddressMaster_test')
          DROP TABLE tmp_PM_AddressMaster_test

 IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_pm_addressMaster_FinTest')
          DROP TABLE tmp_pm_addressMaster_FinTest
  
   SELECT * into  tmp_PM_AddressMaster_test from PM_AddressMaster_bkp_BeforeAPIUpdate
   SELECT * into tmp_pm_addressMaster_FinTest from PM_AddressMaster_bkp_BeforeAPIUpdate

--Cred Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_Cred_bkp_BeforeAPIUpdate')
          DROP TABLE PM_Cred_bkp_BeforeAPIUpdate
  
   SELECT * into  PM_Cred_bkp_BeforeAPIUpdate from PharmacyMaster..PM_Cred

 IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_Cred_test')
          DROP TABLE tmp_PM_Cred_test
  
   SELECT * into  tmp_PM_Cred_test from PM_Cred_bkp_BeforeAPIUpdate


--APIAccounts Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_APIAccounts_bkp_BeforeAPIUpdate')
          DROP TABLE PM_APIAccounts_bkp_BeforeAPIUpdate
  
   SELECT * into  PM_APIAccounts_bkp_BeforeAPIUpdate from PharmacyMaster..PM_APIAccounts

 IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_APIAccounts_test')
          DROP TABLE tmp_PM_APIAccounts_test
  
   SELECT * into  tmp_PM_APIAccounts_test from PM_APIAccounts_bkp_BeforeAPIUpdate


--VendorAcct Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_VendorAccts_bkp_BeforeAPIUpdate')
          DROP TABLE PM_VendorAccts_bkp_BeforeAPIUpdate
  
   SELECT * into  PM_VendorAccts_bkp_BeforeAPIUpdate from PharmacyMaster..PM_VendorAccts

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_VendorAcct_test')
          DROP TABLE tmp_PM_VendorAcct_test
  
   SELECT * into  tmp_PM_VendorAcct_test from PM_VendorAccts_bkp_BeforeAPIUpdate

--VendorDC Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_VendorDC_bkp_BeforeAPIUpdate')
          DROP TABLE PM_VendorDC_bkp_BeforeAPIUpdate
  
   SELECT * into  PM_VendorDC_bkp_BeforeAPIUpdate from PharmacyMaster..PM_VendorDC

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_VendorDC_test')
          DROP TABLE tmp_PM_VendorDC_test
  
   SELECT * into  tmp_PM_VendorDC_test from PM_VendorDC_bkp_BeforeAPIUpdate

-- Groups Xref Test
   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'PM_Groups_Xref_bkp_BeforeAPIUpdate')
          DROP TABLE PM_Groups_Xref_bkp_BeforeAPIUpdate
  
   SELECT * into  PM_Groups_Xref_bkp_BeforeAPIUpdate from PharmacyMaster..pm_groups_xref

   IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_Groups_Xref_test')
          DROP TABLE tmp_PM_Groups_Xref_test
  
   SELECT * into  tmp_PM_Groups_Xref_test from PM_Groups_Xref_bkp_BeforeAPIUpdate


----- HERE we can recreate the tmp_PM_Pharmacy_test - have to di it after all other tables are dropped becuase of the keys
 IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_Pharmacy_test')
          DROP TABLE tmp_PM_Pharmacy_test
   SELECT * into  tmp_PM_Pharmacy_test from PM_Pharmacy_bkp_BeforeAPIUpdate


--- HERE WE CREATE THE KEys
 

-- Now Backup so we can use these to restore to tmp tables for more testing if necessary

	IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_Pharmacy_test_bkp')
          DROP TABLE tmp_PM_Pharmacy_test_bkp
 
	SELECT * into tmp_PM_Pharmacy_test_bkp from tmp_PM_Pharmacy_test
    ALTER TABLE tmp_PM_Pharmacy_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_Pharmacy_test_bkp DISABLE TRIGGER ALL

	IF EXISTS(SELECT name FROM sys.tables
        WHERE name = 'tmp_PM_AddressMaster_test_bkp')
          DROP TABLE tmp_PM_AddressMaster_test_bkp

	SELECT * into tmp_PM_AddressMaster_test_bkp from tmp_PM_AddressMaster_test 
    ALTER TABLE tmp_PM_AddressMaster_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_AddressMaster_test_bkp DISABLE TRIGGER ALL

	IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'tmp_PM_Cred_test_bkp')
      DROP TABLE tmp_PM_Cred_test_bkp

	SELECT * into tmp_PM_Cred_test_bkp from tmp_PM_Cred_test 
    ALTER TABLE tmp_PM_Cred_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_Cred_test_bkp DISABLE TRIGGER ALL

IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'tmp_PM_APIAccounts_test_bkp')
      DROP TABLE tmp_PM_APIAccounts_test_bkp

	SELECT * into tmp_PM_APIAccounts_test_bkp from tmp_PM_APIAccounts_test 
    ALTER TABLE tmp_PM_APIAccounts_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_APIAccounts_test_bkp DISABLE TRIGGER ALL


	IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'tmp_PM_VendorAcct_test_bkp')
      DROP TABLE tmp_PM_VendorAcct_test_bkp

	SELECT * into tmp_PM_VendorAcct_test_bkp from tmp_PM_VendorAcct_test

   
   	ALTER TABLE tmp_PM_VendorAcct_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_VendorAcct_test_bkp DISABLE TRIGGER ALL
    
	IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'tmp_PM_VendorDC_test_bkp')
      DROP TABLE tmp_PM_VendorDC_test_bkp
 
	SELECT * into tmp_PM_VendorDC_test_bkp from tmp_PM_VendorDC_test

   	ALTER TABLE tmp_PM_VendorDC_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_VendorDC_test_bkp DISABLE TRIGGER ALL

	IF EXISTS(SELECT name FROM sys.tables
    WHERE name = 'tmp_PM_Groups_Xref_test_bkp')
      DROP TABLE tmp_PM_Groups_Xref_test_bkp

	SELECT * into tmp_PM_Groups_Xref_test_bkp from tmp_PM_Groups_Xref_test  

	ALTER TABLE tmp_PM_Groups_Xref_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_Groups_Xref_test_bkp DISABLE TRIGGER ALL

	ALTER TABLE tmp_PM_Groups_Xref_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_Groups_Xref_test_bkp DISABLE TRIGGER ALL
   	ALTER TABLE tmp_PM_VendorDC_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_VendorDC_test_bkp DISABLE TRIGGER ALL
   	ALTER TABLE tmp_PM_VendorAcct_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_VendorAcct_test_bkp DISABLE TRIGGER ALL
    ALTER TABLE tmp_PM_APIAccounts_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_APIAccounts_test_bkp DISABLE TRIGGER ALL
    ALTER TABLE tmp_PM_Cred_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_Cred_test_bkp DISABLE TRIGGER ALL
    ALTER TABLE tmp_PM_Pharmacy_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_Pharmacy_test_bkp DISABLE TRIGGER ALL
    ALTER TABLE tmp_PM_AddressMaster_test DISABLE TRIGGER ALL
	ALTER TABLE tmp_PM_AddressMaster_test_bkp DISABLE TRIGGER ALL


	ALTER TABLE tmp_PM_Groups_Xref_test drop column created
	ALTER TABLE tmp_PM_Groups_Xref_test drop column modified 
	ALTER TABLE tmp_PM_Groups_Xref_test  drop column rowversion
 

	ALTER TABLE tmp_PM_Groups_Xref_test_bkp drop column created
	ALTER TABLE tmp_PM_Groups_Xref_test_bkp drop column modified 
	ALTER TABLE tmp_PM_Groups_Xref_test_bkp  drop column rowversion

   	ALTER TABLE tmp_PM_VendorDC_test drop column created
   	ALTER TABLE tmp_PM_VendorDC_test drop column modified 
   	ALTER TABLE tmp_PM_VendorDC_test drop column rowversion

	ALTER TABLE tmp_PM_VendorDC_test_bkp drop column created
	ALTER TABLE tmp_PM_VendorDC_test_bkp  drop column modified 
	ALTER TABLE tmp_PM_VendorDC_test_bkp  drop column rowversion

   	ALTER TABLE tmp_PM_VendorAcct_test drop column created
 	ALTER TABLE tmp_PM_VendorAcct_test  drop column modified 
 	ALTER TABLE tmp_PM_VendorAcct_test  drop column rowversion

	ALTER TABLE tmp_PM_VendorAcct_test_bkp  drop column created
	ALTER TABLE tmp_PM_VendorAcct_test_bkp  drop column modified 
	ALTER TABLE tmp_PM_VendorAcct_test_bkp drop column rowversion

    ALTER TABLE tmp_PM_Cred_test drop column created
    ALTER TABLE tmp_PM_Cred_test drop column modified 
    ALTER TABLE tmp_PM_Cred_test drop column rowversion

	ALTER TABLE tmp_PM_Cred_test_bkp  drop column created
	ALTER TABLE tmp_PM_Cred_test_bkp drop column modified 
	ALTER TABLE tmp_PM_Cred_test_bkp drop column rowversion

    ALTER TABLE tmp_PM_Pharmacy_test drop column created
    ALTER TABLE tmp_PM_Pharmacy_test  drop column modified 
    ALTER TABLE tmp_PM_Pharmacy_test  drop column rowversion

	ALTER TABLE tmp_PM_Pharmacy_test_bkp  drop column created
	ALTER TABLE tmp_PM_Pharmacy_test_bkp drop column modified 
	ALTER TABLE tmp_PM_Pharmacy_test_bkp drop column rowversion

	ALTER TABLE tmp_PM_AddressMaster_test  drop column created
	ALTER TABLE tmp_PM_AddressMaster_test drop column modified 
	ALTER TABLE tmp_PM_AddressMaster_test drop column rowversion

	ALTER TABLE tmp_PM_AddressMaster_test_bkp  drop column created
	ALTER TABLE tmp_PM_AddressMaster_test_bkp drop column modified 
	ALTER TABLE tmp_PM_AddressMaster_test_bkp drop column rowversion

    ALTER TABLE tmp_pm_addressMaster_FinTest drop column created
	ALTER TABLE tmp_pm_addressMaster_FinTest drop column modified 
	ALTER TABLE tmp_pm_addressMaster_FinTest drop column rowversion

--------


    ALTER TABLE tmp_PM_APIAccounts_test drop column created
	ALTER TABLE tmp_PM_APIAccounts_test drop column modified 
	ALTER TABLE tmp_PM_APIAccounts_test drop column rowversion


	ALTER TABLE tmp_PM_APIAccounts_test_bkp  drop column created
	ALTER TABLE tmp_PM_APIAccounts_test_bkp drop column modified 
	ALTER TABLE tmp_PM_APIAccounts_test_bkp drop column rowversion


--- HERE WE CREATE THE KEYS

 
ALTER TABLE [dbo].[tmp_PM_Pharmacy_test] ADD  CONSTRAINT [PK_PM_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
ALTER TABLE [dbo].[tmp_PM_AddressMaster_test] ADD  CONSTRAINT [PK_PM_AddressMaster] PRIMARY KEY CLUSTERED 
(
	[PK_AddressMaster] ASC,
	[PMID] ASC,
	[Address_Type_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
ALTER TABLE [dbo].[tmp_pm_addressMaster_FinTest] ADD  CONSTRAINT [PK_PM_AddressMaster_FIN] PRIMARY KEY CLUSTERED 
(
	[PK_AddressMaster] ASC,
	[PMID] ASC,
	[Address_Type_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
ALTER TABLE [dbo].[tmp_PM_APIAccounts_test] ADD  CONSTRAINT [PK_PM_APIAccount] PRIMARY KEY CLUSTERED 
(
	[APIAccountNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
ALTER TABLE [dbo].[tmp_PM_Cred_test] ADD  CONSTRAINT [PK_PM_Cred] PRIMARY KEY CLUSTERED 
(
	[PK_Cred] ASC,
	[PMID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
ALTER TABLE [dbo].[tmp_pm_groups_xref_test] ADD  CONSTRAINT [PK_pm_groups_xref] PRIMARY KEY CLUSTERED 
(
	[Grpxref_ID] ASC,
	[PMID] ASC,
	[Group_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
ALTER TABLE [dbo].[tmp_PM_VendorAcct_test] ADD  CONSTRAINT [PK_PM_VendorAccts] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[VendorID] ASC,
	[VendAcctNum] ASC,
	[Source] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

 
ALTER TABLE [dbo].[tmp_PM_VendorDC_test] ADD  CONSTRAINT [PK_PM_VendorDC] PRIMARY KEY CLUSTERED 
(
	[PMID] ASC,
	[VendorID] ASC,
	[VendAcctNum] ASC,
	[DCNum] ASC,
	[Source] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

---- Foreign Keys
 
ALTER TABLE [dbo].[tmp_PM_AddressMaster_test]  WITH NOCHECK ADD  CONSTRAINT [FK_PM_AddressMaster_PM_Pharmacy] FOREIGN KEY([PMID])
REFERENCES [dbo].[tmp_PM_Pharmacy_test] ([PMID])
ON UPDATE CASCADE
ON DELETE CASCADE
 
 
ALTER TABLE [dbo].[tmp_pm_addressMaster_FinTest]  WITH NOCHECK ADD  CONSTRAINT [FK_PM_AddressMasterFIN_PM_Pharmacy] FOREIGN KEY([PMID])
REFERENCES [dbo].[tmp_PM_Pharmacy_test] ([PMID])
ON UPDATE CASCADE
ON DELETE CASCADE
 
 
ALTER TABLE [dbo].[tmp_PM_APIAccounts_test]  WITH NOCHECK ADD  CONSTRAINT [FK_PM_APIAccounts_PM_Pharmacy] FOREIGN KEY([PMID])
REFERENCES [dbo].[tmp_PM_Pharmacy_test] ([PMID])
ON UPDATE CASCADE
ON DELETE CASCADE
 
 
ALTER TABLE [dbo].[tmp_PM_Cred_test]  WITH NOCHECK ADD  CONSTRAINT [FK_PM_Cred_PM_Pharmacy] FOREIGN KEY([PMID])
REFERENCES [dbo].[tmp_PM_Pharmacy_test] ([PMID])
ON UPDATE CASCADE
ON DELETE CASCADE
 
 
ALTER TABLE [dbo].[tmp_pm_groups_xref_test]  WITH NOCHECK ADD  CONSTRAINT [FK_pm_groups_xref_PM_Pharmacy] FOREIGN KEY([PMID])
REFERENCES [dbo].[tmp_PM_Pharmacy_test] ([PMID])
ON UPDATE CASCADE
ON DELETE CASCADE
 
 
ALTER TABLE [dbo].[tmp_PM_VendorAcct_test]  WITH NOCHECK ADD  CONSTRAINT [FK_PM_VendorAccts_PM_Pharmacy] FOREIGN KEY([PMID])
REFERENCES [dbo].[tmp_PM_Pharmacy_test] ([PMID])
ON UPDATE CASCADE
ON DELETE CASCADE




--USE CODE BELOW TO RESTORE TMP TABLE FROM BKUP

--drop table tmp_PM_Pharmacy_test
--select * into tmp_PM_Pharmacy_test from tmp_PM_Pharmacy_test_bkp
--
--drop table  tmp_PM_AddressMaster_test
--select * into tmp_PM_AddressMaster_test from tmp_PM_AddressMaster_test_bkp 
--
--drop table tmp_PM_Cred_test
--select * into tmp_PM_Cred_test from tmp_PM_Cred_test_bkp 
--
--drop table tmp_PM_APIAccounts_test
--select * into tmp_PM_APIAccounts_test from tmp_PM_APIAccounts_test_bkp 
--
--drop table tmp_PM_VendorAcct_test
--select * into tmp_PM_VendorAcct_test from tmp_PM_VendorAcct_test_bkp
--
--drop table tmp_PM_VendorDC_test
--select * into tmp_PM_VendorDC_test from tmp_PM_VendorDC_test_bkp
--
--drop table tmp_PM_Groups_Xref_test
--select * into tmp_PM_Groups_Xref_test from tmp_PM_Groups_Xref_test_bkp 

--USE Code Below to Copy Prod before update to Prod - change Date
--select * into PMBackups..PM_Pharmacy_BeforeUpdate062210 from pharmacymaster..PM_Pharmacy
--select * into PMBackups..PM_AddressMaster_BeforeUpdate062210 from pharmacymaster..PM_AddressMaster
--select * into PMBackups..PM_AddressType_BeforeUpdate062210 from pharmacymaster..PM_AddressType
--select * into PMBackups..PM_Cred_BeforeUpdate062210 from pharmacymaster..PM_Cred
--select * into PMBackups..PM_Groups_xref_BeforeUpdate062210 from pharmacymaster..PM_Groups_xref
--select * into PMBackups..PM_Groups_BeforeUpdate062210 from pharmacymaster..PM_Groups
--select * into PMBackups..PM_Programs_BeforeUpdate062210 from pharmacymaster..PM_Programs
--select * into PMBackups..PM_MemberPrograms_BeforeUpdate062210 from pharmacymaster..PM_MemberPrograms
--select * into PMBackups..PM_DeletedPMID_BeforeUpdate062210 from pharmacymaster..PM_DeletedPMID
--select * into PMBackups..PM_ManagedCare_BeforeUpdate062210 from pharmacymaster..PM_ManagedCare
--select * into PMBackups..PM_Pharmacists_BeforeUpdate062210 from pharmacymaster..PM_Pharmacists
--select * into PMBackups..PM_VendorAccts_BeforeUpdate062210 from pharmacymaster..PM_VendorAccts
--select * into PMBackups..PM_Vendors_BeforeUpdate062210 from pharmacymaster..PM_Vendors
--select * into PMBackups..PM_VendorDC_BeforeUpdate062210 from pharmacymaster..PM_VendorDC
--select * into PMBackups..PM_APIAccounts_BeforeUpdate062210 from pharmacymaster..PM_APIAccounts

END





GO
