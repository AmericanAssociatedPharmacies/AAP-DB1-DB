USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_GenericIncentive_PopulatePM]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <02/08/2016>
-- Description:	 Populate PM_AnnualRebates table with Generic Incentive Rebates
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_GenericIncentive_PopulatePM]
(@in_year varchar(4) )
AS
BEGIN

--*****************These have changed in 2015 for the 2014 year  - they are now paying in 2 payments - I don't know how 
-- they will get an accurate total for the Patronage Dividends if they are deducting a $15 check fee for those getting a check
-- The second payment isn't until August and the payment mode could change by then.  Don't know what the file will look like next year.
-- Just need to keep watch and talk to Dianna about it

-- This is what I used to update the payments for 2014:

		UPDATE  a  set 
			GenericIncentiveFirstPayment = p.[NetPaymentFirstPayment],
            GenericIncentiveSecondPayment = p.[NetPaymentSecondPayment],
			GenericIncentive = p.GenericLoyaltyRebate
	   FROM pharmacymaster..PM_AnnualRebates a 
		inner join 
			( select * from reports..import_RebateGenericIncentive where year = @in_year) p
	        on a.pmid = p.pmid where a.year = @in_year

 
 

----INSERT PM_AnnualRebates where PMID does not already exist
 INSERT  into pharmacymaster..PM_AnnualRebates (Year,PMID,TM, APIAccountNo, AccountName,BusClass, TotalGenerics ,GenericIncentive,GenericIncentiveFirstPayment ,GenericIncentiveSecondPayment)   

      SELECT @in_year ,PMID, Territory, apiaccountno, accountname,BusinessClass,TotalGenerics,GenericIncentive,NetPaymentFirstPayment,NetPaymentSecondPayment FROM (    -- CHANGE DATES
			SELECT  a.pmid, p.territory, a.apiaccountno, p.accountname,p.BusinessClass, SUM([EligGenericsforRebate]) as TotalGenerics,sum ([GenericLoyaltyRebate]) as GenericIncentive,
                   SUM([NetPaymentFirstPayment]) as [NetPaymentFirstPayment],SUM([NetPaymentSecondPayment]) as [NetPaymentSecondPayment]
				 FROM   Reports..import_RebateGenericIncentive  a   
					join pharmacymaster..pm_pharmacy p on a.pmid = p.pmid where a.year = @in_year
				 
				 GROUP BY  a.pmid,p.Territory, a.apiaccountno, p.accountname,BusinessClass

            )vol
	 WHERE not exists  (select pmid from pharmacymaster..PM_AnnualRebates where pmid = vol.pmid and   year= @in_year  ); 

--
--
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
    UPDATE pharmacymaster..PM_AnnualRebates set GenericIncentiveFirstPayment = 0  where GenericIncentiveFirstPayment is null
    UPDATE pharmacymaster..PM_AnnualRebates set GenericIncentiveSecondPayment = 0 where GenericIncentiveSecondPayment is null

 
END








GO
