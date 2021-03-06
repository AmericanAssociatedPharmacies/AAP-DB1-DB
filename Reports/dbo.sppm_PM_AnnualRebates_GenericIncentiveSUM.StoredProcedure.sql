USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PM_AnnualRebates_GenericIncentiveSUM]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate PM_AnnualRebates table with Patronage Dividend for the Year
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PM_AnnualRebates_GenericIncentiveSUM]
(@in_year varchar(4) )
AS
BEGIN

--*****************These have changed in 2015 for the 2014 year  - they are now paying in 2 payments - I don't know how 
-- they will get an accurate total for the Patronage Dividends if they are deducting a $15 check fee for those getting a check
-- The second payment isn't until August and the payment mode could change by then.  Don't know what the file will look like next year.
-- Just need to keep watch and talk to Dianna about it


/********** PMID is being populated from this sproc: */
--NEW JMW 01/07/2015 Need to populate the PMID field to the Sum table and then sum it all up to the - first try
--Pharmacy Master then the PM_APIAccounts table
--DO THIS TOO 
--		UPDATE  g  set 
--			pmid = a.pmid  
--	    FROM reports..import_RebateGenericIncentiveSum    g 
--		inner join 
--		(
--			select a1.pmid,a1.apiaccountno from reports..import_RebateGenericIncentiveSum  gs
--			join
--			(
--			   select *    from pharmacymaster..PM_Pharmacy
--			) a1 on gs.apiaccountno = a1.apiaccountno where (gs.pmid is null or gs.pmid = '')  and  year = @in_year
--        ) a
--	    on g.apiaccountno = a.apiaccountno   where year = @in_year

----DO THIS TOO - this goes to the PM_APIAccounts to get any that are archived
--		UPDATE  g  set 
--			pmid = a.pmid  
--	    FROM reports..import_RebateGenericIncentiveSum    g 
--		inner join 
--		(
--			select a1.pmid,a1.apiaccountno from reports..import_RebateGenericIncentiveSum  gs
--			join
--			(
--			   select *    from pharmacymaster..PM_APIAccounts where date is not null and apiaccountno  not like '%-%'
--			) a1 on gs.apiaccountno = a1.apiaccountno where (gs.pmid is null or gs.pmid = '')  and  year = @in_year
--        ) a
--	    on g.apiaccountno = a.apiaccountno   where year = @in_year

--Now Sum to the reports..import_RebateGenericIncentive table
 --DO THIS TOO 
	INSERT into Reports..import_RebateGenericIncentive (
			[Year],
			[PMID],
			[APIAccountNo],
			[BusCls],
			[Affiliate],
			[AccountName],
			[City],
			[State],
			[Territory],
			[TotalGenericsSales],
			[EligGenericsforRebate],
			[GenericLoyaltyRebate],
			[FirstPaymentAmt],
			[CheckFeeFirstPayment],
			[NetPaymentFirstPayment],
			[PayAccountFirstPayment],
			[PaymentModeFirstPayment],
			[SecondPaymentAmt],
			[CheckFeeSecondPayment],
			[NetPaymentSecondPayment],
			[PayAccountSecondPayment],
			[BusClsSecondPayment],
            [NegativeRebatesCollectedSecondPayment],
			[AffiliateSecondPayment],
            [SecondPaymentCollectFC],
			[SecondPaymentCollectNegativeRebate])
		SELECT @in_year, 
            [PMID],
            max([APIAccountNo]),
			max([BusCls]),
			max([Affiliate]),
			max([AccountName]),
			max([City]),
			max([State]),
			max([Territory]),
			sum([TotalGenericsSales]),
			sum([EligGenericsforRebate]),
			sum([GenericLoyaltyRebate]),
			sum([FirstPaymentAmt]),
			sum([CheckFeeFirstPayment]),
			sum([NetPaymentFirstPayment]),
			max(convert(int,[PayAccountFirstPayment])), 
			max([PaymentModeFirstPayment]),
			sum([SecondPaymentAmt]),
			sum([CheckFeeSecondPayment]),
			sum([NetPaymentSecondPayment]),
			max(convert(int,[PayAccountSecondPayment])), 
			max([BusClsSecondPayment]),
			sum([NegativeRebatesCollectedSecondPayment]),
			max([AffiliateSecondPayment]),
            sum([SecondPaymentCollectFC]),
			sum([SecondPaymentCollectNegativeRebate]) 
			 FROM import_RebateGenericIncentiveSum  
			 where year = @in_year 
			 group by PMID ,year
