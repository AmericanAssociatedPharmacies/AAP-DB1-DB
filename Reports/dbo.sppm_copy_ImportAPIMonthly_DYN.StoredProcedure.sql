USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_copy_ImportAPIMonthly_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/28/2011>
-- Description:	Create table from import to production for API WH Quarterly rebates
-- =============================================
CREATE PROCEDURE [dbo].[sppm_copy_ImportAPIMonthly_DYN]
(@date varchar(10))
 
AS
BEGIN

	/*All SQL code commented out. All table loads are done thru SSIS package at this location: \\DB1\c$\SSIS\SSIS_LoadAPIMonthlyRebates\SSIS_LoadAPIMonthlyRebates.dtsx
	The previous version of the SSIS package is in the same locatio just renamed.
	*/

	RETURN
 
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
 
---- There are 2 situations we have to be careful of here.  One is where there are 2 different account no's with the same PMID.  In this 
---- case we roll up by PMID and then update the APIAccount No with the current PMID from PM_Pharamcy.  The other situation is where you 
---- have two different PMID's but the APIAccount stayed the same - in this case the old PMID will have the APIAccountNo with a -BIA
---- on it. When the update occurs at the end of this stored proc we want to make sure we do not update with -BIA account.  The file we 
---- get from API will have the correct API #.  The problem occurs because of the long time frame from when we get the API rebates.  In that
---- time frame a new PMID could be issued and if the APIAccount No. stays the same they will put a -BIA on the end in PM_Pharmacy.
 
--	--------USE THIS TO UPDATE blank PMIDs in the import table before load to production

--		UPDATE  i  set 
--			pmid = a.pmid  
--	    FROM import_APIMonthlyRebates    i 
--		inner join 
--		(
--			select a1.pmid,i1.apiaccountno from import_APIMonthlyRebates  i1
--			join
--			(
--			   select *    from pharmacymaster..PM_Pharmacy where apiaccountno not like '%-%'
--			) a1 on i1.apiaccountno = a1.apiaccountno where (i1.pmid is null or i1.pmid = '')  and  i1.date = @date
--        ) a
--	    on i.apiaccountno = a.apiaccountno   where i.date = @date


--		UPDATE  i  set 
--			pmid = a.pmid  
--	    FROM import_APIMonthlyRebates    i 
--		inner join 
--		(
--			select a1.pmid,i1.apiaccountno from import_APIMonthlyRebates  i1
--			join
--			(
--			   select *    from pharmacymaster..PM_APIAccounts where apiaccountno not like '%-%'
--			) a1 on i1.apiaccountno = a1.apiaccountno where (i1.pmid is null or i1.pmid = '')  and  i1.date = @date
--        ) a
--	    on i.apiaccountno = a.apiaccountno   where i.date = @date

--	INSERT into PharmacyMaster..PM_Rebates_APIMonthly (
--			[Date],
--			[PMID],
--			[APIAccountNo],
--			[Pharmacy Name],
--			[Business Class],
--			[Rebate Administrator],
--			[API Generic Sales],
--			[API Brand Sales],
--			[API OTC Sales],
--			[API Total Whse Sales],
--			[API Whse Gross Rebate],
--			[Adjust for Promotions],
--			[Adjust for Returns],
--			[Adjust for Rebate Errors],
--			[Generic Admin Fee],
--			[API WHSE REBATE for Payout],
--			[Less Negative Rebates],
--			[Unpaid Finance Charges],
--			[Check Fee],
--			[Held Rebate],
--			[Rebate to Pay Acct/Admin],
--			[Less Group Admin],
--			[Net Rebate to Store],
--			[Pay Account],
--			[Print Rebate Letter],
--			[Brand Credits Disbursed],
--			[Accelerated Pay Discount],
--			[Avg Rebate Percentage],
--			[A/P Payment Mode],
--			[Previous Month Held Rebate] ,
--            [PostAveRebatePerc],
--			[True10Sales],
--            [True10Rebate],
--            [AreteRebateFee],
--			[APIInstantRebate],
--			[CalcAPIRebatePercentage])
--		SELECT @date, 
--            [PMID],
--            max([APIAccountNo]),
--			max([Pharmacy Name]),
--			max([Business Class]),
--			max([Rebate Administrator]),
--			sum([API Generic Sales]),
--			sum([API Brand Sales]),
--			sum([API OTC Sales]),
--			sum([API Total Whse Sales]),
--			sum([API Whse Gross Rebate]),
--			sum([Adjust for Promotions]),
--			sum([Adjust for Returns]),
--			sum([Adjust for Rebate Errors]),
--			sum([Generic Admin Fee]),
--			sum([API WHSE REBATE for Payout]),
--			sum([Less Negative Rebates]),
--			sum([Unpaid Finance Charges]),
--			max([Check Fee]),
--			sum([Held Rebate]),
--			sum([Rebate to Pay Acct/Admin]),
--			sum([Less Group Admin]),
--			sum([Net Rebate to Store]),
--			max(convert(int,[Pay Account])),  
--            max(convert(int,[Print Rebate Letter])),
--			sum([Brand Credits Disbursed]),
--			sum([Accelerated Pay Discount]),
----			case when sum([API Generic Sales]) != 0 then sum([API WHSE REBATE for Payout])/sum([API Generic Sales]) else 0 end as [Avg Rebate Percentage],
--			case when sum([API Generic Sales]) != 0 then sum([Net Rebate To store])/sum([API Generic Sales]) else 0 end as [Avg Rebate Percentage],

