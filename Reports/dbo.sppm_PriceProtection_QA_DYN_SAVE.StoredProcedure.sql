USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_QA_DYN_SAVE]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/23/2014
-- Description:	QA Cardinal   Price Protection  
-- =============================================
Create PROCEDURE [dbo].[sppm_PriceProtection_QA_DYN_SAVE] 
	-- Add the parameters for the stored procedure here
@in_date as varchar(10)
 
AS
 

BEGIN

SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF

DECLARE @SQL varchar(max);
DECLARE @month varchar(2);
DECLARE @year varchar(4);
DECLARE @curr_months_prev varchar(max);  
DECLARE @curr_year_prev varchar(max); 
DECLARE @prev_month_prior varchar(max); 
 

SET @month = month(@in_date);
SET @year = year(@in_date);
SET @prev_month_prior = @month -1;
SET  @curr_year_prev = @year -1;
IF(@month = '01' or @month = '1')
	BEGIN
		SET @curr_months_prev = '12';
    END
 

-- Here (in the query below) the unit cost can be less than zero (returns) or 
-- invoice date >= Effective date of price increase and the invoice date is less than or equal 30 days from effective date of price increase
--      and the unit cost is greater than the old price (on the price increase) or
--      unit cost is greater than new price of any price decreases that occured after the price increase but before 30 days 
--       from the price increase effective date 
-- Below is another way to look at it - just to confuse more  8-)
-- Where the ((unit cost < 0 )or 
-- inv_date >= effective date and  (absolute value of unit cost is greater than old price -from NDC table - or the absolute value of unit cost > = 
-- the New Price of a Price Decrease where the effective date of the NDC - from NDC table - is > Effective Date of the Price Decrease and
-- the effective date of Price Decrease is less than 30 days added to the effective date in the NDC table )and
-- the invoice date of purchase is <= the effective date from NDC table + 30 days
--** Note the NDC table I refer to is the tmp_PPNDCUnion - the other effective date I refer to is the CASourceContractMO
--** where I get the Price Decrease
--** Note I do a union with same code by using min in one and max in the other.  To be honest I've never
--** seen any more in one part of the union than the other.  

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCompareAll')
		 BEGIN
          DROP TABLE tmp_PPCompareAll
         END
 
SELECT * INTO tmp_PPCompareAll from 
(
	SELECT  


	Customer_No,
	Customer_Name,
	NDC,
	cast (OldPrice as money) as AAPOldPrice ,
    cast (0 as money) as CAOldPrice,
	cast (NewPrice as money) as AAPNewPrice, 
    cast (0 as money) as CANewPrice,
    cast (unit_cost as money) as AAPUnitCost,
     cast (0 as money) as CAUnitCost,
	EffectDate as AAPEffectDate, 
    cast (null as datetime) as CAEffectDate,
	cast (0 as float) as AAPPrev3MonthUsage, 
    cast (0 as float) as CAPrev3MonthUsage,
	cast (0 as float) as AAPAvgMonthUsage,
    cast (0 as float) as  CAAvgMonthUsage,
	cast (ActualUsageToDate as float)   as AAPActualUsageToDate, 
    cast (0 as float) as CAActualUsageToDate,
	cast (0 as money) as AAPPriceProtectionDueToDate,
   cast (0 as money) as  CAPriceProtectionDueToDate ,
    cast (0 as float) as AAPPriorMonthUsage, 
    cast (0 as float) as CAPriorMonthUsage,
    cast (0 as float) as AAPUsageForCalculation, 
    cast (0 as float) as CAUsageForCalculation,
    cast ('' as varchar(max)) as AAPComment, 
    cast ('' as varchar(max)) as CAComment,
	cast ('' as varchar(10)) as IsMultiplePriceChange,cast ('' as varchar(10)) as AuditOK,
	cast ('' as varchar(max)) as AuditFailReason
	 FROM 
	(
      SELECT Customer_No, Customer_Name,NDC,OldPrice,NewPrice,  EffectDate,ActualUsageToDate,Unit_Cost from
		(

 	 SELECT p.Customer_No,p.Customer_Name,p.NDC,OldPrice,NewPrice,  EffectDate, 
				   sum(  ship_qty ) as ActualUsageToDate ,    abs(Unit_Cost) as Unit_Cost    from  tmp_pppurchasesvalid p
			join
			(
					 SELECT  [OldPrice] as OldPrice,  [NewPrice] as NewPrice, [EffectDte]  as EffectDate,NDC 
							from tmp_PPNDCUnion t where [EffectDte] = (select min([EffectDte]) from tmp_PPNDCUnion where t.ndc
							  = ndc)
						group by  NDC,[EffectDte] ,[OldPrice],  [NewPrice]  --order by ndc
						--order by ndc
			) t
			 on p.ndc = t.ndc where ((p.unit_cost < 0) or (p.inv_date >=  EffectDate     and ( abs(p.unit_cost) >  OldPrice 

or abs(p.unit_cost) >=  (SELECT distinct [NewPrice] from PharmacyMaster..CASourceContractMO where [ChangeType] = 'Price Decrease' 
  and t.ndc =ndc and  [EffectDte] > EffectDate and [EffectDte] < dateadd(day,30, EffectDate))) and 
p.inv_date <= dateadd(day,30, EffectDate) ))
  
			GROUP BY  p.Customer_No,p.Customer_Name,p.NDC,OldPrice,NewPrice,  EffectDate  , abs(unit_cost)
 
		UNION 

			SELECT p.Customer_No,p.Customer_Name,p.NDC,OldPrice,NewPrice,  EffectDate, 
				   sum(  ship_qty ) as ActualUsageToDate  ,abs(Unit_Cost) as Unit_Cost  from  tmp_pppurchasesvalid p
			join
			(
					 SELECT  [OldPrice] as OldPrice,  [NewPrice] as NewPrice,[EffectDte]  as EffectDate,NDC 
							from tmp_PPNDCUnion t where [EffectDte] = (select max([EffectDte]) from tmp_PPNDCUnion where t.ndc
							  = ndc)
						group by  NDC,[EffectDte] , [OldPrice] ,  [NewPrice]  --order by ndc
			) t
			 on p.ndc = t.ndc where ((p.unit_cost < 0) or (  p.inv_date >=  EffectDate  and p.inv_date >= (select max([EffectDte]) from tmp_PPNDCUnion where t.ndc
						    = ndc) and ( abs(p.unit_cost) >  oldprice   
                     or abs(p.unit_cost) >=  (SELECT [NewPrice] from PharmacyMaster..CASourceContractMO where [ChangeType] = 'Price Decrease' 
                    and t.ndc =ndc and  [EffectDte] > EffectDate and [EffectDte] < dateadd(day,30, EffectDate)))
                    and p.inv_date <= dateadd(day,30, EffectDate)))

			GROUP BY  p.Customer_No,p.Customer_Name,p.NDC,OldPrice,NewPrice,  EffectDate ,abs(unit_cost)

		)pt Group By Customer_No, Customer_Name,NDC,OldPrice,NewPrice,  EffectDate,ActualUsageToDate,Unit_Cost

)tt
)ca 


 
--Now roll up so it has the same aggregation as is used in the Cardinal file (that way we can correctly compare)
--**Note uses max Customer Name because one time Cardinal had a different name for the same account which
--of course threw off the aggregation.
--This uses abs value of unit cost so the returns will be aggregated up to the same level as any of the
--purchases counterpart.  It will sum the returns correctly with the purchases when I do the sum(AAPActualUsageToDate)
--It is possible that all the aggregation that needs to occur occurred in the population of tmp_PPCompareAll in above query

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCompare')
		 BEGIN
          DROP TABLE tmp_PPCompare
         END

SELECT * into tmp_PPCompare from (
SELECT 
Customer_No,max(Customer_Name)as Customer_Name ,NDC,AAPOldPrice,CAOldPrice,AAPNewPrice,CANewPrice,
case when AAPUnitCost!=0 then  AAPUnitCost end  as AAPUnitCost,CAUnitCost,

AAPEffectDate,CAEffectDate,AAPPrev3MonthUsage,CAPrev3MonthUsage,AAPAvgMonthUsage,CAAvgMonthUsage,
  sum(AAPActualUsageToDate) as AAPActualUsageToDate,
   CAActualUsageToDate,AAPPriceProtectionDueToDate,CAPriceProtectionDueToDate,
IsMultiplePriceChange,AuditOK,AuditFailReason,CAPriorMonthUsage,AAPPriorMonthUsage,
CAUsageForCalculation,CAComment,AAPComment,AAPUsageForCalculation
 
FROM
(
SELECT  
Customer_No,max(Customer_Name)as Customer_Name,NDC,AAPOldPrice,CAOldPrice,AAPNewPrice,CANewPrice,
 
 abs(AAPUnitCost)as AAPUnitCost,CAUnitCost,
AAPEffectDate,CAEffectDate,AAPPrev3MonthUsage,CAPrev3MonthUsage,AAPAvgMonthUsage,CAAvgMonthUsage,
  sum(AAPActualUsageToDate) as AAPActualUsageToDate,
   CAActualUsageToDate,AAPPriceProtectionDueToDate,CAPriceProtectionDueToDate,
IsMultiplePriceChange,AuditOK,AuditFailReason,CAPriorMonthUsage,AAPPriorMonthUsage,
CAUsageForCalculation,CAComment,AAPComment,AAPUsageForCalculation
from tmp_PPCompareAll
group by Customer_No,NDC,AAPOldPrice,CAOldPrice,AAPNewPrice,CANewPrice, CAUnitCost,
AAPEffectDate,CAEffectDate,AAPPrev3MonthUsage,CAPrev3MonthUsage,AAPAvgMonthUsage,CAAvgMonthUsage,
 CAActualUsageToDate,AAPPriceProtectionDueToDate,CAPriceProtectionDueToDate,
IsMultiplePriceChange,AuditOK,AuditFailReason,AAPUnitCost,CAPriorMonthUsage,AAPPriorMonthUsage,
CAUsageForCalculation,CAComment,AAPComment,AAPUsageForCalculation
)ch 
group by Customer_No,NDC,AAPOldPrice,CAOldPrice,AAPNewPrice,CANewPrice, CAUnitCost,
AAPEffectDate,CAEffectDate,AAPPrev3MonthUsage,CAPrev3MonthUsage,AAPAvgMonthUsage,CAAvgMonthUsage,
 CAActualUsageToDate,AAPPriceProtectionDueToDate,CAPriceProtectionDueToDate,
IsMultiplePriceChange,AuditOK,AuditFailReason ,AAPUnitCost,CAPriorMonthUsage,AAPPriorMonthUsage,
CAUsageForCalculation,CAComment,AAPComment,AAPUsageForCalculation
 
 
) pp
 




-- Now we're going to get the returns from this month that were purchased in the previous month -- NEW
--** Note this is different from the returns we included in the LoadFromCAforQA - there we included returns
-- where the purchases were made in the current month we are processing.  This includes returns that were returned
-- in the current month we are processing but the purchase was actually made in the prior month.
-- This just joins the tmp_PPPurchases (all of the current purchases)to the tmp_PPPurchasesPrior (prior month purchases)
-- pulling only the returns from the tmp_PPPurchases.  We use the tmp_PPPurchases instead of the tmp_PPPurchasesValid because
-- we don't care if it's a valid purchase as we are dealing only with a return.


IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPReturnsPrev')
		 BEGIN
          DROP TABLE tmp_PPReturnsPrev
         END

SET @SQL =  ' SELECT * into tmp_PPReturnsPrev from ( '+
	' SELECT t.* from tmp_PPPurchases t  '+
	' join '+
	' ( '+
	' 	SELECT * from tmp_PPPurchasesPrior  '+
	' ) p '+
	' on t.customer_no = p.customer_no and t.ndc = p.ndc  '+
	' 	and abs(t.unit_cost) = p.unit_cost and t.orderno = p.orderno '+
	' 	where t.type = ''R''  and  t.customer_no in '+
	' 		(SELECT customer_no from tmp_PPPurchasesValid where t.customer_no = customer_no '+
	' 		 and t.ndc = ndc ) and  t.customer_no in ( select customernumber from  '+
	' 		 pharmacymaster..ca_priceprotection  ';
   IF(@month = '1' or  @month = '01') -- Here the month we're dealing with is January so previous month is December of previous year
		BEGIN
			SET @SQL = @SQL +   ' where  month(date) = ' + @curr_months_prev + ' and year(date) = ' + @curr_year_prev ;
		END
   ELSE
        BEGIN
			SET @SQL = @SQL +   ' where  month(date) = ' + @prev_month_prior + ' and year(date) = ' + @year ;
		END
   SET @SQL =  @SQL +   ' and PriceProtectionDueToDate >0) ' +
   ' )pp ';

EXEC(@SQL);

-- Do the final update of AAPActualUsageToDate - deducting any returns made in current month but purchased in prior month
-- Here we're just adding the returns to the AAPActualUsageToDate in the tmp_PPCompare

UPDATE t 
	SET AAPActualUsageToDate = AAPActualUsageToDate + ship_qty
 from tmp_PPCompare t
join 
(
	SELECT sum(ship_qty) as ship_qty ,unit_cost, ndc,customer_no, customer_name from tmp_PPReturnsPrev group by  unit_cost ,
    ndc,customer_no, customer_name 
)p on  t.customer_no = p.customer_no
and t.ndc = p.ndc and t.aapunitcost = abs(p.unit_cost) 
--where AAPPriceProtectionDueToDate > 0

DELETE from	  tmp_PPCompare  where AAPActualUsageToDate <= 0
 
-- Use this to update fields in tmp_PPCompare with the data from Cardinals Price Protection File 
UPDATE t  set 
			Customer_No = CASE WHEN Customer_No is null then CustomerNumber else Customer_No end ,
			Customer_Name = CASE WHEN  Customer_Name is null then CustomerName else Customer_Name end,
            t.NDC = CASE WHEN  t.NDC is null then c.NDC else t.NDC end ,
            CAOldPrice = ProtectedSelPrice,
			CANewPrice = NewSellPrice,
			CAUnitCost = UnitSellDlr,
			CAEffectDate = ProtectionStartdate,
			CAPrev3MonthUsage = Prev3MonthUsage,
			CAAvgMonthUsage = AvgMonthlyUsage,
			CAActualUsageToDate =    ActualUsageToDate,
            CAPriceProtectionDueToDate =   PriceProtectionDueToDate,
			CAPriorMonthUsage = PriorMonthUsage,
            AAPPriorMonthUsage = PriorMonthUsage,
            CAUsageForCalculation = UsageForCalculation,
		     CAComment = Comment
			
	    FROM tmp_PPCompare   t
full join 
(
	  	SELECT CustomerNumber,	CustomerName,  ProtectedSelPrice ,	  NewSellPrice,UnitSellDlr,
				ProtectionStartdate ,  Prev3MonthUsage, AvgMonthlyUsage, sum(ActualUsageToDate ) as ActualUsageToDate,
				sum(PriceProtectionDueToDate ) as PriceProtectionDueToDate,NDC,PriorMonthUsage,UsageForCalculation,
                       Comment
			    from  pharmacymaster..ca_priceprotection where date = @in_date
               GROUP BY  CustomerNumber,	CustomerName,ProtectionStartdate ,  Prev3MonthUsage, 
                AvgMonthlyUsage,NDC,ProtectedSelPrice ,  NewSellPrice,UnitSellDlr,PriorMonthUsage,UsageForCalculation,
                       Comment
)c
on c.CustomerNumber = t.Customer_No and c.NDC = t.ndc and UnitSellDlr = aapunitcost and ProtectionStartdate = t.aapeffectdate

--------NEW CODE 05/09/2016


SET @SQL =  ' UPDATE t  set  '+
	' AAPPriorMonthUsage = UsageForCalculation  '+
    ' FROM tmp_PPCompare   t ' +
	' join '+
	' ( '+
	' 	SELECT CustomerNumber,	CustomerName, UnitSellDlr, '+
	'      ProtectionStartdate ,NDC,UsageForCalculation   '+
    ' 	 from  pharmacymaster..ca_priceprotection ';
 
   IF(@month = '1' or  @month = '01') -- Here the month we're dealing with is January so previous month is December of previous year
		BEGIN
			SET @SQL = @SQL +   ' where  month(date) = ' + @curr_months_prev + ' and year(date) = ' + @curr_year_prev ;
		END
   ELSE
        BEGIN
			SET @SQL = @SQL +   ' where  month(date) = ' + @prev_month_prior + ' and year(date) = ' + @year ;
		END
   SET @SQL =  @SQL +   ' GROUP BY  CustomerNumber,	CustomerName,UnitSellDlr,ProtectionStartdate ,NDC,UsageForCalculation    ' +
   ' )c ' +
   ' on c.CustomerNumber = t.Customer_No and c.NDC = t.ndc and UnitSellDlr = aapunitcost and ProtectionStartdate = t.aapeffectdate ';

EXEC(@SQL);


---------END NEW CODE


-- TODO set AAPPriorMonthUsage to zero if NULL  11/09/2016 Here
update tmp_ppcompare set AAPPriorMonthUsage = 0 where AAPPriorMonthUsage is null


-- 
----------Possible new CODE 11/09/2016 -- took out UnitSellDlr to aggregate by just Customer,NDC and Effective date
--
--SET @SQL =  ' UPDATE t  set  '+
--	' AAPPriorMonthUsage = UsageForCalculation  '+
--    ' FROM tmp_PPCompare   t ' +
--	' join '+
--	' ( '+
--	' 	SELECT CustomerNumber,	CustomerName, '+
--	'      ProtectionStartdate ,NDC, sum(UsageForCalculation  ) '+
--    ' 	 from  pharmacymaster..ca_priceprotection ';
-- 
--   IF(@month = '1' or  @month = '01') -- Here the month we're dealing with is January so previous month is December of previous year
--		BEGIN
--			SET @SQL = @SQL +   ' where  month(date) = ' + @curr_months_prev + ' and year(date) = ' + @curr_year_prev ;
--		END
--   ELSE
--        BEGIN
--			SET @SQL = @SQL +   ' where  month(date) = ' + @prev_month_prior + ' and year(date) = ' + @year ;
--		END
--   SET @SQL =  @SQL +   ' GROUP BY  CustomerNumber,	CustomerName,ProtectionStartdate ,NDC   ' +
--   ' )c ' +
--   ' on c.CustomerNumber = t.Customer_No and c.NDC = t.ndc  and ProtectionStartdate = t.aapeffectdate ';
--
--EXEC(@SQL);
--
-----------END possible NEW CODE
 

-------------------------------------

-- Get the usage from the prior 3 months from the Price Increase Effective Date

UPDATE  tc  set 
 	AAPPrev3MonthUsage =  ship_qty   from 
 tmp_PPCompare   tc
inner join (
 select   sum(ship_qty)as ship_qty ,t.ndc,t.customer_no,max(aapeffectdate) as aapeffectdate 
		
	    FROM tmp_PPCompare   t
		inner join 
			( SELECT ship_qty  ,ndc,customer_no,inv_date from tmp_PPPurchases3MoPrior 
             ) p
	   on t.ndc = p.ndc   and t.customer_no = p.customer_no where 
 p.inv_date  <  
 ( select cast(  month (dateadd(month,0, ( select t.aapeffectdate))) as varchar(2)) + '/01/' +
   cast(  year (dateadd(month,0, ( select t.aapeffectdate))) as varchar(4))  )
 and p.inv_date >= 
 ( select cast(  month (dateadd(month,-3, ( select t.aapeffectdate))) as varchar(2)) + '/01/' +
   cast(  year (dateadd(month,-3, ( select t.aapeffectdate))) as varchar(4))  )
  group by   t.ndc,t.customer_no,aapeffectdate ,abs(t.aapunitcost) 
)

 pt on tc.ndc = pt.ndc   and tc.customer_no = pt.customer_no and tc.aapeffectdate = pt.aapeffectdate

-----------------------------------------------------------------

-- Calculate the average of the prior 3 months - calculation is:
-- Total ship qty for 3 months / number of days in prior 3 months and that result is multiplied by 30
-- DaysIn3MonthForPP function does the calculation

  UPDATE  tc  set 
AAPAvgMonthUsage = avgship_qty 
 FROM tmp_PPCompare   tc
inner join (
select       dbo.DaysIn3MonthForPP(  t.aapeffectdate,sum(ship_qty))
    as avgship_qty, t.ndc,t.customer_no,    aapeffectdate
		,abs(t.aapunitcost) as aapunitcost 
	    FROM tmp_PPCompare   t
		inner join 
			( SELECT ship_qty  ,ndc,customer_no,inv_date from tmp_PPPurchases3MoPrior 
             ) p
	   on t.ndc = p.ndc   and t.customer_no = p.customer_no where 
 p.inv_date  <  
 ( select cast(  month (dateadd(month,0, ( select t.aapeffectdate))) as varchar(2)) + '/01/' +
   cast(  year (dateadd(month,0, ( select t.aapeffectdate))) as varchar(4))  )
 and p.inv_date >= 
 ( select cast(  month (dateadd(month,-3, ( select t.aapeffectdate))) as varchar(2)) + '/01/' +
   cast(  year (dateadd(month,-3, ( select t.aapeffectdate))) as varchar(4))  )
 group by t.ndc,t.customer_no,aapeffectdate,abs(t.aapunitcost) 
 )

 pt on tc.ndc = pt.ndc   and tc.customer_no = pt.customer_no and tc.aapeffectdate = pt.aapeffectdate
 

 
-- This is a temp table I use to store some of the calculated information like which is the lesser amount - the
-- previous 3 months usage or the average of the previous 3 months - this will be used in determining how
-- much they get credit for
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCalc')
		 BEGIN
          DROP TABLE tmp_PPCalc
         END
---------ADDED IN AAPEFFDATE
	SELECT * into tmp_PPCalc from
	(
		SELECT NDC,Customer_No ,case when AAPPrev3MonthUsage < AAPAvgMonthUsage then AAPPrev3MonthUsage else
	    AAPAvgMonthUsage end as Lesser3Mo ,
        AAPUsageForCalculation, (AAPUnitCost - AAPOldPrice) as PriceDiff,AAPUnitCost,aapeffectdate 
        from tmp_PPCompare


	 ) pp


-- I think this is where it's messing up 11/09/2016 - AAPPriorMonthUsage is null so it's not calculating correctly

-- First pass at calculating usage for calculation - if the Lesser of 3 months (calculated above) is less than 
-- what was actually purchased this month then the Lesser of 3 months is used in the calculations to determine
-- how much they get credit for.  If the Lesser of 3 months (calculated above) is greater than what they purchased
-- than what they actually purchased this month is used
-- This amount (AAPUsageForCalculation) "might" be overriden in one of the queries below if certain conditions
-- are met - keep going ...

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCompareBeforeFirstPass')
		 BEGIN
          DROP TABLE tmp_PPCompareBeforeFirstPass
         END

select * into tmp_PPCompareBeforeFirstPass from tmp_ppcompare


  	    UPDATE t set
			AAPUsageForCalculation = case when Lesser3Mo - AAPPriorMonthUsage <   AAPActualUsageToDate 
 then (Lesser3Mo - AAPPriorMonthUsage ) else 
   AAPActualUsageToDate end  
		FROM tmp_PPCompare   t
		inner join 
			(
				select NDC,Customer_No ,AAPUnitCost ,Lesser3Mo,aapeffectdate from tmp_PPCalc where AAPUnitCost > 0
			) p 		

         on t.ndc = p.ndc   and t.customer_no = p.customer_no and t.AAPUnitCost = p.AAPUnitCost and t.aapeffectdate = p.aapeffectdate

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCompareFirstPass')
		 BEGIN
          DROP TABLE tmp_PPCompareFirstPass
         END

select * into tmp_PPCompareFirstPass from tmp_PPCompare

-- Need to update AAPUsageForCalculation where the Price Protection Start date is in current month
-- After reading this code I'm thinking it might not be necessary - that it is covered in the update
-- above - but I'm not taking it out as it's working -- if I put this in separately there may have been
-- some scenario that wasn't covered in the above query - but I can't for the life of me remember 
-- what it could have been

 -- JUST TOOK OUT TO TEST 8/6/2015
--         UPDATE t set
--			AAPUsageForCalculation = case when Lesser3Mo <= AAPActualUsageToDate then Lesser3Mo else 
--   AAPActualUsageToDate end
--		FROM tmp_PPCompare   t
--		inner join 
--			(
--				select NDC,Customer_No ,AAPUnitCost ,Lesser3Mo from tmp_PPCalc where AAPUnitCost > 0
--			) p 		
--
--         on t.ndc = p.ndc   and t.customer_no = p.customer_no and t.AAPUnitCost = p.AAPUnitCost 
--           and month(AAPEffectDate) = @month and year(AAPEffectDate) = @year;
---


-- Here I delete where I show there was no usage this month (maybe due to returns) and there was
-- nothing in the Cardinal file either
DELETE from tmp_ppcompare where aapactualusagetodate = 0 and caactualusagetodate is null

-- Here is where we want to ajdust for price increase and where the fun really starts 
-- There may have been an easier way to do this but being as pressed for time as I was this is 
-- all that popped into my brain - and it worked so I ran with it


-- This will get high ones from price incease 

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPHighInc')
		 BEGIN
          DROP TABLE tmp_PPHighInc
         END

SET @SQL = 'SELECT * into tmp_PPHighInc from '+
' (  '+
	' SELECT * FROM (  '+
	' SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost asc) as Rank  '+
	' FROM (SELECT     *  '+
			' 	FROM        tmp_ppcompare t where ndc in  '+
' (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = ''Price Increase''  ';

		IF(@month = 1 )
			BEGIN
			SET @SQL = @SQL +   ' and ndc not in (select distinct ndc  from  ' +                        
					' PharmacyMaster..CASourceContractMO c where [ChangeType] = ''Price Decrease''  '+ 
                    ' and c.[EffectDte] > t.[AAPEffectDate] ' +
					' and c.ndc = t.ndc) ' +
                    ' and ((month([EffectDte]) = '+
						 @curr_months_prev +' and year([EffectDte]) = '+ @curr_year_prev +'  )  or ' +
               ' ( month([EffectDte]) =  ' + @month + ' and year([EffectDte]) = ' + @year +  ')))';
			END

		ELSE
			BEGIN
			SET @SQL = @SQL +    '  and month([EffectDte]) in( ' +@prev_month_prior + ',' + @month + ')' + 
								 ' and year([EffectDte]) = ' + @year +  ') and ndc not in (select distinct ndc  from  ' +                        
					' PharmacyMaster..CASourceContractMO c where [ChangeType] = ''Price Decrease''  '+ 
                    ' and c.[EffectDte] > t.[AAPEffectDate] ' +
					'and c.ndc = t.ndc) ';
			END 
SET @SQL = @SQL + ' ) pm '+
	'		) tmp where   Rank = 2  '+
    '   )ch ';

EXEC (@SQL);
--This will get low ones from price incease start here
 
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_ppLowInc')
		 BEGIN
          DROP TABLE tmp_ppLowInc
         END

SET @SQL = 'select * into tmp_ppLowInc from '+
' (  '+
	' SELECT * FROM (  '+
	' SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost desc) as Rank  '+
	' FROM (SELECT     *  '+    
	'			FROM        tmp_ppcompare t where ndc in  '+
' (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = ''Price Increase''  ';
	IF(@month = 1 )
				BEGIN

				SET @SQL = @SQL +   ' and ndc not in (select distinct ndc  from  ' +                        
					' PharmacyMaster..CASourceContractMO c where [ChangeType] = ''Price Decrease''  '+ 
                    ' and c.[EffectDte] > t.[AAPEffectDate] ' +
					' and c.ndc = t.ndc) ' +
                    '  and ((month([EffectDte]) = '+
						 @curr_months_prev +' and year([EffectDte]) = '+ @curr_year_prev +'  )  or ' +
               ' ( month([EffectDte]) =  ' + @month + ' and year([EffectDte]) = ' + @year +  ')))';
		 
				END
			ELSE
				BEGIN
				SET @SQL = @SQL +    '  and month([EffectDte]) in( ' +@prev_month_prior + ',' + @month + ')' + 
									 ' and year([EffectDte]) = ' + @year +  ')  and ndc not in (select distinct ndc  from  ' +                        
					' PharmacyMaster..CASourceContractMO c where [ChangeType] = ''Price Decrease''  '+ 
                    ' and c.[EffectDte] > t.[AAPEffectDate] ' +
					'and c.ndc = t.ndc) ';
				END 
SET @SQL = @SQL + ' ) pm '+
	'		) tmp where   Rank = 2  '+
    '   )ch ';
EXEC (@SQL);



-- This is where I used the high and low amounts from tmp_ppHighInc and tmp_ppLowInc to update the actual usage for calculation
-- Updated to exlcude where the price increase occured 30 days after the first one
-- When there are two price increases within the same 30 day period the lower paid amount (unit cost) gets
-- first crack at how much is used in the usage for calculation - if there is any amount left over the 
-- one with the higher unit cost is awarded these (assuming of course all rules are met) - that is what the last join is for

UPDATE t 
	set aapusageforcalculation = newaapusage
from tmp_ppcompare t
inner join
(

	SELECT h.customer_no,h.ndc,h.causageforcalculation,h.aapusageforcalculation  ,h.aapunitcost,Lesser3Mo,l.aapeffectdate,
case when ( Lesser3Mo - l.aapusageforcalculation - l.aappriormonthusage )  >= h.aapusageforcalculation  then  h.aapusageforcalculation 
 else
 (Lesser3Mo - l.aapusageforcalculation - l.aappriormonthusage )  
 end as newaapusage ,h.aapeffectdate as highaapeffectdate,l.aapeffectdate as lowaapeffectdate -- 
  from tmp_ppHighInc h
join
(
  SELECT * from tmp_ppLowInc
) l  on l.customer_no = h.customer_no
and l.ndc = h.ndc and l.aapeffectdate = h.aapeffectdate -- JUST ADDED 08/06/2015 --Look at this again may need 2 one where effect date equal and one where they're not??
	join
	(

	SELECT NDC,Customer_No ,AAPUnitCost ,Lesser3Mo,aapeffectdate from tmp_PPCalc where AAPUnitCost > 0
	)high on h.customer_no = high.customer_no and h.ndc = high.ndc
	and high.AAPUnitCost = h.AAPUnitCost

)ch on t.customer_no = ch.customer_no and t.ndc = ch.ndc and t.aapunitcost = ch.aapunitcost and t.aapeffectdate = ch.aapeffectdate
 --where    highaapeffectdate <= dateadd(day,-30,lowaapeffectdate) -- Need to rework this - have to add correct
-- number of days in month

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCompareInc')
		 BEGIN
          DROP TABLE tmp_PPCompareInc
         END

select * into tmp_PPCompareInc from tmp_PPCompare

--------- 

--This will get high ones from price decrease 

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPHighDec')
		 BEGIN
          DROP TABLE tmp_PPHighDec
         END
SET @SQL = ' SELECT * into tmp_PPHighDec from '+
' (  '+
	' SELECT * FROM (  '+
	' SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost asc) as Rank '+
	' FROM (SELECT * '+
			'	FROM        tmp_ppcompare where ndc in '+
 ' (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = ''Price Decrease''';
	IF(@month = 1 )
				BEGIN

				SET @SQL = @SQL +   '  and ((month([EffectDte]) = '+
						 @curr_months_prev +' and year([EffectDte]) = '+ @curr_year_prev +'  )  or ' +
               ' ( month([EffectDte]) =  ' + @month + ' and year([EffectDte]) = ' + @year +  ')))';
				END
			ELSE
				BEGIN
				SET @SQL = @SQL +    '  and month([EffectDte]) in( ' +@prev_month_prior + ',' + @month + ')' + 
									 ' and year([EffectDte]) = ' + @year +  ')';
				END 
SET @SQL = @SQL + ' ) pm '+
	'		) tmp where   Rank = 2  '+
    '   )ch ';
EXEC (@SQL);

--This will get low ones from price decrease 
 
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_ppLowDec')
		 BEGIN
          DROP TABLE tmp_ppLowDec
         END

SET @SQL = ' SELECT * into tmp_ppLowDec from '+
' (  '+
	' SELECT * FROM (  '+
	' SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost desc) as Rank  '+
	' FROM (SELECT  * '+
			'	FROM        tmp_ppcompare where ndc in  '+
' (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = ''Price Decrease'''; 
	IF(@month = 1 )
				BEGIN
			    SET @SQL = @SQL +   '  and ((month([EffectDte]) = '+
						 @curr_months_prev +' and year([EffectDte]) = '+ @curr_year_prev +'  )  or ' +
               ' ( month([EffectDte]) =  ' + @month + ' and year([EffectDte]) = ' + @year +  ')))';

				END
			ELSE
				BEGIN
				SET @SQL = @SQL +    '  and month([EffectDte]) in( ' +@prev_month_prior + ',' + @month + ')' + 
									 ' and year([EffectDte]) = ' + @year +  ')';
				END 
SET @SQL = @SQL + ' ) pm '+
	'		) tmp where   Rank = 2  '+
    '   )ch ';

EXEC (@SQL);

--Updated 8/6/2015 to add in effect date to join on
-- Goes to higher one first so this will adjust the lower one - that's what that last join is for

UPDATE t 
	set aapusageforcalculation = newaapusage
from tmp_ppcompare t
inner join
(
	select l.customer_no,l.ndc,l.causageforcalculation,l.aapusageforcalculation  ,l.aapunitcost,Lesser3Mo,l.aapeffectdate,
case when ( Lesser3Mo - h.aapusageforcalculation - h.aappriormonthusage )  >= l.aapusageforcalculation  then  l.aapusageforcalculation 
 else
 (Lesser3Mo - h.aapusageforcalculation - h.aappriormonthusage )  
 end as newaapusage
  from tmp_ppLowDec l
join
(
  select * from tmp_ppHighDec
) h  on l.customer_no = h.customer_no
and l.ndc = h.ndc and l.aapeffectdate = h.aapeffectdate -- JUST ADDED 08/06/2015
	join
	(

	select NDC,Customer_No ,AAPUnitCost ,Lesser3Mo,aapeffectdate from tmp_PPCalc where AAPUnitCost > 0
	)les on l.customer_no = les.customer_no and l.ndc = les.ndc and l.aapeffectdate = les.aapeffectdate
	and les.AAPUnitCost = l.AAPUnitCost
)ch on t.customer_no = ch.customer_no and t.ndc = ch.ndc and t.aapunitcost = ch.aapunitcost and t.aapeffectdate = ch.aapeffectdate
--------- 
--PROBLEM IS HERE --added aapeffectdate 08/06/2015

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCompareDec')
		 BEGIN
          DROP TABLE tmp_PPCompareDec
         END

select * into tmp_PPCompareDec from tmp_PPCompare

-----------
UPDATE tmp_PPCalc   set AAPUsageForCalculation = (select AAPUsageForCalculation from tmp_PPCompare
where NDC = tmp_PPCalc.ndc and Customer_No = tmp_PPCalc.Customer_No   and tmp_PPCalc.AAPEffectDate = AAPEffectDate
and  tmp_PPCalc.AAPUnitCost = AAPUnitCost)


 

--Need to update where AAPUsageForCalculation < 0
UPDATE tmp_PPCompare set AAPUsageForCalculation = 0 where AAPUsageForCalculation < 0;
			
--Finally update AAPPriceProtectionDueToDate --added in effectdate to join on 8/9/2015

 
		UPDATE  t  set 
			AAPPriceProtectionDueToDate = p.AAPPriceProtectionDueToDate  
	   FROM tmp_PPCompare   t
		inner join 
			( select    PriceDiff*AAPUsageForCalculation 	 
				 as  AAPPriceProtectionDueToDate, NDC,Customer_No ,AAPUnitCost,aapeffectdate from tmp_PPCalc where
                AAPUnitCost > 0
		     ) p
		on t.ndc = p.ndc   and t.customer_no = p.customer_no and t.AAPUnitCost = p.AAPUnitCost and t.aapeffectdate = p.aapeffectdate

		UPDATE  tmp_PPCompare  set 
			AAPPriceProtectionDueToDate = 0 where AAPPriceProtectionDueToDate < 0
 

UPDATE tmp_PPCompare set IsMultiplePriceChange = 'Yes' where ndc in 
(
		  select distinct t.ndc
		from tmp_PPNDCUnion t
		inner join 
		(
			select ndc
			from   tmp_PPNDCUnion
			group by ndc
			having count(*) > 1
		) d on t.ndc = d.ndc
)  

UPDATE tmp_PPCompare set IsMultiplePriceChange = 'No' where IsMultiplePriceChange != 'Yes'



	UPDATE tmp_PPCompare set AuditOK = 'Yes' where 
	(AAPEffectDate = CAEffectDate) and
	(AAPPrev3MonthUsage = CAPrev3MonthUsage )and
	(AAPAvgMonthUsage = CAAvgMonthUsage ) and 
	(AAPActualUsageToDate =CAActualUsageToDate) and
	(  AAPPriceProtectionDueToDate = CAPriceProtectionDueToDate )

	UPDATE tmp_PPCompare set AuditOK = 'No' where AuditOK != 'Yes'  
 

	UPDATE tmp_PPCompare set AuditFailReason = 
	case when ( AAPEffectDate != CAEffectDate)
    then 'Different Effective Date,' else  AuditFailReason end 
	 

	UPDATE tmp_PPCompare set AuditFailReason = 
	case when (AAPPrev3MonthUsage != CAPrev3MonthUsage )
	then AuditFailReason + 'Different Prev3MonthUsage, '
	 else  AuditFailReason end 
 

	UPDATE tmp_PPCompare set AuditFailReason = 
	case when (AAPAvgMonthUsage != CAAvgMonthUsage )
	then AuditFailReason + 'Different AvgMonthUsage, ' 
	else  AuditFailReason end 
 

	UPDATE tmp_PPCompare set AuditFailReason = 
	case when (AAPActualUsageToDate != CAActualUsageToDate )
	then AuditFailReason + 'Different ActualUsageToDate, '
	else  AuditFailReason end 
	 

	UPDATE tmp_PPCompare set AuditFailReason = 
	case when (AAPPriceProtectionDueToDate  != CAPriceProtectionDueToDate )
	then AuditFailReason + 'Different PriceProtectionDueToDate, '
	else  AuditFailReason end 
 
	UPDATE tmp_PPCompare set AuditFailReason =  AuditFailReason +'Not in Cardinal as Valid,' where 
	CAEffectDate is null and
	CAPrev3MonthUsage is null and
	CAAvgMonthUsage is null and
	CAActualUsageToDate is null and
	CAPriceProtectionDueToDate is null 

	UPDATE tmp_PPCompare set AuditFailReason =   AuditFailReason +'Not in AAP as Valid,' where 
	AAPEffectDate is null or
	AAPPrev3MonthUsage is null or
	AAPAvgMonthUsage is null or
	AAPActualUsageToDate is null or
	AAPPriceProtectionDueToDate is null 

-- Had to do this as I had to include those where I had AAPPriceProtectionDueToDate = 0
-- now at end I can delete if  AAPPriceProtectionDueToDate = 0 and there was no match in Cardinal table

	DELETE from tmp_PPCompare  where 
	CAEffectDate is null and
	CAPrev3MonthUsage is null and
	CAAvgMonthUsage is null and
	CAActualUsageToDate is null and
	CAPriceProtectionDueToDate is null and AAPPriceProtectionDueToDate = 0


	DELETE from tmp_PPCompare where aappriceprotectionduetodate is null
	and capriceprotectionduetodate is null

-- Here we need to remove the 'VPhA-USA' affiliate -- 11/09/2015 Per Joshua they now are eligible for Price Protection

--DELETE from tmp_PPCompare where customer_no in (
--SELECT distinct t.customer_no from tmp_PPCompare t 
--join 
--(
--	SELECT distinct pmid,customer_no from tmp_pppurchases where pmid in 
--		(select distinct pmid  from pharmacymaster..v_pm_allwithaffiliates where affiliate  in ('VPhA-USA'))
--
-- group by pmid,customer_no
--)p
--on p.customer_no = t.customer_no
--where AuditFailReason  like '%Not in Cardinal as Valid%' 
--group by t.customer_no
--)

-- Delete those with no historical usage
delete  from tmp_PPCompare  where AuditFailReason  like '%Not in Cardinal as Valid%' 
and aapprev3monthusage <= 0

-- Delete where nothing availabel for calculations
--delete  from tmp_PPCompare  where AuditFailReason  like '%Not in Cardinal as Valid%' 
--and AAPUsageForCalculation is null

 UPDATE tmp_PPCompare set AuditFailReason =  substring(AuditFailReason,1,(len(AuditFailReason) -1))
 from tmp_PPCompare where len(AuditFailReason) >1


------------------------------------END OF WHAT YOU NEED TO EXECUTE - the rest is QA I use
 


 SELECT * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  

-- To find those I pulled as valid but Cardinal is not including

select *  from tmp_PPCompare  t
left outer join
(
	select * from  pharmacymaster..ca_priceprotection where date = @in_date
)c
on c.ndc = t.ndc and c.customernumber = t.customer_no and 
c.unitselldlr = t.aapunitcost
 where customernumber is null 
 
-- To find those Cardinal pulled as valid but I did not include - at this point it might be because I applied
-- a return to an incorrect purchase - until we get the order number in there there is no way to tell which
-- one it actually should be applied against

select * from  pharmacymaster..ca_priceprotection   c
left outer join
(
	select * from  tmp_PPCompare
)t
on c.ndc = t.ndc and c.customernumber = t.customer_no and 
c.unitselldlr = t.aapunitcost
 where customer_no is null and  date = @in_date
and priceprotectionduetodate > 0

--Theses will show which ones may not be under AAP Contract - These might show up 
-- as I've included them as valid but Joshua (Cardinal) didn't - You have to check
-- with Joshua to see if they should be included or not

select * from tmp_ppcompare where customer_no in (
select distinct customer_no from tmp_pppurchasesvalid where ContractDesc not like '%AAP%')
and ndc in (select distinct ndc from tmp_pppurchasesvalid where ContractDesc not like '%AAP%')

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

END

GO