----------
--NEED TO UPDATE FROM PM_APIACCOUNTS AGAIN ... Need TO DO

--Need  to update to current APIAccountNo *** Need to add in where the apiaccountno not like '-' because if they
-- changed PMID by the time these are done it may pick up the -BIA in the PM_APIAccounts table.
--
--UPDATE Reports..import_RebateGenericIncentive   set apiaccountno = 
--	(select apiaccountno from  pharmacymaster..pm_pharmacy where pmid =  Reports..import_RebateGenericIncentive.pmid 
--     and apiaccountno  not like '%-%') where year = @in_year 

--UPDATE su set apiaccountno = ch.apiaccountno
--   FROM Reports..import_RebateGenericIncentive  su 
--	inner join 
--		(select apiaccountno,pmid from  PharmacyMaster..pm_pharmacy where apiaccountno  not like '%-%') ch
--   on su.pmid = ch.pmid and year = @in_year 

--UPDATE t set 
--        TotalGenerics = v.TotalGenerics,
--        GenericIncentive = v.[Generic Incentive]
--	    FROM   pharmacymaster..PM_AnnualRebates t 
--			inner join 
--			 (  
--              	SELECT   pmid ,SUM([Elig Generics for Rebate]) as TotalGenerics ,sum ([Net Generic Loyalty Rebate]) as [Generic Incentive] from reports..import_GenIncentive2014   -- CHANGE table
--        GROUP BY   pmid
--			) v 
--		   on t.pmid =v.pmid  where year = @in_year
-- 
--
----INSERT PM_AnnualRebates where PMID does not already exist
-- INSERT  into pharmacymaster..PM_AnnualRebates (Year,PMID,TM, AccountName,BusClass, TotalGenerics ,GenericIncentive )   
--
--      SELECT @in_year ,PMID, Territory, accountname,BusinessClass,TotalGenerics,GenericIncentive FROM (    -- CHANGE DATES
--			SELECT  a.pmid, p.territory, p.accountname,p.BusinessClass, SUM([Elig Generics for Rebate]) as TotalGenerics,sum ([Net Generic Loyalty Rebate]) as GenericIncentive
--				 FROM   reports..import_GenIncentive2014  a  -- CHANGE table
--					join pharmacymaster..pm_pharmacy p on a.pmid = p.pmid
--				 
--				 GROUP BY  a.pmid,p.Territory, p.accountname,BusinessClass
--
--            )vol
--	 WHERE not exists  (select pmid from pharmacymaster..PM_AnnualRebates where pmid = vol.pmid and   year= @in_year  ); 
--
--
--
----	---SET any NULLS TO ZERO and DO totals
----    
----	UPDATE pharmacymaster..PM_AnnualRebates set PlanOGramRebate = 0.00 where PlanOGramRebate is null;
----	UPDATE pharmacymaster..PM_AnnualRebates set PatronageDividend = 0.00 where PatronageDividend is null;
----	UPDATE pharmacymaster..PM_AnnualRebates set GenericIncentive = 0.00 where GenericIncentive is null;
----	UPDATE pharmacymaster..PM_AnnualRebates set PatDivFirstPayment = 0.00 where PatDivFirstPayment is null;
----	UPDATE pharmacymaster..PM_AnnualRebates set PatDivSecondPayment = 0.00 where PatDivSecondPayment is null;
----
----    UPDATE pharmacymaster..PM_AnnualRebates set [3MRebate] = 0.00 where [3MRebate] is null;
----	UPDATE pharmacymaster..PM_AnnualRebates set POGRebate = 0.00 where POGRebate is null;
----	UPDATE pharmacymaster..PM_AnnualRebates set MasonRebate = 0.00 where MasonRebate is null;
----    UPDATE pharmacymaster..PM_AnnualRebates set TotalGenerics = 0.00 where TotalGenerics is null;
----    UPDATE PM_AnnualRebates set GenericIncentiveFirstPayment = 0  where GenericIncentiveFirstPayment is null
----    UPDATE PM_AnnualRebates set GenericIncentiveSecondPayment = 0 where GenericIncentiveSecondPayment is null
--
----May need to update API numbers
----update a set 
---- a.apiaccountno = p.apiaccountno 
---- FROM   pharmacymaster..PM_AnnualRebates  a
----join
----(
----select * from pharmacymaster..pm_pharmacy 
----) p on a.pmid = p.pmid 
----where year = 2014   and a.apiaccountno is null
END









GO
