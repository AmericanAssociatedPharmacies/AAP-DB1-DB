USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_GenIncentive_Merge]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate ALL_VOlume table with API WH Sales 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_GenIncentive_Merge]
 
AS
BEGIN
 
 
 -- Merging in old tables

----2011
-- INSERT  into reports..import_RebateGenericIncentive (Year, PMID, AccountName,p.City,State,Territory,
--              APIAccountNo,TotalGenericsSales,GenericLoyaltyRebate,p.Affiliate)   
--
--      SELECT '2011' ,a.PMID,p.AccountName,p.City,ST,Smn, 
--                   p.APIAccountNo, sum(Generics) as Generics,SUM([GxL Incentive]) as Rebate,p.Affiliate
--				 FROM  reports..import_GenericIncentive2011Final a  
--					join pharmacymaster..v_pm_allwithaffiliates p on a.pmid = p.pmid
--				 
--				 GROUP BY a.PMID,p.AccountName,p.City,ST,Smn, 
--                   p.APIAccountNo,p.Affiliate
-- 
 
----2012
-- INSERT  into reports..import_RebateGenericIncentive (Year, PMID, AccountName,p.City,State,Territory,BusCls,
--              APIAccountNo,TotalGenericsSales,EligGenericsforRebate,GenericLoyaltyRebate,p.Affiliate)   
--
--      SELECT '2012' ,a.PMID,p.AccountName,p.City,ST,Smn, BusCls,
--                   p.APIAccountNo, sum(TotalGenerics) as TotalGenerics,SUM(EligGenForRebage) as EligGeneric,
--                           SUM([GenIncentiveRebate]) as Rebate,p.Affiliate
--				 FROM  reports..import_GenIncentive2012FinalSum a  
--					join pharmacymaster..v_pm_allwithaffiliates p on a.pmid = p.pmid
--				 
--				 GROUP BY a.PMID,p.AccountName,p.City,ST,Smn, BusCls,
--                   p.APIAccountNo,p.Affiliate

----2013
 INSERT  into reports..import_RebateGenericIncentive (Year, PMID, AccountName,p.City,State,Territory,BusCls,
              APIAccountNo,EligGenericsforRebate,GenericLoyaltyRebate,Affiliate)   

      SELECT '2013' ,a.PMID,p.AccountName,p.City,ST,p.territory, p.businessclass,
                   p.APIAccountNo,  SUM([Elig Generics For Rebate]) as EligGeneric,
                           SUM([Generic Loyalty Rebate]) as Rebate,p.Affiliate
				 FROM  reports..import_GenIncentive2013 a  
					join pharmacymaster..v_pm_allwithaffiliates p on a.pmid = p.pmid
				 
				 GROUP BY a.PMID,p.AccountName,p.City,ST, p.businessclass, p.territory,
                   p.APIAccountNo,p.Affiliate
 
 
--2014 -- Did this from SSIS 
-- INSERT  into reports..import_RebateGenericIncentive (Year,APIAccountNo,BusCls,Affiliate,AccountName,City,State,
--         Territory,TotalGenericsSales,EligGenericsforRebate)   
--
 
-- 
END








GO
