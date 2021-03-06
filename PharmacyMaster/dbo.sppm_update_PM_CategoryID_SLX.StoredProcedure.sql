USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_PM_CategoryID_SLX]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Pharmacy CategoryID from SLX
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_PM_CategoryID_SLX]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	--LTC Closed
UPDATE  p  set 
	categoryid = 3
FROM pm_pharmacy   p 
inner join 
	( select pmid from reporting..v_SLXAccount_PMID where category = 'LTC/Clsd Door' ) s
on p.pmid = s.pmid   

--Apothecary
UPDATE  p  set 
	categoryid = 1
FROM pm_pharmacy   p 
inner join 
	( select pmid from reporting..v_SLXAccount_PMID where category = 'Apothecary' ) s
on p.pmid = s.pmid   

--Clinic
UPDATE  p  set 
	categoryid = 2
FROM pm_pharmacy   p 
inner join 
	( select pmid from reporting..v_SLXAccount_PMID where category = 'Clinic' ) s
on p.pmid = s.pmid  

--Compounding Phcy 
UPDATE  p  set 
	categoryid = 8
FROM pm_pharmacy   p 
inner join 
	( select pmid from reporting..v_SLXAccount_PMID where category = 'Compounding Phcy' ) s
on p.pmid = s.pmid  

--Full Line 
UPDATE  p  set 
	categoryid = 5
FROM pm_pharmacy   p 
inner join 
	( select pmid from reporting..v_SLXAccount_PMID where category = 'Full Line' ) s
on p.pmid = s.pmid  

--Medical Supply
UPDATE  p  set 
	categoryid = 7
FROM pm_pharmacy   p 
inner join 
	( select pmid from reporting..v_SLXAccount_PMID where category = 'Medical Supply' ) s
on p.pmid = s.pmid 

--Grocery
UPDATE  p  set 
	categoryid = 6
FROM pm_pharmacy   p 
inner join 
	( select pmid from reporting..v_SLXAccount_PMID where category = 'Grocery' ) s
on p.pmid = s.pmid 

--LTC/Open 

--Still need to figure out what to do here - many that we have in PM as LTC have other categories assigned to them in SLX (not a one to one??)

--select p.pmid,categoryid, m.pmid from PM_Pharmacy p
-- join
--(
--select distinct  pmid from pharmacymaster..PM_MemberPrograms where programid = 170
--)m
--on p.pmid = m.pmid where p.categoryid is   null

--select p.pmid,categoryid, m.pmid from PM_Pharmacy p
-- join
--(
--select distinct  pmid from pharmacymaster..PM_MemberPrograms where programid = 170
--)m
--on p.pmid = m.pmid where p.categoryid is  not null

 
END








GO
