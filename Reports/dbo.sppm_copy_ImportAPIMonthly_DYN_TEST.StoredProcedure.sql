USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_copy_ImportAPIMonthly_DYN_TEST]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/28/2011>
-- Description:	Create table from import to production for API WH Quarterly rebates
-- =============================================
CREATE PROCEDURE [dbo].[sppm_copy_ImportAPIMonthly_DYN_TEST]
(@date varchar(10))
 
AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
 
	--------USE THIS TO UPDATE PMIDs in the import table before load to production
		UPDATE  i  set 
			pmid = a.pmid  
	    FROM import_APIMonthlyRebatesTEST   i 
		inner join 
		(
			select a1.pmid,i1.apiaccountno from import_APIMonthlyRebatesTEST i1
			join
			(
			   select *    from pharmacymaster..PM_APIAccounts
			) a1 on i1.apiaccountno = a1.apiaccountno where (i1.pmid is null or i1.pmid = '')  and  i1.date = @date
        ) a
	    on i.apiaccountno = a.apiaccountno   where i.date = @date

	INSERT into PM_Rebates_APIMonthlyTEST (
			[Date],
			[PMID],
			[APIAccountNo],
			[Pharmacy Name],
			[Business Class],
			[Rebate Administrator],
			[API Generic Sales],
			[API Brand Sales],
			[API OTC Sales],
			[API Total Whse Sales],
			[API Whse Gross Rebate],
			[Adjust for Promotions],
			[Adjust for Returns],
			[Adjust for Rebate Errors],
			[Generic Admin Fee],
			[API WHSE REBATE for Payout],
			[Less Negative Rebates],
			[Unpaid Finance Charges],
			[Check Fee],
			[Held Rebate],
			[Rebate to Pay Acct/Admin],
			[Less Group Admin],
			[Net Rebate to Store],
			[Pay Account],
			[Print Rebate Letter],
			[Brand Credits Disbursed],
			[Accelerated Pay Discount],
			[Avg Rebate Percentage],
			[A/P Payment Mode],
			[Previous Month Held Rebate]) 
		SELECT @date, 
            [PMID],
            max([APIAccountNo]),
			max([Pharmacy Name]),
			max([Business Class]),
			max([Rebate Administrator]),
			sum([API Generic Sales]),
			sum([API Brand Sales]),
			sum([API OTC Sales]),
			sum([API Total Whse Sales]),
			sum([API Whse Gross Rebate]),
			sum([Adjust for Promotions]),
			sum([Adjust for Returns]),
			sum([Adjust for Rebate Errors]),
			sum([Generic Admin Fee]),
			sum([API WHSE REBATE for Payout]),
			sum([Less Negative Rebates]),
			sum([Unpaid Finance Charges]),
			max([Check Fee]),
			sum([Held Rebate]),
			sum([Rebate to Pay Acct/Admin]),
			sum([Less Group Admin]),
			sum([Net Rebate to Store]),
			max(convert(int,[Pay Account])),  
            max(convert(int,[Print Rebate Letter])),
			sum([Brand Credits Disbursed]),
			sum([Accelerated Pay Discount]),
			case when sum([API Generic Sales]) != 0 then sum([API WHSE REBATE for Payout])/sum([API Generic Sales]) else 0 end as [Avg Rebate Percentage],
			max([A/P Payment Mode]),
			sum([Previous Month Held Rebate] )
			 FROM import_APIMonthlyRebatesTEST where pmid != '' and pmid != 'NON' and date = @date group by PMID ,date

UPDATE  PM_Rebates_APIMonthlyTEST set [Check Fee] = 0 where [Check Fee] is null;
UPDATE  PM_Rebates_APIMonthlyTEST set [Held Rebate] = 0 where [Held Rebate] is null;
UPDATE  PM_Rebates_APIMonthlyTEST set[Previous Month Held Rebate] = 0 where [Previous Month Held Rebate] is null;


--BELOW IS CODE TO ADD DATA FROM ONE PMID TO ANOTHER - IT IS NOT AUTOMATED YET - OF COURSE YOULL CHANGE THE DATES AND PMIDs

