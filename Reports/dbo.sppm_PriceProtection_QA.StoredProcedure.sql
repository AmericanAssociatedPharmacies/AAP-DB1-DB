USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_QA]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/23/2014
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_QA] 
	-- Add the parameters for the stored procedure here
 
AS
 

BEGIN

SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF

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

or abs(p.unit_cost) >=  (SELECT [NewPrice] from PharmacyMaster..CASourceContractMO where [ChangeType] = 'Price Decrease' 
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

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPCompare')
		 BEGIN
          DROP TABLE tmp_PPCompare
         END

SELECT * into tmp_PPCompare from (
SELECT 
Customer_No,max(Customer_Name) as Customer_Name ,NDC,AAPOldPrice,CAOldPrice,AAPNewPrice,CANewPrice,
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
 
DELETE from	  tmp_PPCompare  where aapactualusagetodate <= 0

--HARDCODED DATE
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
			    from  pharmacymaster..ca_priceprotection where date = '02/01/2015'
               GROUP BY  CustomerNumber,	CustomerName,ProtectionStartdate ,  Prev3MonthUsage, 
                AvgMonthlyUsage,NDC,ProtectedSelPrice ,  NewSellPrice,UnitSellDlr,PriorMonthUsage,UsageForCalculation,
                       Comment
)c
on c.CustomerNumber = t.Customer_No and c.NDC = t.ndc and UnitSellDlr = aapunitcost

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

	SELECT * into tmp_PPCalc from
	(
		SELECT NDC,Customer_No ,case when AAPPrev3MonthUsage < AAPAvgMonthUsage then AAPPrev3MonthUsage else
	    AAPAvgMonthUsage end as Lesser3Mo ,
        AAPUsageForCalculation, (AAPUnitCost - AAPOldPrice) as PriceDiff,AAPUnitCost from tmp_PPCompare


	 ) pp

 -- First pass at calculating usage for calculation - if the Lesser of 3 months (calculated above) is less than 
-- what was actually purchased this month then the Lesser of 3 months is used in the calculations to determine
-- how much they get credit for.  If the Lesser of 3 months (calculated above) is greater than what they purchased
-- than what they actually purchased this month is used
-- This amount (AAPUsageForCalculation) "might" be overriden in one of the queries below if certain conditions
-- are met - keep going ...

  	    UPDATE t set
			AAPUsageForCalculation = case when Lesser3Mo - AAPPriorMonthUsage <   AAPActualUsageToDate 
 then (Lesser3Mo - AAPPriorMonthUsage ) else 
   AAPActualUsageToDate end  
		FROM tmp_PPCompare   t
		inner join 
			(
				select NDC,Customer_No ,AAPUnitCost ,Lesser3Mo from tmp_PPCalc where AAPUnitCost > 0
			) p 		

         on t.ndc = p.ndc   and t.customer_no = p.customer_no and t.AAPUnitCost = p.AAPUnitCost 

--HARDCODED DATE
-- Need to update AAPUsageForCalculation where the Price Protection Start date is in current month
-- After reading this code I'm thinking it might not be necessary - that it is covered in the update
-- above - but I'm not taking it out as it's working -- if I put this in separately there may have been
-- some scenario that wasn't covered in the above query - but I can't for the life of me remember 
-- what it could have been
 
         UPDATE t set
			AAPUsageForCalculation = case when Lesser3Mo <= AAPActualUsageToDate then Lesser3Mo else 
   AAPActualUsageToDate end
		FROM tmp_PPCompare   t
		inner join 
			(
				select NDC,Customer_No ,AAPUnitCost ,Lesser3Mo from tmp_PPCalc where AAPUnitCost > 0
			) p 		

         on t.ndc = p.ndc   and t.customer_no = p.customer_no and t.AAPUnitCost = p.AAPUnitCost 
           and month(AAPEffectDate) = 02 and year(AAPEffectDate) = 2015;
---




-- Here I delete where I show there was no usage this month (maybe due to returns) and there was
-- nothing in the Cardinal file either
DELETE from tmp_ppcompare where aapactualusagetodate = 0 and caactualusagetodate is null

-- Here is where we want to ajdust for price increase and where the fun really starts 
-- There may have been an easier way to do this but being as pressed for time as I was this is 
-- all that popped into my brain - and it worked so I ran with it
-- When there are two price increases within the same 30 day period the highest paid amount (unit cost) gets
-- first crack at how much is used in the usage for calculation - if there is any amount left over the 
-- one with the lower unit cost is awarded these (assuming of course all rules are met)

-- This will get high ones from price incease 
--HARDCODED DATE
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPHighInc')
		 BEGIN
          DROP TABLE tmp_PPHighInc
         END


SELECT * into tmp_PPHighInc from 
(  
--	SELECT * FROM (  
--	SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost asc) as Rank   
-- FROM (SELECT     *  
--		 	FROM        tmp_ppcompare where ndc in   
--  (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Increase'   
--
----		IF(@month = 1 )
----			BEGIN
----			SET @SQL = @SQL +   '  and ((month([EffectDte]) = '+
----						 @curr_months_prev +' and year([EffectDte]) = '+ @curr_year_prev +'  )  or ' +
----               ' ( month([EffectDte]) =  ' + @month + ' and year([EffectDte]) = ' + @year +  ')))';
----			END
----
----		ELSE
----			BEGIN
--			   and month([EffectDte]) in( '01','02') 
--				  and year([EffectDte]) = 2015)
--			--END 
--  ) pm 
--	 	) tmp where   Rank = 2

	SELECT * FROM (  
	SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost asc) as Rank   
 FROM (SELECT     *  
		 	FROM        tmp_ppcompare t where ndc in   
  (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Increase'   

 
			   and month([EffectDte]) in( '01','02')
				  and year([EffectDte]) = 2015) and ndc not in (select distinct ndc  from 
PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Decrease'   and c.[EffectDte] > t.[AAPEffectDate]
and c.ndc = t.ndc)

			--END 
  ) pm 
	 	) tmp where   Rank = 2    
      )ch

