USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_updateAPIAccounts_delPMID]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sppm_updateAPIAccounts_delPMID]
as

		UPDATE  pa  set 
		pmid = dp.movedto_pmid  

		FROM pm_apiaccounts  pa 
		inner join 
		( select deleted_pmid,movedto_pmid from PM_DeletedPMID   ) dp
		on pa.pmid = dp.deleted_pmid 

--	select pa.apiaccountno,pa.pmid,dp.deleted_pmid,dp.movedto_pmid 
--	FROM pm_apiaccounts  pa 
--	inner join 
--		( select deleted_pmid,movedto_pmid from PM_DeletedPMID   ) dp
--	on pa.pmid = dp.deleted_pmid 


GO