--
----[APIAccountNo]
-- update PM_Rebates_APIMonthly  set [APIAccountNo] = ( select [APIAccountNo] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
----[Pharmacy Name]
-- update PM_Rebates_APIMonthly  set [Pharmacy Name] = ( select [Pharmacy Name] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[API Generic Sales]
--
-- update PM_Rebates_APIMonthly  set [API Generic Sales] = [API Generic Sales] + ( select [API Generic Sales] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[API Brand Sales]
--
-- update PM_Rebates_APIMonthly  set [API Brand Sales] =[API Brand Sales] + ( select[API Brand Sales] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[API OTC Sales]
-- update PM_Rebates_APIMonthly  set [API OTC Sales] = [API OTC Sales] + ( select [API OTC Sales] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[API Total Whse Sales]
-- update PM_Rebates_APIMonthly  set [API Total Whse Sales] =[API Total Whse Sales]+ ( select [API Total Whse Sales] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[API Whse Gross Rebate]
-- update PM_Rebates_APIMonthly  set [API Whse Gross Rebate] = [API Whse Gross Rebate] + ( select[API Whse Gross Rebate] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Adjust for Promotions]
--
-- update PM_Rebates_APIMonthly  set [Adjust for Promotions] = [Adjust for Promotions] + ( select [Adjust for Promotions] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Adjust for Returns]
-- update PM_Rebates_APIMonthly  set [Adjust for Returns]= [Adjust for Returns] + ( select [Adjust for Returns] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Adjust for Rebate Errors]
-- update PM_Rebates_APIMonthly  set [Adjust for Rebate Errors]= [Adjust for Rebate Errors] + ( select [Adjust for Rebate Errors] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Generic Admin Fee]
-- update PM_Rebates_APIMonthly  set [Generic Admin Fee]= [Generic Admin Fee] + ( select [Generic Admin Fee] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[API WHSE REBATE for Payout]
-- update PM_Rebates_APIMonthly  set [API WHSE REBATE for Payout] = [API WHSE REBATE for Payout] + ( select [API WHSE REBATE for Payout]from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Less Negative Rebates]
-- update PM_Rebates_APIMonthly  set[Less Negative Rebates]=[Less Negative Rebates] + ( select[Less Negative Rebates]from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Unpaid Finance Charges]
-- update PM_Rebates_APIMonthly  set[Unpaid Finance Charges]=[Unpaid Finance Charges] + ( select[Unpaid Finance Charges]from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Check Fee]
-- update PM_Rebates_APIMonthly  set[Check Fee]=[Check Fee] + ( select[Check Fee]from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Held Rebate]
-- update PM_Rebates_APIMonthly  set[Held Rebate]=[Held Rebate] + ( select[Held Rebate]from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Rebate to Pay Acct/Admin]
-- update PM_Rebates_APIMonthly  set[Rebate to Pay Acct/Admin]= [Rebate to Pay Acct/Admin] + ( select [Rebate to Pay Acct/Admin] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Less Group Admin]
-- update PM_Rebates_APIMonthly  set [Less Group Admin] = [Less Group Admin] + ( select [Less Group Admin] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Net Rebate to Store]
-- update PM_Rebates_APIMonthly  set [Net Rebate to Store] = [Net Rebate to Store] + ( select [Net Rebate to Store] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Brand Credits Disbursed]
-- update PM_Rebates_APIMonthly  set[Brand Credits Disbursed] = [Brand Credits Disbursed] + ( select [Brand Credits Disbursed]  from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Accelerated Pay Discount]
--
-- update PM_Rebates_APIMonthly  set [Accelerated Pay Discount] = [Accelerated Pay Discount] + ( select [Accelerated Pay Discount] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----[Previous Month Held Rebate]
--
-- update PM_Rebates_APIMonthly  set [Previous Month Held Rebate] = [Previous Month Held Rebate] + ( select [Previous Month Held Rebate] from PM_Rebates_APIMonthly where
--pmid = 108123 and month(date) = 01 and year(date) = 2015) where 
--pmid = 107984 and month(date) = 01 and year(date) = 2015
--
----DO this last --[Avg Rebate Percentage] calculate [API WHSE REBATE for Payout]/[API Generic Sales]
-- update PM_Rebates_APIMonthly  set [Avg Rebate Percentage] = [API WHSE REBATE for Payout]/[API Generic Sales] where
--pmid = 107984 and month(date) = 01 and year(date) = 2015

--AFTER   update delete bad one 
--Some you can just change the PMID if it wasn't split up in the month


--update PM_Rebates_APIMonthly set pmid = 107984 where 
--pmid = 108123  

END








GO