--This will get low ones from price incease 
--HARDCODED DATE
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_ppLowInc')
		 BEGIN
          DROP TABLE tmp_ppLowInc
         END


 select * into tmp_ppLowInc from  
  (  
--	 SELECT * FROM (   
--	 SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost desc) as Rank   
--	 FROM (SELECT     *    
--				FROM        tmp_ppcompare where ndc in   
--  (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Increase'  
----	IF(@month = 1 )
----				BEGIN
----
----				SET @SQL = @SQL +   '  and ((month([EffectDte]) = '+
----						 @curr_months_prev +' and year([EffectDte]) = '+ @curr_year_prev +'  )  or ' +
----               ' ( month([EffectDte]) =  ' + @month + ' and year([EffectDte]) = ' + @year +  ')))';
----		 
----				END
----			ELSE
----				BEGIN
--				  and month([EffectDte]) in( '01 ','02') 
--									  and year([EffectDte]) = 2015)
--			--	END 
-- ) pm 
--	 	) tmp where   Rank = 2   
SELECT * FROM (  
	 SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost desc) as Rank   
	 FROM (SELECT     *    
				FROM        tmp_ppcompare t where ndc in   
  (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Increase'  

				  and month([EffectDte]) in( '01 ','02') 
									  and year([EffectDte]) = 2015)
and ndc not in (select distinct ndc  from 
PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Decrease'   and c.[EffectDte] > t.[AAPEffectDate]
and c.ndc = t.ndc)
			--	END 
 ) pm 
	 	) tmp where   Rank = 2   
     )ch  

-------------------------------

UPDATE t 
	set aapusageforcalculation = newaapusage
