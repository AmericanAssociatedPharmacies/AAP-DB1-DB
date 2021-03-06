USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_QA_Queries]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <12/10/2014>
-- Description:	Price Protection QA Queries
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_QA_Queries]
 

AS
BEGIN

-- These queries can be used to determine where the differences are and how to determine who is in error - Cardinal
-- or you


-- To see where we're off on the Price Protection due to date - good place to start
-- To determine differences.  The tmp_PPCompare is the final table created that is compared to
-- the values in the PharmacyMaster..CA_PriceProtection table (file from Cardinal)

 SELECT * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate 
order by NDC 
 
 SELECT * from tmp_PPCompare where customer_no = '350249'
and ndc = '51672129503'

  select * from tmp_PPhighDEC  where customer_no = '350249'
and ndc = '51672129503'
  select * from tmp_PPlowDEC where customer_no = '350249'
and ndc = '51672129503'

  select * from tmp_PPhighInc where customer_no = '350249'
and ndc = '51672129503'
  select * from tmp_PPlowDEC where customer_no = '350249'
and ndc = '51672129503'
  select * from tmp_PPlowInc where customer_no = '350249'
and ndc = '51672129503'
-- Use this to find the ones where the PriceProtectionDueToDate is not equal and the prior 3 months are
-- not equal. This can be helpful in finding cause of difference.  It is a good rule of thumb to look
-- at all the values in the tmp_PPCompare file to see which are different. You can also looks at the Comments
-- column to see what was different

 SELECT * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  
 and aapprev3monthusage != caprev3monthusage

 SELECT * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  
 and aapavgmonthusage != caavgmonthusage and aapprev3monthusage = caprev3monthusage

-- To find those I pulled as valid but Cardinal is not including  
-- CHANGE DATE

SELECT *  from tmp_PPCompare  t
left outer join
(
	SELECT * from  pharmacymaster..ca_priceprotection where date = '07/01/2015'
)c
on c.ndc = t.ndc and c.customernumber = t.customer_no and 
c.unitselldlr = t.aapunitcost
 where customernumber is null 
 
-- To find those Cardinal pulled as valid but I did not include - at this point it might be because I applied
-- a return to an incorrect purchase - until we get the order number in there there is no way to tell which
-- one it actually should be applied against.  If you determine this is the issue just move on and realize the
-- error is yours
-- CHANGE DATE

SELECT * from  pharmacymaster..ca_priceprotection   c
left outer join
(
	SELECT * from  tmp_PPCompare
)t
on c.ndc = t.ndc and c.customernumber = t.customer_no and 
c.unitselldlr = t.aapunitcost
 where customer_no is null and  date = '06/01/2015'
and priceprotectionduetodate > 0


 
-- Use this to find the Effect Dte.  You need to pull current month and previous months - even though we only pull
-- current months purchases we need to pull prior months NDCs because we need to include the NDC's where the Effect Dte
-- starts OR ends on the current month
-- CHANGE NDC

 SELECT *  from claims..cahcontract  
where month([Effect Dte]) in (10,11) and year([Effect Dte]) = 2014
and ndc  = '00406012501' order by [Effect Dte] 

-- Use this to verify the prior 3 months purchases you pulled - the prior 3 months will be the prior 3 months from the 
-- Effect Dte of the NDC price change.  For example if the Effect date is November the prior 3 months are August, September
-- and October.  The prior 3 months are used to determine how many units they can apply to the current 
-- months purchases for Price Protection
-- CHANGE DATE, Customer_No, NDC 

SELECT   * FROM purchases..chph_aap where month(inv_date) in (8,9,10) and year(inv_date) = 2014
and customer_no = '722687' and ndc = '00406012501'

-- Use this to verify the current months purchases. This is the purchases pulled into tmpPPPurchases - they are then
-- filtered down to purchases used for Price Protection based on certain rules.  Here you just want to verify that you
-- pulled all the purchases for the particular customer no./ ndc 
-- CHANGE DATE, Customer_No, NDC 

SELECT   * FROM purchases..chph_aap where  month(inv_date) = 11 and year(inv_date) = 2014
and customer_no = '722687' and ndc = '00406012501' and ship_qty != 0  

