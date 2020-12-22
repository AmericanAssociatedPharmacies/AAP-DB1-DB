USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Populate_PM_AnnualRebates_POG_delete]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate ALL_VOlume table with API WH Sales 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_Populate_PM_AnnualRebates_POG_delete]
(@in_year varchar(4) )
AS
BEGIN
 
  
UPDATE t set 
        POGRebate  =  v.Rebate  ,
        Affiliate = v.affiliate
	    FROM   pharmacymaster..PM_AnnualRebates t 
			inner join 
			 (  
              	SELECT SUM(rebate) as Rebate ,  pmid,affiliate from reports..import_POGrebate2012    -- CHANGE table
				 GROUP BY   pmid,affiliate 
			) v 
		   on t.pmid =v.pmid  where year = @in_year

 

--INSERT PM_AnnualRebates where PMID does not already exist
 INSERT  into pharmacymaster..PM_AnnualRebates (Year,PMID,TM,APIAccountNo,AccountName,BusClass, POGRebate,Affiliate   )   

      SELECT @in_year ,PMID,Territory,apiAccountNo,accountname,BusinessClass,Rebate,Affiliate FROM (    -- CHANGE DATES
			SELECT  a.pmid, p.territory,p.apiAccountNo ,p.accountname,p.BusinessClass, SUM(Rebate) as Rebate,a.affiliate
				 FROM  reports..import_POGrebate2012   a  -- CHANGE table
					join pharmacymaster..pm_pharmacy p on a.pmid = p.pmid
				 
				 GROUP BY  a.pmid,Territory,p.apiAccountNo,p.accountname,BusinessClass,a.affiliate
                   
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..PM_AnnualRebates where pmid = vol.pmid and   year= @in_year );-- CHANGE DATES



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
 
END








GO