from tmp_ppcompare t
inner join
(

--	SELECT l.customer_no,l.ndc,l.causageforcalculation,l.aapusageforcalculation  ,l.aapunitcost,Lesser3Mo,
--case when ( Lesser3Mo - h.aapusageforcalculation - h.aappriormonthusage )  >= l.aapusageforcalculation  then  l.aapusageforcalculation 
-- else
-- (Lesser3Mo - h.aapusageforcalculation - h.aappriormonthusage )  
-- end as newaapusage ,l.aapeffectdate as lowaapeffectdate,h.aapeffectdate as highaapeffectdate -- 
--  from tmp_ppLowInc l
--join
--(
--  SELECT * from tmp_ppHighInc
--) h  on l.customer_no = h.customer_no
--and l.ndc = h.ndc
--	join
--	(
--
--	SELECT NDC,Customer_No ,AAPUnitCost ,Lesser3Mo from tmp_PPCalc where AAPUnitCost > 0
--	)les on l.customer_no = les.customer_no and l.ndc = les.ndc
--	and les.AAPUnitCost = l.AAPUnitCost


	SELECT h.customer_no,h.ndc,h.causageforcalculation,h.aapusageforcalculation  ,h.aapunitcost,Lesser3Mo,
case when ( Lesser3Mo - l.aapusageforcalculation - l.aappriormonthusage )  >= h.aapusageforcalculation  then  h.aapusageforcalculation 
 else
 (Lesser3Mo - l.aapusageforcalculation - l.aappriormonthusage )  
 end as newaapusage ,h.aapeffectdate as highaapeffectdate,l.aapeffectdate as lowaapeffectdate -- 
  from tmp_ppHighInc h
join
(
  SELECT * from tmp_ppLowInc
) l  on l.customer_no = h.customer_no
and l.ndc = h.ndc
	join
	(

	SELECT NDC,Customer_No ,AAPUnitCost ,Lesser3Mo from tmp_PPCalc where AAPUnitCost > 0
	)high on h.customer_no = high.customer_no and h.ndc = high.ndc
	and high.AAPUnitCost = h.AAPUnitCost

)ch on t.customer_no = ch.customer_no and t.ndc = ch.ndc and t.aapunitcost = ch.aapunitcost
--where    highaapeffectdate <= dateadd(day,-30,lowaapeffectdate) -- Need to rework this - have to add correct
-- number of days in month
--------- 
--HARDCODED DATE
--This will get high ones from price incease 

 

--This will get low ones from price decrease 
--HARDCODED DATE
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPHighDec')
		 BEGIN
          DROP TABLE tmp_PPHighDec
         END

  SELECT * into tmp_PPHighDec from  
  (   
	  SELECT * FROM (  
	  SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost asc) as Rank 
	 FROM (SELECT * 
				FROM        tmp_ppcompare where ndc in 
  (SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Decrease'
--	IF(@month = 1 )
--				BEGIN
--
--				SET @SQL = @SQL +   '  and ((month([EffectDte]) = '+
--						 @curr_months_prev +' and year([EffectDte]) = '+ @curr_year_prev +'  )  or ' +
--               ' ( month([EffectDte]) =  ' + @month + ' and year([EffectDte]) = ' + @year +  ')))';
--				END
--			ELSE
--				BEGIN
		  and month([EffectDte]) in( '01','02')
									  and year([EffectDte]) = 2015)
	--			END 
  ) pm  
 	) tmp where   Rank = 2   
        )ch  


IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_ppLowDec')
		 BEGIN
          DROP TABLE tmp_ppLowDec
         END

 SELECT * into tmp_ppLowDec from  
 (  
	 SELECT * FROM (   
	 SELECT * , Rank() OVER (Partition BY customer_no,ndc order by aapunitcost desc) as Rank   
	 FROM (SELECT  *  
			 	FROM        tmp_ppcompare where ndc in  
 (  SELECT distinct ndc  from PharmacyMaster..CASourceContractMO c where [ChangeType] = 'Price Decrease' 
--	IF(@month = 1 )
--				BEGIN
--			    SET @SQL = @SQL +   '  and ((month([EffectDte]) = '+
--						 @curr_months_prev +' and year([EffectDte]) = '+ @curr_year_prev +'  )  or ' +
--               ' ( month([EffectDte]) =  ' + @month + ' and year([EffectDte]) = ' + @year +  ')))';
--
--				END
--			ELSE
--				BEGIN
			   and month([EffectDte]) in( '01','02')
					and year([EffectDte]) = 2015)
		--		END 
 ) pm  
 	) tmp where   Rank = 2   
    )ch  



UPDATE t 
	set aapusageforcalculation = newaapusage
from tmp_ppcompare t
inner join
(
	select l.customer_no,l.ndc,l.causageforcalculation,l.aapusageforcalculation  ,l.aapunitcost,Lesser3Mo,
case when ( Lesser3Mo - h.aapusageforcalculation - h.aappriormonthusage )  >= l.aapusageforcalculation  then  l.aapusageforcalculation 
 else
 (Lesser3Mo - h.aapusageforcalculation - h.aappriormonthusage )  
 end as newaapusage
  from tmp_ppLowDec l
join
(
  select * from tmp_ppHighDec
) h  on l.customer_no = h.customer_no
and l.ndc = h.ndc
	join
	(

	select NDC,Customer_No ,AAPUnitCost ,Lesser3Mo from tmp_PPCalc where AAPUnitCost > 0
	)les on l.customer_no = les.customer_no and l.ndc = les.ndc
	and les.AAPUnitCost = l.AAPUnitCost
)ch on t.customer_no = ch.customer_no and t.ndc = ch.ndc and t.aapunitcost = ch.aapunitcost
--------- 
--------- 

