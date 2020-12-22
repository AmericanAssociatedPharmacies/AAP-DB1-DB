USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_populate_PM_MemberPrograms_GeneriCare]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate PM_MemberPrograms
-- =============================================
CREATE PROCEDURE [dbo].[sppm_populate_PM_MemberPrograms_GeneriCare]
 
 

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


--INSERT INTO pharmacymaster..pm_memberPrograms
--SELECT PMID ,'189' as ProgramID,startdate as StartDate,null as EndDate,null as Comment,GetDate() as Created,GetDate()  as Modified,
-- 1 as RowVersion ,0 as AAP from (
--select p.pmid,t.startdate from tmp_GeneriCareLoad  t
--join
--(
--select * from pharmacymaster..v_pm_allwithaffiliates where aapquitdate is null  
--) p on t.ncpdp= p.ncpdp ) ch


---NOT USED - JUST STORING
---To find those that have quit but there is no end date in pm_memberprograms for 193 need to add IsNPP
--select pmid,aapquitdate from v_pm_allwithaffiliates where aapquitdate is  not  null and aapaccountno is not null and aapeffectivedate is not null and isNpp = 0
-- and pmid      in (select pmid from pharmacymaster..pm_memberprograms  where programid = 193  and enddate is    null)
----For 191
--select pmid,aapquitdate from v_pm_allwithaffiliates where aapquitdate is  not  null and aapaccountno is not null and aapeffectivedate is not null  
-- and pmid      in (select pmid from pharmacymaster..pm_memberprograms  where programid = 191  and enddate is    null)

END










GO