-- There are 3 files created for the purchases.  
-- The first is tmp_PPPurchases this pulls in all purchases that have the NDC's that are eligible for the 
-- Price Protection (>= 20% increase)
-- The second is tmp_PPPurchasesVerified. This will contain purchases from the tmp_PPPurchases where the invoice
-- date is >= the Effect Dte of NDC and <= 30 days from the Effect Dte of NDC. It also pulls in any purchases made
-- when there was a price decrease that occurred within the time frame of the price increase - the purchase must have
-- been made after (or on)  the Effect Date of the price decrease and before 30 days from Effect Date of price increase.
-- It also pulls in the returns.
-- The third is tmp_PPPurchases valid.  This will pull in all purchases from tmp_PPPurchasesVerified and filter out
-- the purchases did not have any 3 months prior history.  It bases the 3 months prior on the 3 months prior 
-- to the Effect Dte of the price increase.
-- These tables are good in determining if you are missing a purchase in the final results - which step is in error.

select * from tmp_PPPurchasesVerified where customer_no = '482492' and ndc = '00555904558' --1/16  1/27
select * from tmp_PPPurchasesValid where customer_no = '482492' and ndc = '00555904558'

SELECT   * FROM purchases..chph_aap where  month(inv_date) = 01 and year(inv_date) = 2015
and customer_no = '482492' and ndc = '00603389032' and ship_qty != 0  --1/23 


SELECT   * FROM purchases..chph_aap where month(inv_date) in (1) and year(inv_date) = 2015
and customer_no = '481655'
 and ndc = '65162064210'
 select * from tmp_PPPurchasesValid where customer_no = '623152' and ndc = '00555904558'

select * from tmp_PPPurchases3MoPrior where customer_no = '623152' and ndc = '53746011001' --10/27

 SELECT *  from claims..cahcontract  
where  ((month([Effect Dte]) in (12) and year([Effect Dte]) = 2014) or
(month([Effect Dte]) in (01) and year([Effect Dte]) = 2015))
and ndc  = '53746011001' order by [Effect Dte]  --12/10/2014


 SELECT *  from PharmacyMaster..CASourceContractMO 
where  ((month([EffectDte]) in (06) and year([EffectDte]) = 2015) or
(month([EffectDte]) in (07) and year([EffectDte]) = 2015))
and ndc  = '51672129503' order by [EffectDte]  -- 12/09  278.52 486.48
 
-- 12/10/14 89.56 152.35
-- 1/16/2015 152.35 204.22

SELECT   * FROM purchases..chph_aap where month(inv_date) in (10,11,12) and year(inv_date) = 2014
and customer_no = '065841' and ndc = '65162055310' 


SELECT   * FROM purchases..chph_aap where month(inv_date) in (01) and year(inv_date) = 2015
and customer_no = '069669' and ndc = '00603389128'  --1/8
select * from tmp_PPPurchases3MoPrior where customer_no = '069669' and ndc = '00603389128' 
--For Janusry --1/8,23,27,30 qty 5
-- the one from 1/8 was 

select * from tmp_PPPurchasesVerified where customer_no = '313995' and ndc = '65162055310'   
 select * from tmp_PPPurchasesValid where customer_no = '313995' and ndc = '65162055310' 
select * from tmp_PPPurchases3MoPrior where customer_no = '069669' and ndc = '00603389128' 

 SELECT *  from PharmacyMaster..CASourceContractMO 
where  ((month([EffectDte]) in (12) and year([EffectDte]) = 2014) or
(month([EffectDte]) in (01) and year([EffectDte]) = 2015))
and ndc  = '53746011001' order by [EffectDte]  -- 1/12  17.49 to 170.94

 select * from tmp_PPPurchasesValid where customer_no = '069669' and ndc = '00603389128'
  
 SELECT * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  
 and aapprev3monthusage = caprev3monthusage

 SELECT * from tmp_PPCompare  where  customer_no = '631683' and ndc = '00603389032' 
select * from tmp_PPPurchases3MoPrior where customer_no = '631683' and ndc = '00603389032'  

 SELECT * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  
 and aapprev3monthusage != caprev3monthusage

SELECT * from  pharmacymaster..ca_priceprotection   c
left outer join
(
	SELECT * from  tmp_PPCompare
)t
on c.ndc = t.ndc and c.customernumber = t.customer_no and 
c.unitselldlr = t.aapunitcost
 where customer_no is null and  date = '01/01/2015' and c.ndc!= '53746011001'
and actualusagetodate > 0

SELECT   * FROM purchases..chph_aap where month(inv_date) in (01) and year(inv_date) = 2015
and customer_no = '483249' and ndc = '53746011001'  --1/30
select * from tmp_PPPurchases3MoPrior where customer_no = '483249' and ndc = '00406012501' 

	SELECT * from  pharmacymaster..ca_priceprotection where date = '07/01/2015'
 and customernumber = '690137'