-----------
-----------
UPDATE tmp_PPCalc   set AAPUsageForCalculation = (select AAPUsageForCalculation from tmp_PPCompare
where NDC = tmp_PPCalc.ndc and Customer_No = tmp_PPCalc.Customer_No --and tmp_PPCalc.AAPEffectDate = AAPEffectDate
and  tmp_PPCalc.AAPUnitCost = AAPUnitCost)
 

--Need to update where AAPUsageForCalculation < 0
update tmp_PPCompare set AAPUsageForCalculation = 0 where AAPUsageForCalculation < 0;
			
 
			
--Finally update AAPPriceProtectionDueToDate

 
		UPDATE  t  set 
			AAPPriceProtectionDueToDate = p.AAPPriceProtectionDueToDate  
	   FROM tmp_PPCompare   t
		inner join 
			( select    PriceDiff*AAPUsageForCalculation 	 
				 as  AAPPriceProtectionDueToDate, NDC,Customer_No ,AAPUnitCost from tmp_PPCalc where
                AAPUnitCost > 0
		     ) p
		on t.ndc = p.ndc   and t.customer_no = p.customer_no and t.AAPUnitCost = p.AAPUnitCost

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


-- Here we need to remove the 'VPhA-USA' affiliate

DELETE from tmp_PPCompare where customer_no in (
SELECT distinct t.customer_no from tmp_PPCompare t 
join 
(
	SELECT distinct pmid,customer_no from tmp_pppurchases where pmid in 
		(select distinct pmid  from pharmacymaster..v_pm_allwithaffiliates where affiliate  in ('VPhA-USA'))

 group by pmid,customer_no
)p
on p.customer_no = t.customer_no
--where AuditFailReason  like '%Not in Cardinal as Valid%' 
group by t.customer_no
)

-- Delete those with no historical usage
delete  from tmp_PPCompare  where AuditFailReason  like '%Not in Cardinal as Valid%' 
and aapprev3monthusage <= 0

-- Delete where nothing availabel for calculations
delete  from tmp_PPCompare  where AuditFailReason  like '%Not in Cardinal as Valid%' 
and AAPUsageForCalculation is null

 UPDATE tmp_PPCompare set AuditFailReason =  substring(AuditFailReason,1,(len(AuditFailReason) -1))
 from tmp_PPCompare where len(AuditFailReason) >1


------------------------------------END OF WHAT YOU NEED TO EXECUTE - the rest is QA I use
-- 
--select * from  pharmacymaster..ca_priceprotection
--  where   date = '11/01/2014'
-- and customernumber in (
-- SELECT distinct customer_no  from tmp_PPCompare  where AuditFailReason  like '%Not in Cardinal as Valid%')
----Price Changed Within Protection Period - Usage For Calculation Manually Adjusted
--
--
--select * from  pharmacymaster..ca_priceprotection
--  where   date = '11/01/2014' and priceprotectionduetodate = 0
-- and customernumber  = '002803' and ndc = '60432013325'
--select * from tmp_pppurchases
---- All Compare
--  SELECT * from tmp_PPCompare  where AuditFailReason  like '%Not in Cardinal as Valid%'
--  SELECT * from tmp_PPCompare  where AuditFailReason not like '%Not in Cardinal as Valid%' and AuditFailReason ! = ''
--  SELECT * from tmp_PPCompare  where AuditFailReason != '' 
--
-- SELECT * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  
--and aapprev3monthusage != caprev3monthusage
--and ndc = '54879000716'
----0077026 00781207601 is me I didn't process taking off prev month right
 
 SELECT * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  