--			max([A/P Payment Mode]),
--			sum([Previous Month Held Rebate] ),
--            max([PostAveRebatePerc]),
--			sum([True10Sales]),
--            sum([True10Rebate]),
--			sum([AreteRebateFee]),
--			sum(InstantRebate),
--			IIF(SUM([API Generic Sales]) IS NULL OR SUM([API Generic Sales]) = 0, 0, ((SUM([Net Rebate to Store]) + SUM(InstantRebate)) / SUM([API Generic Sales])))
--			 FROM import_APIMonthlyRebates where pmid != '' and pmid != 'NON' and date = @date group by PMID ,date


----From Dianna for the Past Ave Rebate Perc is Net Rebate/Generic Sales

----TODO Uncomment after testing
----Contact TM
--UPDATE PharmacyMaster.. PM_Rebates_APIMonthly set [PostAveRebatePerc] = [Avg Rebate Percentage] where 
--[PostAveRebatePerc] != 'Contact TM'  and date = @date

----or [PostAveRebatePerc] is null 

---- Don't know if I want to go back and recalc all or not - want to think about it 
---- Here is what I was working on to do:

----update PM_Rebates_APIMonthly_bkp set [Avg Rebate Percentage] = case when   [API Generic Sales] != 0 then [Net Rebate To store]/[API Generic Sales] 
---- else 0 end  
----
----update PM_Rebates_APIMonthly_bkp set [PostAveRebatePerc] = [Avg Rebate Percentage] where 
----[PostAveRebatePerc] != 'Contact TM' or [PostAveRebatePerc] is null
----
----select PMID,[Avg Rebate Percentage],[PostAveRebatePerc]  from PM_Rebates_APIMonthly_bkp 
----order by PMID,date
----
----select PMID,[Avg Rebate Percentage],[PostAveRebatePerc]  from PharmacyMaster..PM_Rebates_APIMonthly
----order by PMID,date



--UPDATE PharmacyMaster..PM_Rebates_APIMonthly set [Check Fee] = 0 where [Check Fee] is null;
--UPDATE PharmacyMaster..PM_Rebates_APIMonthly set [Held Rebate] = 0 where [Held Rebate] is null;
--UPDATE PharmacyMaster..PM_Rebates_APIMonthly set[Previous Month Held Rebate] = 0 where [Previous Month Held Rebate] is null;
--UPDATE PharmacyMaster..PM_Rebates_APIMonthly set [True10Sales] = 0 where [True10Sales] is null;
--UPDATE PharmacyMaster..PM_Rebates_APIMonthly set [True10Rebate] = 0 where [True10Rebate] is null;
--UPDATE PharmacyMaster..PM_Rebates_APIMonthly set [AreteRebateFee] = 0 where [AreteRebateFee] is null;
--UPDATE PharmacyMaster..PM_Rebates_APIMonthly set [APIInstantRebate] = 0 where [APIInstantRebate] is null;

----Need  to update to current APIAccountNo *** Need to add in where the apiaccountno not like '-' because if they
---- changed PMID by the time these are done it may pick up the -BIA in the PM_APIAccounts table.
----DO NOT DO THIS WAY!!!
----UPDATE PharmacyMaster..PM_Rebates_APIMonthly   set apiaccountno = 
----	(select apiaccountno from  pharmacymaster..pm_pharmacy where pmid =  PharmacyMaster..PM_Rebates_APIMonthly.pmid 
----     and apiaccountno  not like '%-%') where date = @date

--UPDATE su set apiaccountno = ch.apiaccountno
--   FROM PharmacyMaster..PM_Rebates_APIMonthly  su 
--	inner join 
--		(select apiaccountno,pmid from  PharmacyMaster..pm_pharmacy where apiaccountno  not like '%-%') ch
--   on su.pmid = ch.pmid and date = @date

--UPDATE  PharmacyMaster..PM_Rebates_APIMonthly  set postaverebateperc = 'Contact TM' where  date = @date and postaverebateperc is null 

