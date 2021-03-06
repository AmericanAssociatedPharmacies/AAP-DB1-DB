USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_populate_PM_MemberPrograms]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate PM_MemberPrograms
-- =============================================
CREATE PROCEDURE [dbo].[sppm_populate_PM_MemberPrograms]
 
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
--  Need to change table , dates and selection criteria - but this is just a template of how to do it

--	INSERT into temptables..tmp_pm_memberprograms
--
--	SELECT PMID ,'193' as ProgramID,'09/13/2012' as StartDate,null as EndDate,null as Comment,'09/13/2012' as Created,'09/13/2012' as Modified,
--	1 as RowVersion ,0 as AAP from (
--	select PMID from (select pmid from v_pm_allwithaffiliates where aapquitdate is null and aapaccountno is not null
--	and chaincode in ('783','426') and mcquitdate is null ) ch
--	)ch

--- For Managed Care programs need to add in the NPP's also - may need to exclude 103429

--	INSERT into pharmacymaster..pm_memberprograms 
--
--	SELECT PMID ,'193' as ProgramID,'09/10/2012' as StartDate,null as EndDate,null as Comment,'09/10/2012' as Created,'09/10/2012' as Modified,
--	1 as RowVersion ,0 as AAP from (
--	select PMID from (select pmid from v_pm_allwithaffiliates where  isNPP = -1
--	and chaincode in ('783','426') and mcquitdate is null ) ch
--	)ch where pmid not in (select pmid from  pharmacymaster..pm_memberprograms )

END










GO
