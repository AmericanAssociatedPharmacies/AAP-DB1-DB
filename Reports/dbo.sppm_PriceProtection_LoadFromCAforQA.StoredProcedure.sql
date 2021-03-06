USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_PriceProtection_LoadFromCAforQA]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


-- =============================================
-- Author:		Joni Wilson
-- Create date: 9/23/2014
-- Description:	QA Cardinal   Price Protection  
-- =============================================
CREATE PROCEDURE [dbo].[sppm_PriceProtection_LoadFromCAforQA] 
	-- Add the parameters for the stored procedure here
	(@in_month varchar(02) , @in_year varchar(04))
AS
 

BEGIN

DECLARE @SQL varchar(max);

--Variables used for dealing with NDC dates
DECLARE @curr_months_prev varchar(max); --used for getting Prior NDC month when current month is  January 
DECLARE @curr_year_prev varchar(max); --used for getting Prior NDC year
DECLARE @prev_month_prior varchar(max);--used for getting Prior NDC month when current month isn't January 
SET @prev_month_prior = @in_month -1; 
SET @curr_year_prev = @in_year -1;

--Variables used for dealing with Prior 3 months purchases (based on effective date of Price Increase)
DECLARE @3months varchar(max); -- this will actually be 4 months as it is from the effective date - which could start or end in current invoice month
                               -- used when  prior 3 months is all in current year
DECLARE @prev_3months varchar(max); -- used when you need to go back a year for prior 3 months
                                    -- this will actually be 4 months as it is from the effective date - which could start or end in current invoice month
DECLARE @prev_3year varchar(04);
SET @prev_3year = @in_year -1;


SET ARITHABORT OFF 
SET ANSI_WARNINGS OFF




IF(@in_month = '01' or @in_month = '1')
	BEGIN
	--	SET @curr_months = '01';
		SET @curr_months_prev = '12';
		SET @prev_3months = '(''09'',''10'',''11'',''12'')';	
		 
	END

IF(@in_month = '02' or @in_month = '2')
	BEGIN
		SET @3months = '(''01'')';
		SET @prev_3months = '(''10'',''11'',''12'')';
	END
IF(@in_month = '03' or @in_month = '3')
	BEGIN
		SET @3months = '(''01'',''02'')';
		SET @prev_3months = '(''11'',''12'')';
	END
IF(@in_month = '04' or @in_month = '4')
	BEGIN
		SET @3months ='(''01'',''02'',''03'')';	
		SET @prev_3months = '(''12'')';	
 	END

IF(@in_month = '05' or @in_month = '5')
	BEGIN
		SET @3months ='(''01'',''02'',''03'',''04'')';		
 	END

IF(@in_month = '06' or @in_month = '6')
	BEGIN
		SET @3months ='(''02'',''03'',''04'',''05'')';		
 	END
IF(@in_month = '07' or @in_month = '7')
	BEGIN
		SET @3months ='(''03'',''04'',''05'',''06'')';		
 	END
IF(@in_month = '08' or @in_month = '8')
	BEGIN
		SET @3months ='(''04'',''05'',''06'',''07'')';		
 	END
IF(@in_month = '09' or @in_month = '9')
	BEGIN
		SET @3months ='(''05'',''06'',''07'',''08'')';		
 	END
IF(@in_month = '10')
	BEGIN
		SET @3months ='(''06'',''07'',''08'',''09'')';		
 	END
IF(@in_month = '11')
	BEGIN
		SET @3months ='(''07'',''08'',''09'',''10'')';		
 	END
IF(@in_month = '12')
	BEGIN
		SET @3months ='(''08'',''09'',''10'',''11'')';		
 	END
--
----
---- Get NDC's that qualify
----
--
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPNDC')
		 BEGIN
          DROP TABLE tmp_PPNDC
         END

 
SET @SQL =
' SELECT * INTO tmp_PPNDC FROM '+
' ( '+
        ' SELECT * from PharmacyMaster..CASourceContractMO where month([EffectDte]) = '+@in_month +
		' and year([EffectDte]) = '+ @in_year +' and ([ChangeType]) = ''Price Increase'''  +
		' and (( ([NewPrice] - [OldPrice] )/ [OldPrice] ) >= 0.20) '+
 ' )pp ';
 
