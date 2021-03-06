USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_populate_PM_MemberPrograms_ISFund]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate PM_MemberPrograms
-- =============================================
CREATE PROCEDURE [dbo].[sppm_populate_PM_MemberPrograms_ISFund]
 
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

 IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PM_MemberPrograms_ISFund_bkp')
		 BEGIN
          DROP TABLE tmp_PM_MemberPrograms_ISFund_bkp
         END


--BACKUP the current pharmacymaster..PM_MemberPrograms before we update

--select * into tmp_PM_MemberPrograms_ISFund_bkp from pharmacymaster..PM_MemberPrograms

--TRUNCATE THE Report Table
--TRUNCATE table tmp_ISFundInserts_Report  


--  INSERT the new eligible managed care participants if the are not in the pm_memberPrograms table into the Reports table

--INSERT into tmp_ISFundInserts_Report
--SELECT PMID ,'191' as ProgramID,aapeffectivedate as StartDate,null as EndDate,null as Comment,GetDate() as Created,GetDate()  as Modified,
-- 1 as RowVersion ,-1 as AAP from (
--SELECT pmid,aapeffectivedate from pharmacymaster..v_pm_allwithaffiliates where 
-- aapquitdate is null and aapaccountno is not null and aapeffectivedate is not null  
--and pmid  not  in (select pmid from tmp_pm_memberprograms_ISFund  where programid = 191 )  -- Change to pharmacymaster..pm_memberPrograms
--)ch
--

-- INSERT INTO pharmacymaster..pm_memberPrograms from the Reports table
--INSERT into tmp_pm_memberprograms_ISFund  -- Change to pharmacymaster..pm_memberPrograms
--SELECT * from tmp_ISFundInserts_Report ;

--LIST to send a copy via email

--SELECT p.PMID,AccountName,AAPAccountNo,AAPEffectiveDate,AAPQuitDate,NCPDP
 --from pharmacymaster..v_pm_allwithaffiliates p
--join (
--	SELECT * from tmp_ISFundInserts_Report
--) r
--on p.pmid = r.pmid


---NOT USED - JUST STORING
---To find those that have quit but there is no end date in pm_memberprograms for 193 need to add IsNPP
--select pmid,aapquitdate from v_pm_allwithaffiliates where aapquitdate is  not  null and aapaccountno is not null and aapeffectivedate is not null and isNpp = 0
-- and pmid      in (select pmid from pharmacymaster..pm_memberprograms  where programid = 193  and enddate is    null)
----For 191
--select pmid,aapquitdate from v_pm_allwithaffiliates where aapquitdate is  not  null and aapaccountno is not null and aapeffectivedate is not null  
-- and pmid      in (select pmid from pharmacymaster..pm_memberprograms  where programid = 191  and enddate is    null)

END










GO