----BELOW IS CODE TO ADD DATA FROM ONE PMID TO ANOTHER - IT IS NOT AUTOMATED YET - OF COURSE YOULL CHANGE THE DATES AND PMIDs

----
------[APIAccountNo]
---- update PM_Rebates_APIMonthly  set [APIAccountNo] = ( select [APIAccountNo] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
------[Pharmacy Name]
---- update PM_Rebates_APIMonthly  set [Pharmacy Name] = ( select [Pharmacy Name] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[API Generic Sales]
----
---- update PM_Rebates_APIMonthly  set [API Generic Sales] = [API Generic Sales] + ( select [API Generic Sales] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[API Brand Sales]
----
---- update PM_Rebates_APIMonthly  set [API Brand Sales] =[API Brand Sales] + ( select[API Brand Sales] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[API OTC Sales]
---- update PM_Rebates_APIMonthly  set [API OTC Sales] = [API OTC Sales] + ( select [API OTC Sales] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[API Total Whse Sales]
---- update PM_Rebates_APIMonthly  set [API Total Whse Sales] =[API Total Whse Sales]+ ( select [API Total Whse Sales] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[API Whse Gross Rebate]
---- update PM_Rebates_APIMonthly  set [API Whse Gross Rebate] = [API Whse Gross Rebate] + ( select[API Whse Gross Rebate] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Adjust for Promotions]
----
---- update PM_Rebates_APIMonthly  set [Adjust for Promotions] = [Adjust for Promotions] + ( select [Adjust for Promotions] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Adjust for Returns]
---- update PM_Rebates_APIMonthly  set [Adjust for Returns]= [Adjust for Returns] + ( select [Adjust for Returns] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Adjust for Rebate Errors]
---- update PM_Rebates_APIMonthly  set [Adjust for Rebate Errors]= [Adjust for Rebate Errors] + ( select [Adjust for Rebate Errors] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Generic Admin Fee]
---- update PM_Rebates_APIMonthly  set [Generic Admin Fee]= [Generic Admin Fee] + ( select [Generic Admin Fee] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[API WHSE REBATE for Payout]
---- update PM_Rebates_APIMonthly  set [API WHSE REBATE for Payout] = [API WHSE REBATE for Payout] + ( select [API WHSE REBATE for Payout]from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Less Negative Rebates]
---- update PM_Rebates_APIMonthly  set[Less Negative Rebates]=[Less Negative Rebates] + ( select[Less Negative Rebates]from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Unpaid Finance Charges]
---- update PM_Rebates_APIMonthly  set[Unpaid Finance Charges]=[Unpaid Finance Charges] + ( select[Unpaid Finance Charges]from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Check Fee]
---- update PM_Rebates_APIMonthly  set[Check Fee]=[Check Fee] + ( select[Check Fee]from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Held Rebate]
---- update PM_Rebates_APIMonthly  set[Held Rebate]=[Held Rebate] + ( select[Held Rebate]from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Rebate to Pay Acct/Admin]
---- update PM_Rebates_APIMonthly  set[Rebate to Pay Acct/Admin]= [Rebate to Pay Acct/Admin] + ( select [Rebate to Pay Acct/Admin] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Less Group Admin]
---- update PM_Rebates_APIMonthly  set [Less Group Admin] = [Less Group Admin] + ( select [Less Group Admin] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Net Rebate to Store]
---- update PM_Rebates_APIMonthly  set [Net Rebate to Store] = [Net Rebate to Store] + ( select [Net Rebate to Store] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Brand Credits Disbursed]
---- update PM_Rebates_APIMonthly  set[Brand Credits Disbursed] = [Brand Credits Disbursed] + ( select [Brand Credits Disbursed]  from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Accelerated Pay Discount]
----
---- update PM_Rebates_APIMonthly  set [Accelerated Pay Discount] = [Accelerated Pay Discount] + ( select [Accelerated Pay Discount] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------[Previous Month Held Rebate]
----
---- update PM_Rebates_APIMonthly  set [Previous Month Held Rebate] = [Previous Month Held Rebate] + ( select [Previous Month Held Rebate] from PM_Rebates_APIMonthly where
----pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
----pmid = 107984 and month(date) = 01 and year(date) = 2015
----
------DO this last --[Avg Rebate Percentage] calculate [API WHSE REBATE for Payout]/[API Generic Sales]
---- update PM_Rebates_APIMonthly  set [Avg Rebate Percentage] = [API WHSE REBATE for Payout]/[API Generic Sales] where
----pmid = 107984 and month(date) = 01 and year(date) = 2015

----AFTER   update delete bad one 
----Some you can just change the PMID if it wasn't split up in the month


----update PM_Rebates_APIMonthly set pmid = 107984 where 
----pmid = 108123  

END











GO