and ndc = '51672129503'
--The ndc = '53746011001' was one of the old ones - now it's back???
---- select * from tmp_PPPurchases where ndc = '53746011001'
---- select * from tmp_PPPurchases where ndc = '00406012501' and customer_no = '483249' 
SELECT * from  pharmacymaster..ca_priceprotection   c
left outer join
(
	SELECT * from  tmp_PPCompare
)t
on c.ndc = t.ndc and c.customernumber = t.customer_no and 
c.unitselldlr = t.aapunitcost
 where customer_no is null and  date = '01/01/2015' and c.ndc!= '53746011001'
and actualusagetodate > 0

 select * from tmp_PPPurchases where ndc = '51672130302' and customer_no = '067698' 
 select * from tmp_PPPurchasesverified where ndc = '00406012501' and customer_no = '214899' 
 select * from tmp_PPPurchasesvalid where ndc = '00555904558' and customer_no = '214899' 
select * from tmp_PPPurchases3MoPrior where customer_no = '214899' and ndc = '00555904558' 

select * from tmp_PPPurchases3MoPrior where ndc = '00406012501'
select * from tmp_PPPurchasesvalid where ndc = '00406012501'
select * from tmp_PPPurchases  where ndc = '00406012501'
 select * from tmp_PPCompareall where ndc = '00406012501' and customer_no = '465771' 

 select * from tmp_PPCompare where ndc = '00406012501' and customer_no = '465771' 

  SELECT *  from PharmacyMaster..CASourceContractMO 
where  ((month([EffectDte]) in (12) and year([EffectDte]) = 2014) or
(month([EffectDte]) in (01) and year([EffectDte]) = 2015))
and ndc  = '53746011001' order by [EffectDte]  -- 1/27

select * from pharmacymaster..pm_pharmacy where pmid = 102478
select * from pharmacymaster..pm_addressmaster where pmid = 102478 
select * from pharmacymaster..pm_groups_xref where pmid = 102478 
select * from pharmacymaster..pm_groups where group_id = 54 

-- Had a problem where I was missing data for 2 days - to find I loaded
-- the pivoted file from Joshua - tmpLoadOrigOctPP
-- and the QA file I generate (tab that says where Joshua had data and I didn't - tmpOctPurchases
--and I ran the query below to look at what days were populated


--select * from tmpLoadOrigOctPP t 
--join
--(
--select * from tmpOctPurchases
--)p
--on t.ndc = p.ndc and p.customerNumber = t.[Customer Number] and
--p.protectedselPrice = t.[old sell]

--  To find where there are multiple increases

  select t.*
from PharmacyMaster..CASourceContractMO  t
inner join 
(
    select ndc
    from   PharmacyMaster..CASourceContractMO 
where  month([EffectDte]) in (04,05) and year([EffectDte]) = 2016 
and [20Percent] is not null and [20Percent] = 'Yes' 
    group by ndc
    having count(*) > 1
) d on t.ndc = d.ndc
where  month(t.[EffectDte]) in (04,05) and year(t.[EffectDte]) = 2016 
and t.[20Percent] is not null and t.[20Percent] = 'Yes'


--Because I go back 4 months to get all priors (Effective date could be in previous month)
-- I need to look at only those 3 months that were prior to Effective Date of NDC 68180035106
select * from tmp_PPPurchases3MoPrior where customer_no = '676539' and ndc = '68180035106' 
and month(inv_date) != 04

-- Doing August so only look at August purchases

select * from tmp_PPPurchasesValid where customer_no = '676539' and ndc = '68180035106' 


-- We are doing August so need to look in July and August NDC 

 SELECT *  from PharmacyMaster..CASourceContractMO 
where  month([EffectDte]) in (07,08) and year([EffectDte]) = 2016 
and ndc  = '68180035106' order by [EffectDte] -- 8/11/2016

-- Need to look at 05,06,07 2016 for 3 months prior

select * from purchases..chph_aap where customer_no = '676539'  and 
ndc = '68180035106' and month(inv_date) in (05,06,07) and 
year(inv_date) = 2016

--Because I go back 4 months to get all priors (Effective date could be in previous month)
-- I need to look at only those 3 months that were prior to Effective Date of NDC 68180035106
select * from tmp_PPPurchases3MoPrior where customer_no = '676539' and ndc = '68180035106' 
and month(inv_date) != 04


END










GO