--and aapprev3monthusage != caprev3monthusage
-- SELECT distinct ndc from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate 
-- order by ndc
--select ndc from tmp_ppndcdec order by ndc
----
----and capriceprotectionduetodate = 0  and customer_no  = '476121' and ndc = '00555083302'
----order by customer_no
--
--select * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  
--and ndc in ( select ndc from tmp_ppndcdec )
--
--select * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  
--and aapactualusagetodate  = caactualusagetodate
--
-- SELECT * from tmp_PPCompare  where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate  
--and aappriceprotectionduetodate = 0
--order by customer_no
-- 
-- SELECT * from tmp_PPCompare where   customer_no  = '016190' and ndc = '00781207601'
--order by customer_no
-- 
--
-- SELECT * from tmp_PPCompare  where AAPAvgMonthUsage != CAAvgMonthUsage
--
--
--  SELECT * from tmp_PPCompare  where AuditFailReason not like '%Not in Cardinal as Valid%' and AuditFailReason ! = ''
--
-- select * from tmp_PPPurchases3MoPrior where customer_no = '001030' and ndc = '00781207601'
--order by inv_date -- I have 3 for previous month he has one
-- select * from tmp_PPPurchases3MoPrior where customer_no = '406742' and ndc = '00093002701'
--order by inv_date -- I have 6 for previous month he had 3
---- Different average '415804' and NDC '00781207601' -- I have 15 he has 16 (46/94) * 30 = 15
--
-- SELECT * from tmp_PPCompare  where AAPAvgMonthUsage != CAAvgMonthUsage
-- SELECT * from tmp_PPCompare  where AAPAvgMonthUsage != CAAvgMonthUsage
--  SELECT * from tmp_PPCompareall --where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate
--where  ndc = '00555083202'
--
--  SELECT * from tmp_PPCompare --where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate   
--where customer_no = '301168' and ndc = '00093002901'
--
--select * from tmp_PPPurchases_bkp where customer_no = '463516' and ndc = '50383066730'
--
--select * from tmp_PPPurchases  where customer_no = '301168' and ndc = '00093002901' --9/2  return 9/27
--
--select * from tmp_PPPurchasesVerified where customer_no = '463516' and ndc = '50383066730'
--select * from tmp_PPNDCUnion where ndc = '00093002901'  
--
--select * from  pharmacymaster..ca_priceprotection
--  where   date = '09/01/2014'
-- and customernumber =  '717621'
-- and ndc = '00555086902'
--
--select * from tmp_PPPurchasesValid where customer_no = '717621' and ndc = '00555086902'
--order by inv_date
--  SELECT * from tmp_PPCompare where CAPriceProtectionDueToDate != AAPPriceProtectionDueToDate
--
--  SELECT distinct auditfailreason from tmp_PPCompare where auditfailreason != ''
----where customer_no = '717621' and ndc = '00555086902'
--select * from tmp_PPNDCUnion where ndc = '50383066730'  -- 8/12 and 9/25
--select * from tmp_PPPurchases3moprior where customer_no = '226962' and ndc = '00555060702'
--select * from tmp_PPcompare where customer_no = '065784' and ndc = '00781207601'
--select * from tmp_PPNDCUnion where ndc = '50383066730'  -- 8/12 and 9/25
--
--SET ARITHABORT OFF 
--SET ANSI_WARNINGS OFF
-- SELECT * from claims..cahcontract where month([Effect Dte]) in (08,09)
-- and year([Effect Dte]) = 2014
-- --and (( ([New Price] - [Old Price] )/ [Old Price] ) >= 0.20)  
--and ndc  ='00555086902'
--select * from tmp_PPPurchases where customer_no = '717621' and ndc = '00555086902'
--
--select * from pharmacymaster..pm_pharmacy where pmid = 100916
--
--select * from tmp_pppurchasesvalid where customer_no = '717621' and ndc = '00555086902'
--and ship_qty <> 0
--
--select * from tmp_PPPurchases3MoPrior  where customer_no = '717621' and ndc = '00555086902'
--
--SELECT  sum(ship_qty) as ship_qty,ndc,customer_no,inv_date from tmp_PPPurchases3MoPrior 
--where customer_no = '213284' and ndc = '50383066730'
--group by ndc,customer_no,inv_date
--select * from tmp_pppurchasesvalid where customer_no = '391411' and ndc = '63304029601'
---- Too see if anything is missing
--
--select distinct t.ndc  from tmp_PPCompare  t
--left outer join
--(
--	select * from  pharmacymaster..ca_priceprotection where date = '11/01/2014'
--)c
--on c.ndc = t.ndc and c.customernumber = t.customer_no and 
--c.unitselldlr = t.aapunitcost
-- where customernumber is null
--
--select *  from tmp_PPCompare  t
--left outer join
--(
--	select * from  pharmacymaster..ca_priceprotection where date = '11/01/2014'
--)c
--on c.ndc = t.ndc and c.customernumber = t.customer_no and 
--c.unitselldlr = t.aapunitcost
-- where customernumber is null 
--and t.ndc != '00603388732' and  t.ndc != '54879000716'
--
--
--select * from  pharmacymaster..ca_priceprotection where date = '11/01/2014'  
--and ndc= '00406012501' and customernumber = '722687'
--
--
----select distinct c.ndc  from  pharmacymaster..ca_priceprotection   c
----left outer join
----(select * from  pharmacymaster..ca_priceprotection   c
----left outer join
----(
----	select * from  tmp_PPCompare
----)t
----on c.ndc = t.ndc and c.customernumber = t.customer_no and 
----c.unitselldlr = t.aapunitcost
---- where customer_no is null and  date = '11/01/2014'
----and priceprotectionduetodate != 0
----
----	select * from  tmp_PPCompare
----)t
----on c.ndc = t.ndc and c.customernumber = t.customer_no and 
----c.unitselldlr = t.aapunitcost
---- where customer_no is null and  date = '11/01/2014'
----and priceprotectionduetodate != 0
--
--select * from  pharmacymaster..ca_priceprotection   c
--left outer join
--(
--	select * from  tmp_PPCompare
--)t
--on c.ndc = t.ndc and c.customernumber = t.customer_no and 
--c.unitselldlr = t.aapunitcost
-- where customer_no is null and  date = '11/01/2014'
--and priceprotectionduetodate > 0
--
--	select * from  tmp_PPCompareall where customer_no = '001055' and ndc = '00406012401'
--
--select * from tmp_PPNDCUnion where  ndc = '00406012401'
--
---------- QA for purchases 
--
--select * from  pharmacymaster..ca_priceprotection where date = '11/01/2014' and priceprotectionduetodate = 0
--
--select * from  tmp_PPCompare where   aappriceprotectionduetodate = 0
--
----select * from (
----select customer_name,customer_no,ndc , unit_cost  ,sum(ship_qty) as ship_qty FROM
----	(
----		select t.customer_name,t.customer_no, t.ndc ,abs(unit_cost) as unit_cost  ,inv_date,
----			sum(ship_qty) as ship_qty  from tmp_pppurchasesvalidUpdated t
----		join
----		(
----		  select * from tmp_ppcompare where AAPPrev3MonthUsage != 0 and AAPPriceProtectionDueToDate != 0
----		 ) p 
----		on t.customer_no = p.customer_no and t.ndc = p.ndc and t.unit_cost = AAPUnitCost 
----		where   month(inv_date) = 09 and month(AAPEffectDate) = 09
----		group by t.customer_name,t.customer_no,t.ndc , unit_cost,inv_date
----	) ch group by ch.customer_name,ch.customer_no,ch.ndc , ch.unit_cost 
----)bs
----left join
----(
----select * from   ca_PurchasesJoshSept
----) j on  bs.customer_no = j.customernumber and bs.ndc = j.ndc and bs.unit_cost 
----= j.unitselldlr
---- where ship_qty > 0 and customername is null 
------where customer_no is null
----
----select * from   ca_PurchasesJoshSept j where customernumber not in
----(
------select customer_name,customer_no,ndc , unit_cost  ,sum(ship_qty) as ship_qty FROM
----select customer_no   FROM
----
----	(
----		select t.customer_name,t.customer_no, t.ndc ,abs(unit_cost) as unit_cost  ,inv_date,
----			sum(ship_qty) as ship_qty  from tmp_pppurchasesvalidUpdated t
----		join
----		(
----		  select * from tmp_ppcompare where AAPPrev3MonthUsage != 0 and AAPPriceProtectionDueToDate != 0
----		 ) p 
----		on t.customer_no = p.customer_no and t.ndc = p.ndc and t.unit_cost = AAPUnitCost 
----		where   month(inv_date) = 09 and month(AAPEffectDate) = 09
----		group by t.customer_name,t.customer_no,t.ndc , unit_cost,inv_date
----	) ch group by ch.customer_name,ch.customer_no,ch.ndc , ch.unit_cost 
----) and totalSeptPurchases > 0
END

GO