EXEC (@SQL);

---NDC Prior Month (need this as the Effective date for a Price Increase may have started in previous month)
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPNDCPrior')
		 BEGIN
          DROP TABLE tmp_PPNDCPrior
         END
 

SET @SQL = 
	' SELECT * INTO tmp_PPNDCPrior from '+
	'( '+
       ' SELECT   * FROM PharmacyMaster..CASourceContractMO where ([ChangeType]) = ''Price Increase'''  +
		' and (( ([NewPrice] - [OldPrice] )/ [OldPrice] ) >= 0.20) ';

		IF(@in_month = '1' or  @in_month = '01') -- Here the month we're dealing with is January so previous month is December of previous year
			BEGIN
			SET @SQL = @SQL +   '  and (month([EffectDte]) = '+ @curr_months_prev +' and year([EffectDte]) = '+ @curr_year_prev +'  )  ';
			END
		ELSE -- Here the month we're dealing with is not January so previous month is wil be in current year
			BEGIN
			SET @SQL = @SQL + ' and ( month([EffectDte]) =  ' + @prev_month_prior + ' and year([EffectDte]) = ' + @in_year +  ')';
			END
	SET @SQL = @SQL + ' )pp ';

EXEC (@SQL);

--Here we are joining the current NDC table with the previous months NDC table
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPNDCUnion')
		 BEGIN
          DROP TABLE tmp_PPNDCUnion
         END

 
SET @SQL =
' SELECT * INTO tmp_PPNDCUnion FROM '+
' ( '+
 		
		' select * from tmp_PPNDC '+
		' union '+
		' select * from tmp_PPNDCPrior  '+
 ' )pp ';
 
EXEC (@SQL);
--------END NEW STUFF


----Get purchases for month were interested for the ndc's that had an increase 
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPPurchases')
		 BEGIN
          DROP TABLE tmp_PPPurchases
         END

SET @SQL = 
	' SELECT * INTO tmp_PPPurchases FROM '+
	' ( '+
	'	SELECT   * FROM purchases..chph_aap where  '+
 	'	month(inv_date) = '+@in_month +' and year(inv_date) = '+ @in_year +' and (( ndc in (select distinct ndc from tmp_PPNDCUnion)     '+
    '   or ndc in (''00406036501'',''00406036505'',''00406036601'',''00406036705''))) ' +
	--'	and contractdesc in (''AAP TOP-GENERICS SOURCE'', ''AAP SOURCE'') ' + --changed 8/10/2017 to include nbg contracts
    --' and type in (''B'',''R'',''D'',''C'')' +
	--changing to contractno rather than contract desc
	' and contractno in (73245, 73246, 25676, 66684, 29731, 25677, 66685) ' +
   ' and (type in (''B'',''R'',''D'',''C'') or (type = ''I'' and contractdesc = ''AAP SOURCE'')) )pp ';

	--' )pp ';

EXEC (@SQL);

----Get purchases for prior month so we can deduct any returns from the current months valid Price Protection purchases
----This is done in the sppm_PriceProtection_QA_DYN stored proc

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPPurchasesPrior')
		 BEGIN
          DROP TABLE tmp_PPPurchasesPrior
         END

SET @SQL = 
	' SELECT * INTO tmp_PPPurchasesPrior FROM '+
	' ( '+
	'	SELECT   * FROM purchases..chph_aap where  '+
 	'	 (( ndc in (select distinct ndc from tmp_PPNDCPrior)     '+
    '    or ndc in (''00406036501'',''00406036505'',''00406036601'',''00406036705''))) ' ;
    IF(@in_month = '1' or  @in_month = '01') -- Here the month we're dealing with is January so previous month is December of previous year
			BEGIN
			SET @SQL = @SQL +   ' and  month(inv_date) = ' + @curr_months_prev + ' and year(inv_date) = ' + @curr_year_prev ;
			END
   ELSE
         BEGIN
			SET @SQL = @SQL +   ' and  month(inv_date) = ' + @prev_month_prior + ' and year(inv_date) = ' + @in_year ;
		END
