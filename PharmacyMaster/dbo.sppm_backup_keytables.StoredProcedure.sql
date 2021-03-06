USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_backup_keytables]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOSHILA NARAYANAN
-- Create date: 02/14/2011
-- Description:	Backup Pharmacy Master key Tables
-- =============================================
CREATE PROCEDURE [dbo].[sppm_backup_keytables]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO PM_Pharmacy_bak SELECT *,getdate() FROM PM_Pharmacy

	INSERT INTO PM_Cred_bak SELECT *,getdate() FROM PM_Cred

	INSERT INTO PM_Pharmacists_bak SELECT *,getdate() FROM PM_Pharmacists

	INSERT INTO PM_AddressMaster_bak SELECT *,getdate() FROM PM_AddressMaster

	INSERT INTO PM_ManagedCare_bak SELECT *,getdate() FROM PM_ManagedCare

	INSERT INTO PM_MemberPrograms_bak SELECT *,getdate() FROM PM_MemberPrograms

	INSERT INTO PM_Modifications_bak SELECT *,getdate() FROM PM_Modifications

	INSERT INTO PM_VendorAccts_bak SELECT *,getdate() FROM PM_VendorAccts

	INSERT INTO PM_Groups_XRef_bak SELECT *,getdate() FROM PM_Groups_XRef

	INSERT INTO PM_APIAccounts_bak SELECT *,getdate() FROM PM_APIAccounts

	INSERT INTO PM_CHAccounts_ADJ_bak SELECT *,getdate() FROM PM_CHAccounts_ADJ 

 

END
GO
