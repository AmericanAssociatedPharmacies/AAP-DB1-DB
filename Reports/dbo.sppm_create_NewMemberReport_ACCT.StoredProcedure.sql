USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_NewMemberReport_ACCT]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <11/17/2010>
-- Description:	Find APIAccountNo's for a certain month/year with no Match in PM_Pharmacy - XX's are excluded
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_NewMemberReport_ACCT]
(@in_month varchar(2), @in_year varchar(4))

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	  SELECT  
		v.PMID,
		territory as TM,  
		aapaccountno as [AAP#],  
		aapparentno as [AAP Parent#],  
		accountname as [Account DBA Name],  
		aapeffectivedate as [AAP Eff. Date],  
		state as St,  
		Affiliate,  
		Wholesaler = case when w.vendor is null then 'CH' else w.vendor end   
     FROM pharmacymaster..v_pm_allwithaffiliates v  left join pharmacymaster..v_wholesaler_primary w on v.pmid=w.pmid 
  	 WHERE  month(v.aapeffectivedate) = @in_month and year(v.aapeffectivedate) = @in_year  order by v.aapeffectivedate
 


END










GO
