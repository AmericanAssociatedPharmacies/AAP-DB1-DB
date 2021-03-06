USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_CardinalAdminFee_PopulatePM_delete]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--[Net to be paid Apr 8]
--
--[Half to be paid Aug 5]
-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate PM_AnnualRebates table with Cardinal Annual Admin Fee (Rebate)
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_CardinalAdminFee_PopulatePM_delete]
(@in_year varchar(4) )
AS
BEGIN

--Example of how I did pivot - do one of these for each month;

Insert  into PM_CH_AnnualAdminFee_2014
SELECT  '12/01/2014' as date, sum([Dec]) as ExtSales,PMID from  PM_CH_AnnualAdminFee_2014_Pivot
GROUP by PMID

 
--UPDATE t set 
--        PatronageDividend =  v.PatronageDividend,
--		PatDivFirstPayment = v.FirstPayment, 
--		PatDivSecondPayment = v.SecondPayment 
--	    FROM   pharmacymaster..PM_AnnualRebates t 
--			inner join 
--			 (  
--              	SELECT SUM([Total to be paid]) as PatronageDividend, SUM([Net to be paid Apr 8]) as FirstPayment , SUM([Half to be paid Aug 5]) as SecondPayment,
--				  pmid from reports..import_PatDivRebate2014     -- CHANGE TABLE and FIELD NAMES !!!!!!!!!!
--				 GROUP BY   pmid
--			) v 
--		   on t.pmid =v.pmid  where year = @in_year
-- 
--
----INSERT PM_AnnualRebates where PMID does not already exist
-- INSERT  into pharmacymaster..PM_AnnualRebates (Year,PMID,TM,APIAccountNo,AccountName,BusClass, PatronageDividend ,PatDivFirstPayment, PatDivSecondPayment)   
--
--      SELECT @in_year ,PMID,Territory,apiAccountNo,accountname,BusinessClass,PatronageDividend,FirstPayment, SecondPayment FROM (    
--			SELECT  a.pmid, p.territory,p.apiAccountNo ,p.accountname,p.BusinessClass, SUM([Total to be paid]) as PatronageDividend,
--				SUM([Net to be paid Apr 8]) as FirstPayment , SUM([Half to be paid Aug 5]) as SecondPayment
--				 FROM  reports..import_PatDivRebate2014   a  -- CHANGE TABLE and FIELD NAMES !!!!!!!!!!
--					join pharmacymaster..pm_pharmacy p on a.pmid = p.pmid
--				 
--				 GROUP BY  a.pmid,Territory,p.apiAccountNo,p.accountname,BusinessClass
--                   
--		 )vol
--	 WHERE not exists  (select pmid from pharmacymaster..PM_AnnualRebates where pmid = vol.pmid and   year= @in_year  ); 
--
--
--
--	---SET any NULLS TO ZERO and DO totals
--    
--	UPDATE pharmacymaster..PM_AnnualRebates set PlanOGramRebate = 0.00 where PlanOGramRebate is null;
--	UPDATE pharmacymaster..PM_AnnualRebates set PatronageDividend = 0.00 where PatronageDividend is null;
--	UPDATE pharmacymaster..PM_AnnualRebates set GenericIncentive = 0.00 where GenericIncentive is null;
--	UPDATE pharmacymaster..PM_AnnualRebates set PatDivFirstPayment = 0.00 where PatDivFirstPayment is null;
--	UPDATE pharmacymaster..PM_AnnualRebates set PatDivSecondPayment = 0.00 where PatDivSecondPayment is null;
--    UPDATE pharmacymaster..PM_AnnualRebates set [3MRebate] = 0.00 where [3MRebate] is null;
--	UPDATE pharmacymaster..PM_AnnualRebates set POGRebate = 0.00 where POGRebate is null;
--	UPDATE pharmacymaster..PM_AnnualRebates set MasonRebate = 0.00 where MasonRebate is null;
--  UPDATE pharmacymaster..PM_AnnualRebates set TotalGenerics = 0.00 where TotalGenerics is null;

 
END








GO