--	SET @SQL = @SQL + ' )pp ';
	--SET @SQL = @SQL + ' and contractdesc in (''AAP TOP-GENERICS SOURCE'', ''AAP SOURCE'',''AAP SOURCE BACKUP'') and type in (''B'',''R'',''D'',''C'') )pp ';

    --Changed 09/12/2016 jmw Changed back 9/18/2017
	--changed 9/8/2017 to include nbg contracts
	SET @SQL = @SQL + ' and contractno in (73245, 73246, 25676, 66684, 29731, 25677, 66685) and ' +
    ' (type in (''B'',''R'',''D'',''C'') or (type = ''I'' and contractdesc = ''AAP SOURCE'')) )pp ';


EXEC (@SQL);


--
---- Pull the three months prior purchases - because the 3 months prior is from the Effective Date of the Price Increase
---- you actually have to pull the prior 4 months becuase the Effective Date of the price increase could be in the prior month of
---- the invoice date
----


IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPPurchases3MoPrior')
		 BEGIN
          DROP TABLE tmp_PPPurchases3MoPrior
         END
 
SET @SQL = 
	' SELECT * INTO tmp_PPPurchases3MoPrior from '+
	'( '+
		' SELECT   * FROM purchases..chph_aap where (ndc in (select distinct ndc from tmp_PPNDCUnion) ' +
    '    or ndc in (''00406036501'',''00406036505'',''00406036601'',''00406036705'')) ' ;

		IF(@in_month = '01')
			BEGIN
         	SET @SQL = @SQL + '	and ( month(inv_date) in '+ @prev_3months +' and year(inv_date) = '+ @prev_3year +'  ) ';
                  
			END
        IF(@in_month = '02' or @in_month = '03' or @in_month = '04')
			BEGIN
			SET @SQL = @SQL + '	and ( ( month(inv_date) in ' + @3months + ' and year(inv_date) = ' + @in_year +
                          '  ) or '+ 
						  ' ( month(inv_date) in '+ @prev_3months +' and year(inv_date) = '+ @prev_3year +'  )) ';
			END
		IF(@in_month != '01'  and @in_month != '02' and @in_month != '03' and @in_month != '04' )
			BEGIN
			SET @SQL = @SQL + ' and ( month(inv_date) in  ' + @3months + ' and year(inv_date) = ' + @in_year +  ')';
			END
	    
--	SET @SQL = @SQL + ' )pp ';
--	SET @SQL = @SQL + 'and contractdesc in (''AAP TOP-GENERICS SOURCE'', ''AAP SOURCE'',''AAP SOURCE BACKUP'')and type in (''B'',''R'',''D'',''C'') )pp ';
    --Changed 09/12/2016 jmw Changed back 9/18/2017
	--added AAP SOURCE BACKUP
	--Edited 09-08-2017 to include NBG contracts
	--added PSB Exluded 58705 4/19/2018
	SET @SQL = @SQL + ' and contractno in (73245, 73246, 25676, 66684, 29731, 25677, 66685, 53114, 53112, 53113, 58705) and ' + 
    ' (type in (''B'',''R'',''D'',''C'') or (type = ''I'' and contractdesc = ''AAP SOURCE'')) )pp ';


 print @sql
EXEC (@SQL);
 
 
---- Here is where I'll want to map the old ndc in the 2 purchases file to the new ndc's
--00406012301 - Old NDC: 00406036501
--00406012305 - Old NDC: 00406036505
--00406012401 - Old NDC: 00406036601
--00406012501 - Old NDC: 53746011001
--00406012505 - Old NDC: 00406036705
--

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPPurchases_BKP')
		 BEGIN
          DROP TABLE tmp_PPPurchases_BKP
         END

IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPPurchases3MoPrior_BKP')
		 BEGIN
          DROP TABLE tmp_PPPurchases3MoPrior_BKP
         END
 
