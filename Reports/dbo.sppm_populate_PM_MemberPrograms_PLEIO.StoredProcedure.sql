USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_populate_PM_MemberPrograms_PLEIO]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/24/2011>
-- Description:	Populate PM_MemberPrograms
-- =============================================
CREATE PROCEDURE [dbo].[sppm_populate_PM_MemberPrograms_PLEIO]
 
 

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
--  Need to change table , dates and selection criteria - but this is just a template of how to do it

-- INSERT into pharmacymaster..pm_memberprograms
-- 
--	SELECT PMID ,'194' as ProgramID,SelectDate as StartDate,null as EndDate,null as Comment,'09/13/2012' as Created,'09/13/2012' as Modified,
--	1 as RowVersion ,-1 as AAP from 
--  (
--		select    PMID ,SelectDate from claims.dbo.v_PleioAllStores c
--		join
--		(
--			select PMID,NCPDP,
--		case when aapeffectivedate > '01/01/2012' then aapeffectivedate else '01/01/2012' end as SelectDate
--		 from pharmacymaster..pm_pharmacy where aapquitdate is null and aapaccountno is not null and dea != 'FM2571328'
--			and aapeffectivedate is not null
--		) p
--		on c.[Pharm ID] = p.ncpdp  
--	)ch
 

 

END










GO
