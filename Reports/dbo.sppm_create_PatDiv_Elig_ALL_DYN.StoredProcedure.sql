USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_PatDiv_Elig_ALL_DYN]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/09/2011>
-- Description:	 Create table for All Pat Div - dynamic version
-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_PatDiv_Elig_ALL_DYN]
 (@in_year varchar(4))
 
AS
BEGIN



-- First step create base table
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_PatDivPrep_EligAll')
 BEGIN
  DROP TABLE tmp_PatDivPrep_EligAll
 END

DECLARE @mcDate varchar(10);
SET @mcDate = '12/31/' + @in_year;

DECLARE @SQL   varchar(max);
 

SET @SQL = ' SELECT * into Reports..tmp_PatDivPrep_EligAll from ( '+
	' SELECT  p.PMID,p.AccountName,p.AAPAccountNo,p.AAPParentNo,p.UDAccountNo,p.APIAccountNo,p.Affiliate ,AAPEffectiveDate ,p.AAPQuitDate, '+
	' case when ((chaincode is not null and (mcquitdate is null or mcquitdate > ''' + @mcDate + ''')) and  mceffectivedate <= ''' + @mcDate + ''') '+
	' or(  chaincode is not null and  mcquitdate is null and mceffectivedate is null) then ''Yes'' else ''No'' end as [Is MC],MCQuitDate, '+
	' cast(0 as numeric(38,2)) as [ML Admin Fee], '+
    ' cast(0 as numeric(38,2)) as [Bashas Admin Fee], '+
    ' cast(0 as numeric(38,2)) as  [HIGH VOL INCENTIVE], '+
	' cast(0 as numeric(38,2)) as [AAP PVA Vol Admin Fee], '+	
    ' cast(0 as numeric(38,2)) as [AAP PVA Vol Admin Fee Retained], '+
    ' cast(0 as numeric(38,2)) as [AAP PVA Gen Admin Fee], '+
    ' cast(0 as numeric(38,2)) as [AAP PVA Gen Admin Fee Retained], '+
   ' cast(0 as numeric(38,2)) as [IPA Generic Admin Fee], '+
    'cast(0 as numeric(38,2)) as [Cardinal Annual Rebate] , '+
	' cast(0 as numeric(38,2)) as [WH Brand ' + @in_year + '],cast(0 as numeric(38,2)) as [WH Gen ' + @in_year + '], '+
    ' cast(0 as numeric(38,2)) as[WH OTC ' + @in_year + '], '+
    ' cast(0 as numeric(38,2)) as[WH OTC Excluded ' + @in_year + '], '+
	' cast(0 as numeric(38,2)) as [WH Total ' + @in_year + ']  '+
    ' from pharmacymaster..v_PM_AllWithAffiliates p ' + 
    ' )ch ';

print @SQL;
EXEC (@SQL);

-- Now we need to update WH totals by pmid using the eligible months
  

SET @SQL = 'UPDATE p set   '+
	       ' [WH Brand ' + @in_year + '] = whapibrand,  '+
		   ' [WH Gen ' + @in_year + '] = whapigeneric,  '+
		   ' [WH OTC ' + @in_year + '] = whapiotc,  '+
		   ' [WH Total ' + @in_year + '] = whapibrand + whapigeneric + whapiotc  '+
		   ' FROM   Reports..tmp_PatDivPrep_EligAll p    '+
		 ' INNER JOIN    '+
		 ' (   '+
		 ' 	SELECT sum(whapibrand) as whapibrand ,sum(whapigeneric) as whapigeneric ,sum(whapiotc) as whapiotc, v.pmid   from pharmacymaster..all_volume  v  '+
         '  JOIN pharmacymaster..v_PM_AllWithAffiliates p on v.pmid = p.pmid  '+
		 '  WHERE   year(date) = ' + @in_year + ' group by v.pmid  '+

		 ' ) vol '+
		 ' on p.pmid = vol.pmid   ';
EXEC (@SQL);	
				 
	  


--**************NEW CODE TO INCLUDE HIGH VOLUME
SET @SQL = 'UPDATE p set  '+
		   ' [AAP PVA Vol Admin Fee Retained] = feeRetained, '+
           ' [AAP PVA Vol Admin Fee] = fee,  '+
           ' [HIGH VOL INCENTIVE] = highvolinc'+
	       ' FROM   Reports..tmp_PatDivPrep_EligAll p '+
		 ' INNER JOIN '+  
		 ' (   '+
         '  SELECT r.pmid, '+
         '  sum((AAPVolumeAdminFee + volAdminFeeAdj))  - sum(dbo.HighVolPaidToAffCalc(([High Volume Incentive] -[1% Generic Admin]),(AAPVolumeAdminFeePaidToAffiliate + affilAdminFeeAdj))) as feeRetained, '+
         '  sum((AAPVolumeAdminFee + volAdminFeeAdj)) as fee ,'+
         '  sum([High Volume Incentive]) as highvolinc '+
         '  FROM pharmacymaster..PM_REBATES_CHAAP r '+
         ' left join '+
		 ' (SELECT * from pharmacymaster..PM_Rebates_HighVolume '+
		 '	      ) h '+
	     '           on r.pmid = h.pmid and year(r.date) =  year(h.date) and month(r.date) =  month(h.date) '+
		 '	WHERE   year(r.date) = ' + @in_year + '  group by r.pmid    '+
		 ' ) vol ' + 
		 '  on p.pmid = vol.pmid  ';
EXEC (@SQL);

--Updated from Bruces AAP table with the AAP Admin Generic -- this is wrong will need to redo


 SET @SQL = 'UPDATE p set  '+
		    ' [AAP PVA Gen Admin Fee Retained] = feeRetained, '+
            ' [AAP PVA Gen Admin Fee] = fee  '+ 
  
	        ' FROM   tmp_PatDivPrep_EligAll p  '+
		 	' INNER JOIN '+ 
		 	' (    '+ 
            '  	SELECT r.pmid, '+
            '   sum(AAPGenericAdminFee + GenericAdminFeeAdj)  - isnull(sum([1% Generic Admin] + AAPGenericAdminFeePaidToPipco),0) as feeRetained, '+
            '    sum(AAPGenericAdminFee + GenericAdminFeeAdj) as fee '+
            '    FROM pharmacymaster..PM_REBATES_CHAAP r '+
          
          ' left join '+
		 ' (SELECT * from pharmacymaster..PM_Rebates_HighVolume '+
		 '	      ) h '+
	     '           on r.pmid = h.pmid and year(r.date) =  year(h.date) and month(r.date) =  month(h.date) '+
			'	JOIN pharmacymaster..v_PM_AllWithAffiliates p on r.pmid = p.pmid '+

			'	WHERE   year(r.date) = ' + @in_year + '   group by r.pmid,p.affiliate  '+

		 	' ) vol '+
		    ' on p.pmid = vol.pmid  ';
 EXEC (@SQL);


-------------------------------------

--[IPA Generic Admin Fee]
 SET @SQL = 'UPDATE p set  '+
            ' [IPA Generic Admin Fee] = fee  '+ 
  
	        ' FROM   tmp_PatDivPrep_EligAll p  '+
		 	' INNER JOIN '+ 
		 	' (    '+ 
            '  	SELECT r.pmid, '+
            '    sum(IPAGenericAdminFee) as fee '+
            '    FROM pharmacymaster..PM_REBATES_CHAAP r '+
			'	JOIN pharmacymaster..v_PM_AllWithAffiliates p on r.pmid = p.pmid '+
			'	WHERE   year(date) = ' + @in_year + '   group by r.pmid,p.affiliate  '+

		 	' ) vol '+
		    ' on p.pmid = vol.pmid  ';
 EXEC (@SQL);
---


 SET @SQL = ' UPDATE p set  '+
		    ' [ML Admin Fee] = fee '+
 
	        ' FROM   tmp_PatDivPrep_EligAll p  '+
		 	' INNER JOIN  '+
		 	' (   '+
			' SELECT round(sum(totalrebate)  ,2)  as fee ,v.pmid,aapeffectivedate,aapquitdate '+
			' FROM  pharmacymaster..miamiluken v inner join pharmacymaster..v_pm_withdeleted on v.pmid =   v_pm_withdeleted.pmid '+
			' WHERE '+
			'  year(date)  = ' + @in_year +'  group by v.pmid ,aapeffectivedate,aapquitdate'+
          	' ) vol  '+
		    ' on p.pmid = vol.pmid  ';
 EXEC (@SQL);


--- Update with Bashas Admin fee 

  SET @SQL = ' UPDATE p set  '+
		     ' [Bashas Admin Fee] = fee '+
	         ' FROM   tmp_PatDivPrep_EligAll p  '+
		 	 ' inner join  '+
		 	 ' (   '+
             ' 	select b.pmid  , sum(adminfee) as fee from Purchases..PM_CH_Bashas b '+
			 '	join pharmacymaster..pm_pharmacy p on b.pmid = p.pmid '+
			 '	where   year(date) = ' + @in_year +'  group by b.pmid  '+
		 	 ' ) vol '+
		     ' on p.pmid = vol.pmid  ';
   EXEC (@SQL);


--Update OTC Excldued 

   SET @SQL = ' Insert into tmp_PatDivPrep_EligAll  values( '+
              ' 900000,''No PMID'','''','''','''','''','''',cast(null as datetime),cast(null as datetime),'''',cast(null as datetime),0,0,0,0,0,0,0,0,0,0,0,0,0,0) ';
   
   EXEC (@SQL);
   SET @SQL = ' 	UPDATE  su  set '+
			  ' [WH OTC Excluded ' + @in_year + '] = vol.otc  '+
	          ' FROM tmp_PatDivPrep_EligAll   su '+
		      ' inner join '+
			  ' (  select  sum(whapiotc) as otc ,pmid from pharmacymaster..all_volume where  '+
              '   year(date) = ' + @in_year +' and pmid = 900000 group by pmid) vol '+
	          ' on su.pmid = vol.pmid '+
              ' where su.pmid = 900000 ';
   EXEC (@SQL);


-------------------------------------------------------------------------------------------------------------------


--- Cardinal Admin Fee
update Reports..tmp_PatDivPrep_EligAll  set 	[Cardinal Annual Rebate] = 0.0

------GOOD ONE -- UNCOMMENT WHEN WE GET NEW CARDINAL ANNUAL REBATE FILE
--2014
 
-- In the formula below the 1624758.55 is the sum of the annualadminfee from  pharmacymaster..PM_CH_AnnualAdminFee_2014_pivot 
-- The 3583315052.58 is the sum of the extsalestotal from  pharmacymaster..PM_CH_AnnualAdminFee_2014_pivot  where  extsalestotal > 0
-- The pharmacymaster..PM_CH_AnnualAdminFee_2014_pivot table is the excel spreadsheet I get from Betty every year.  I then pivot this
-- by using code like:
--  INSERT  into PM_CH_AnnualAdminFee_2014
--  SELECT '12/01/2014' as date, sum([Dec 2014]) as extsales ,PMID from  PM_CH_AnnualAdminFee_2014_pivot
--  group by PMID
-- I did this for each month - it could probably be put into a stored procedure I just haven't _ I created the PM_CH_AnnualAdminFee_2014
-- from the previous year and truncated it.

--Update p set 
--	[Cardinal Annual Rebate] = annualAdminFee
--     from  Reports..tmp_PatDivPrep_EligAll p   
--	inner join   
--	(   
--     	select c.pmid,  
--
--          case when sum(extsales) <= 0 then 0 else
--         round(sum((extsales /3583315052.58)*1624758.55 ) ,2)
--         end  as annualAdminFee from  pharmacymaster..PM_CH_AnnualAdminFee_2014 c
--         group by pmid  
--     ) vol 
--	on p.pmid = vol.pmid  

DECLARE @extsales money;
DECLARE @annualadminfee money;
SET @extsales = (select sum(extsales) from Reports..import_RebateCAAnnualAdminFeePivot where year = @in_year and 
extsales > 0 );

SET @annualadminfee = (select sum(annualadminfee) from Reports..import_RebateCAAnnualAdminFeePivot where year = @in_year);

UPDATE p set 
	[Cardinal Annual Rebate] = annualAdminFee
     from  Reports..tmp_PatDivPrep_EligAll p   
	inner join   
	(   
	SELECT c.pmid,  

          CASE WHEN sum(extsales) <= 0 THEN 0 ELSE
			round(sum((extsales /@extsales)* @annualadminfee ) ,2)
		  END  as annualAdminFee from  Reports..import_RebateCAAnnualAdminFee c where year(date) = @in_year  
			group by pmid 
   ) vol 
	on p.pmid = vol.pmid  

 ---------------------------------------------


 

--Per Paul need to delete all with no activity

  SET @SQL = ' Delete   from  Reports..tmp_PatDivPrep_EligAll where ' +
	' [ML Admin Fee] = 0 and ' +
	' [Bashas Admin Fee]  = 0 and ' +
	' [HIGH VOL INCENTIVE]  = 0 and ' +
	' [AAP PVA Vol Admin Fee]  = 0 and ' +
	' [AAP PVA Vol Admin Fee Retained]  = 0 and ' +
	' [AAP PVA Gen Admin Fee]  = 0 and ' +
	' [AAP PVA Gen Admin Fee Retained]  = 0 and ' +
	' [Cardinal Annual Rebate]  = 0 and ' +
    ' [IPA Generic Admin Fee]  = 0 and ' +
    ' [WH OTC Excluded ' + @in_year + '] = 0 and ' +
	' [WH Total ' + @in_year + ']  = 0';

   EXEC (@SQL);
END

		 








GO
