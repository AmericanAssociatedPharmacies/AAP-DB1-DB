USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_PatDiv_PopulatePM]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--[Net to be paid Apr 8]
--
--[Half to be paid Aug 5]
-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/16/2016>
-- Description:	 Populate PM_AnnualRebates table with Patronage Dividend for the Year
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_PatDiv_PopulatePM]
(@in_year varchar(4) )
AS
BEGIN
 
UPDATE t set 
        PatronageDividend =  v.PatronageDividend,
		PatDivFirstPayment = v.FirstPayment, 
		PatDivSecondPayment = v.SecondPayment 
	    FROM   pharmacymaster..PM_AnnualRebates t 
			inner join 
			 (  
              	SELECT SUM(PatDivRebate) as PatronageDividend, SUM(FirstPayment) as FirstPayment , SUM(SecondPayment) as SecondPayment,
				  pmid from reports..import_RebatePatDivRebate where year = @in_year
				 GROUP BY   pmid
			) v 
		   on t.pmid =v.pmid  where year = @in_year
 

--INSERT PM_AnnualRebates where PMID does not already exist
 INSERT  into pharmacymaster..PM_AnnualRebates (Year,PMID,TM,APIAccountNo,AccountName,BusClass, PatronageDividend ,PatDivFirstPayment, PatDivSecondPayment)   

      SELECT @in_year ,PMID,Territory,apiAccountNo,accountname,BusinessClass,PatronageDividend,FirstPayment, SecondPayment FROM (    
			SELECT  a.pmid, p.territory,p.apiAccountNo ,p.accountname,p.BusinessClass, SUM(PatDivRebate) as PatronageDividend,
				SUM(FirstPayment) as FirstPayment , SUM(SecondPayment) as SecondPayment
				 FROM  reports..import_RebatePatDivRebate   a   
					join pharmacymaster..pm_pharmacy p on a.pmid = p.pmid where year = @in_year
				 
				 GROUP BY  a.pmid,Territory,p.apiAccountNo,p.accountname,BusinessClass
                   
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..PM_AnnualRebates where pmid = vol.pmid and   year= @in_year  ); 



	---SET any NULLS TO ZERO and DO totals
    
	UPDATE pharmacymaster..PM_AnnualRebates set PlanOGramRebate = 0.00 where PlanOGramRebate is null;
	UPDATE pharmacymaster..PM_AnnualRebates set PatronageDividend = 0.00 where PatronageDividend is null;
	UPDATE pharmacymaster..PM_AnnualRebates set GenericIncentive = 0.00 where GenericIncentive is null;
	UPDATE pharmacymaster..PM_AnnualRebates set PatDivFirstPayment = 0.00 where PatDivFirstPayment is null;
	UPDATE pharmacymaster..PM_AnnualRebates set PatDivSecondPayment = 0.00 where PatDivSecondPayment is null;
    UPDATE pharmacymaster..PM_AnnualRebates set [3MRebate] = 0.00 where [3MRebate] is null;
	UPDATE pharmacymaster..PM_AnnualRebates set POGRebate = 0.00 where POGRebate is null;
	UPDATE pharmacymaster..PM_AnnualRebates set MasonRebate = 0.00 where MasonRebate is null;
  UPDATE pharmacymaster..PM_AnnualRebates set TotalGenerics = 0.00 where TotalGenerics is null;
  UPDATE pharmacymaster..PM_AnnualRebates set GenericIncentiveFirstPayment = 0.00 where GenericIncentiveFirstPayment is null;
  UPDATE pharmacymaster..PM_AnnualRebates set GenericIncentiveSecondPayment = 0.00 where GenericIncentiveSecondPayment is null;

 
END








GO