select * into tmp_PPPurchases_BKP from tmp_PPPurchases
select * into tmp_PPPurchases3MoPrior_BKP from tmp_PPPurchases3MoPrior
----
---- ----Do same for tmp_PPPurchases3MoPrior
update tmp_PPPurchases set ndc = '00406012301' where ndc = '00406036501'

update tmp_PPPurchases set ndc = '00406012305' where ndc = '00406036505'

update tmp_PPPurchases set ndc = '00406012401' where ndc = '00406036601'

update tmp_PPPurchases set ndc = '00406012505' where ndc = '00406036705'
--
update tmp_PPPurchases3MoPrior set ndc = '00406012301' where ndc = '00406036501'

update tmp_PPPurchases3MoPrior set ndc = '00406012305' where ndc = '00406036505'

update tmp_PPPurchases3MoPrior set ndc = '00406012401' where ndc = '00406036601'

update tmp_PPPurchases3MoPrior set ndc = '00406012505' where ndc = '00406036705'

 
-- Now get only the valid purchases - those with invdate >= to effective date of price change 
-- and invdate <= 30 days from effective date of price change for that NDC
-- Also want to pull in returns - here is one place I will use order no for returns when I get it.
 
--- END UNCOMMENT
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPPurchasesVerified')
		 BEGIN
          DROP TABLE tmp_PPPurchasesVerified
         END
-- In the first part of  the union I match the purchases with the NDC's from the tmp_PPNDC (current month NDC's) where the purchases
-- invoice date are greater than or equal to the matched ndc effective date - I do a min as there may be more than one of the same ndc
-- where the price increase was >= 20%
-- Then I union to the purchases with the NDC's from the prior months NDC's - where the purchases invoice date is less than or equal to
-- NDC's effective date plus 30 days ( I put an 'and' in there to make  sure that the month of the NDC's effective date plus 30 days 
-- falls within the current month ). Also I do not pull in returns here
-- The NDC's effective date plus 30 days is effecitvely the end of the price increase 


SET @SQL = 
 ' SELECT *  into tmp_PPPurchasesVerified 	 from ( '+
 	' SELECT *    from tmp_PPPurchases t where inv_date >= (select min([EffectDte]) from tmp_PPNDC  where  '+

	 ' t.ndc = ndc)    '+
     -- added this one line
           ' and  type != ''R'' '+
     ' UNION    '+
	  ' SELECT *    from tmp_PPPurchases t where inv_date <= (select DATEADD (day , 30 ,  max([EffectDte] ))  '+ 
        ' from tmp_PPNDCPrior where     '+
       ' t.ndc = ndc  and MONTH (DATEADD (day , 30 ,   ([EffectDte] ))) = ' +@in_month +' )  '+
      -- added this one line
           ' and  type != ''R'' '+
  ' UNION '+
 -- Below is where I pull in any purchases that had a  Price Decreases for NDC's that also had a Price Increase and where
-- the Price Decrease effective date occurred after the purchase invoice date and before the end of the Price Increase effective date
 ' SELECT distinct  t.*    from tmp_PPPurchases t '+
		' join( '+
			    ' SELECT  [EffectDte],ndc from PharmacyMaster..CASourceContractMO d where [ChangeType] = ''Price Decrease''   '+
                 
                 '   and d.[EffectDte] >=  (select  max([EffectDte])   from PharmacyMaster..CASourceContractMO where  '+
                 '     d.ndc = ndc and '+
                 '   [ChangeType] = ''Price Increase'' ) '+
               
			' )pd '+
			' on t.ndc= pd.ndc where t.inv_date >=  pd.[EffectDte] '+
           -- added this one line
           ' and  type != ''R'' '+
            ' and  '+
             ' t.inv_date <= (select DATEADD (day , 30 ,   (select  max([EffectDte])   from PharmacyMaster..CASourceContractMO  where  '+
            '         pd.ndc = ndc and  [ChangeType] = ''Price Increase'' ) ))  '+                  
	' UNION  '+
