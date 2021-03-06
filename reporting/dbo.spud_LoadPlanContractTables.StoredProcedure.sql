USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_LoadPlanContractTables]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Joni Wilson
-- Create date: 08/06/2009
-- Description:	CREATE Tables for Plan Contracts from MaxDB
-- =============================================
CREATE PROCEDURE [dbo].[spud_LoadPlanContractTables] 
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	Begin Tran lPC

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ud_PLAN_CONTRACT') DROP TABLE ud_PLAN_CONTRACT
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lPC
				Return
			End	

		
		Select DISTINCT r.* INTO ud_PLAN_CONTRACT FROM         
		OPENQUERY(UNITEDDB, 'select * from united.PLAN_CONTRACT')  r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lPC
				Return
			End
		

		
	
	Commit Tran lPC
END

BEGIN
	Begin Tran lWPC

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ud_WEB_PLAN_CONTRACT_ATTACHMENT') DROP TABLE ud_WEB_PLAN_CONTRACT_ATTACHMENT
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lWPC
				Return
			End	

		Select  DISTINCT r.* INTO ud_WEB_PLAN_CONTRACT_ATTACHMENT FROM         
		OPENQUERY(UNITEDDB, 'select * from united.WEB_PLAN_CONTRACT_ATTACHMENT') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lWPC
				Return
			End
		
	Commit Tran lWPC

END

BEGIN
	Begin Tran lCT

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ud_CONTACT') DROP TABLE ud_CONTACT
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lCT
				Return
			End	
        			--	ALTER TABLE ud_Contact ADD Indexes; 

--		CREATE NONCLUSTERED  INDEX IDX_XidXtype
--		on ud_Contact (XREF_ID,XREF_TYPE) 
--		If @@error <> 0 
--			Begin				
--				Rollback Tran lStore
--				Return
--			End 
--        CREATE NONCLUSTERED  INDEX IDX_XtypeCType
--		on ud_Contact (XREF_TYPE,CONTACT_TYPE) 
--		If @@error <> 0 
--			Begin				
--				Rollback Tran lStore
--				Return
--			End 

		Select  DISTINCT r.* INTO ud_CONTACT FROM         
		OPENQUERY(UNITEDDB, 'select * from united.CONTACT') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lCT
				Return
			End
		
	Commit Tran lCT

END

BEGIN
	Begin Tran lMO

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ud_MC_OPTION') DROP TABLE ud_MC_OPTION
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lMO
				Return
			End	

		Select DISTINCT r.* INTO ud_MC_OPTION FROM         
		OPENQUERY(UNITEDDB, 'select * from managed_care.MC_OPTION') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lMO
				Return
			End
		
	Commit Tran lMO

END

BEGIN
	Begin Tran lMCO

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ud_MC_CONTRACT_OPTION') DROP TABLE ud_MC_CONTRACT_OPTION
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lMCO
				Return
			End	

		Select DISTINCT r.*  INTO ud_MC_CONTRACT_OPTION FROM         
		OPENQUERY(UNITEDDB, 'select * from managed_care.MC_CONTRACT_OPTION') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lMCO
				Return
			End
		
	Commit Tran lMCO

END

BEGIN
	Begin Tran lCNT

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ud_CONTRACT_NETWORK_TYPE') DROP TABLE ud_CONTRACT_NETWORK_TYPE
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lCNT
				Return
			End	

		Select DISTINCT r.*  INTO ud_CONTRACT_NETWORK_TYPE FROM         
		OPENQUERY(UNITEDDB, 'select * from managed_care.CONTRACT_NETWORK_TYPE') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lCNT
				Return
			End
		
	Commit Tran lCNT

END

BEGIN
	Begin Tran lNT

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ud_NETWORK_TYPE') DROP TABLE ud_NETWORK_TYPE
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lNT
				Return
			End	

		Select  DISTINCT r.*  INTO ud_NETWORK_TYPE FROM         
		OPENQUERY(UNITEDDB, 'select * from managed_care.NETWORK_TYPE') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lNT
				Return
			End
		
	Commit Tran lNT

END

BEGIN
	Begin Tran lCT

		IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='ud_CONTRACT_TYPE') DROP TABLE ud_CONTRACT_TYPE
		If @@error <> 0 
			Begin												
				Print 'Error on Drop Table'
				Rollback Tran lCT
				Return
			End	

		Select  DISTINCT r.* INTO ud_CONTRACT_TYPE FROM         
		OPENQUERY(UNITEDDB, 'select * from managed_care.CONTRACT_TYPE') r
		If @@error <> 0 
			Begin												
				Print 'Error on Copy Table '
				Rollback Tran lCT
				Return
			End
		
	Commit Tran lCT

END
GO