-- This section below is where I pull the returns from both the purchases whose effective date were in  the current month and those whose effective
-- date was in the prior month.  I pull in those returns first using a min on effective date in the NDC table - the invoice date of the 
-- return has to be > - the effective date of the min effective date.  
-- Then I union the purchases of type return with the NDC's from the prior month where the invoice date of the return is
-- less than effective date + plus 30 days of the NDC's effective date.  
     '  SELECT distinct r.* from tmp_PPPurchases r  '+
	 '  join '+
	 '  ('+
	 	   ' 	 SELECT *    from tmp_PPPurchases t where inv_date >= (select min([EffectDte]) from tmp_PPNDC  where  '+

	'   t.ndc = ndc)     '+
     -- added this one line
         '     and  type != ''R'' '+ 
      '  UNION    '+
	  '  SELECT *    from tmp_PPPurchases t where inv_date <= (select DATEADD (day , 30 ,  max([EffectDte] )) '+
       '   from tmp_PPNDCPrior where   '+ 
      '   t.ndc = ndc  and MONTH (DATEADD (day , 30 ,   ([EffectDte] ))) =    ' +@in_month +' ) '+ 
      -- added this one line
      '        and  type != ''R'' '+ 
 
   '  )t on  t.customer_no = r.customer_no and r.ndc = t.ndc and r.orderno = t.orderno '+ 
	  '  and  r.inv_date >= t.inv_date and abs(r.unit_cost)  = t.unit_cost where r.type = ''R'' ' +
 
' )pp ';
EXEC (@SQL);
--Need to put this in to make sure they had purchases in prior 3 months -- pu in another table
 
IF EXISTS(SELECT name FROM sys.tables
			 WHERE name = 'tmp_PPPurchasesValid')
		 BEGIN
          DROP TABLE tmp_PPPurchasesValid
         END



--	SELECT * INTO tmp_PPPurchasesValid from
--	(
--	 SELECT *    from tmp_PPPurchasesVerified t   
--			 WHERE ndc in (SELECT ndc from tmp_PPPurchases3MoPrior WHERE t.customer_no = customer_no   
--			  and ndc = t.ndc and    inv_date  >=  
--        (  select cast(  month (dateadd(month,-3, ( select max([EffectDte])))) as varchar(2)) + '/01/' +
--   cast(  year (dateadd(month,-3, ( select max([EffectDte])))) as varchar(4)) from tmp_ppNDCUnion where t.ndc = ndc  )
--          and  inv_date  <  (  select cast(  month (dateadd(month,0, ( select max([EffectDte])))) as varchar(2)) + '/01/' +
--   cast(  year (dateadd(month,0, ( select max([EffectDte])))) as varchar(4)) from tmp_ppNDCUnion 
--
-- where t.ndc = ndc ))	      
--)pp

-- This uses the temp table created in the step above - tmp_PPPurchasesVerified. 
-- It only pulls the purchases from tmp_PPPurchasesVerified that had one or more purchases in the  tmp_PPPurchases3MoPrior 
-- where the invoice month in the tmp_PPPurchases3MoPrior is greater than equal the current purchase month minus 3 months
-- and the invoice month in the tmp_PPPurchases3MoPrior is less than the current purchase month.

--Changed max to min 07/11/2016
	SELECT * INTO tmp_PPPurchasesValid from
	(
	 SELECT *    from tmp_PPPurchasesVerified t   
			 WHERE ndc in (SELECT ndc from tmp_PPPurchases3MoPrior WHERE t.customer_no = customer_no   
			  and ndc = t.ndc and    inv_date  >=  
        (  select cast(  month (dateadd(month,-3, ( select min([EffectDte])))) as varchar(2)) + '/01/' +
   cast(  year (dateadd(month,-3, ( select min([EffectDte])))) as varchar(4)) from tmp_ppNDCUnion where t.ndc = ndc  )
          and  inv_date  <  (  select cast(  month (dateadd(month,0, ( select max([EffectDte])))) as varchar(2)) + '/01/' +
   cast(  year (dateadd(month,0, ( select max([EffectDte])))) as varchar(4)) from tmp_ppNDCUnion 

 where t.ndc = ndc ))	      
)pp

END
 

GO
