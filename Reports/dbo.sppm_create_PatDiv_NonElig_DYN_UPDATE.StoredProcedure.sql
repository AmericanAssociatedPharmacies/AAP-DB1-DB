USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_create_PatDiv_NonElig_DYN_UPDATE]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <05/09/2011>
-- Description:	 Create table for Non eligible Pat Div - dynamic version



-- Update 
-- Dave Bohler 03/26/2019
-- Changing references from ALL volume to an audited table 



-- =============================================
CREATE PROCEDURE [dbo].[sppm_create_PatDiv_NonElig_DYN_UPDATE]
 (@in_year varchar(4))
 
AS
BEGIN



-- First step create base table
 
 IF EXISTS(SELECT name FROM sys.tables
	 WHERE name = 'tmp_PatDivPrep_InElig')
 BEGIN
  DROP TABLE tmp_PatDivPrep_InElig
 END

DECLARE @mcDate varchar(10);
SET @mcDate = '12/31/' + @in_year;

DECLARE @SQL   varchar(max);

SET @SQL = ' SELECT * into Reports..tmp_PatDivPrep_InElig from ( '+
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
    ' cast(0 as numeric(38,2)) as [Cardinal Annual Rebate], '+
	' cast(0 as numeric(38,2)) as [WH Brand ' + @in_year + '],cast(0 as numeric(38,2)) as [WH Gen ' + @in_year + '],cast(0 as numeric(38,2)) as[WH OTC ' + @in_year + '], '+
	' cast(0 as numeric(38,2)) as [WH Total ' + @in_year + '] '+
    '  from pharmacymaster..v_PM_AllWithAffiliates p ' + 
    ' )ch ';

EXEC (@SQL);

-- Now we need to update WH totals by pmid using the eligible months
 
SET @SQL ='UPDATE p set   '+
	       ' [WH Brand ' + @in_year + '] = whapibrand,  '+
		   ' [WH Gen ' + @in_year + '] = whapigeneric,  '+
		   ' [WH OTC ' + @in_year + '] = whapiotc,  '+
		   ' [WH Total ' + @in_year + '] = whapibrand + whapigeneric + whapiotc  '+
		   ' FROM   Reports..tmp_PatDivPrep_EligAll p    '+
		 ' INNER JOIN    '+
		 ' (   '+
		 ' 	SELECT sum([API Brand Sales]) as whapibrand ,sum([API Generic Sales]) as whapigeneric ,sum([API OTC Sales]) as whapiotc, v.pmid   from pharmacymaster..PM_Rebates_APIMonthly  v  '+
         '  JOIN pharmacymaster..v_PM_AllWithAffiliates p on v.pmid = p.pmid  '+
		 '  WHERE   year(date) = ' + @in_year + ' group by v.pmid  '+

		 ' ) vol '+
		 ' on p.pmid = vol.pmid   ';
EXEC (@SQL);	
				 


------------------*************** Update Code to use High Volume

SET @SQL = 'UPDATE p set  '+
		   ' [AAP PVA Vol Admin Fee Retained] = feeRetained, '+
           ' [AAP PVA Vol Admin Fee] = fee,  '+
           ' [HIGH VOL INCENTIVE] = highvolinc '+
	       ' FROM   Reports..tmp_PatDivPrep_InElig p '+
		 ' INNER JOIN '+  
		 ' (   '+
         '  SELECT r.pmid, '+
         '  sum((AAPVolumeAdminFee + volAdminFeeAdj))  - sum(dbo.HighVolPaidToAffCalc(([High Volume Incentive] -[1% Generic Admin]),(AAPVolumeAdminFeePaidToAffiliate + affilAdminFeeAdj))) as feeRetained, '+
         '  sum((AAPVolumeAdminFee + volAdminFeeAdj)) as fee ,'+
         '  sum([High Volume Incentive]) as highvolinc '+
         '  FROM pharmacymaster..PM_REBATES_CHAAP r '+
         ' LEFT JOIN '+
		 '  (SELECT * from pharmacymaster..PM_Rebates_HighVolume '+
		 ' ) h '+
	     '   on r.pmid = h.pmid and year(r.date) =  year(h.date) and month(r.date) =  month(h.date) '+
         ' JOIN pharmacymaster..v_PM_AllWithAffiliates p on r.pmid = p.pmid '+
         '	  WHERE reports.dbo.csfnPatDivDate(r.date,p.aapeffectivedate,p.aapquitdate,' + @in_year + ')= 0 and year(r.date) = ' + @in_year +  
		 '	  and   year(r.date) = ' + @in_year + '  group by r.pmid  ,p.affiliate   '+
		 ' ) vol ' + 
		 '  on p.pmid = vol.pmid  ';
EXEC (@SQL);


--Updated from Bruces AAP table with the AAP Admin Generic 


 SET @SQL = 'UPDATE p set  '+
		    ' [AAP PVA Gen Admin Fee Retained] = feeRetained, '+
            ' [AAP PVA Gen Admin Fee] = fee  '+ 
  
	        ' FROM   tmp_PatDivPrep_InElig p  '+
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
			'	WHERE reports.dbo.csfnPatDivDate(r.date,p.aapeffectivedate,p.aapquitdate,' + @in_year + ')= 0  and year(r.date) = ' + @in_year + '   group by r.pmid,p.affiliate  '+

		 	' ) vol '+
		    ' on p.pmid = vol.pmid  ';
 EXEC (@SQL);


-------------------------------------

--[IPA Generic Admin Fee]
 SET @SQL = 'UPDATE p set  '+
            ' [IPA Generic Admin Fee] = fee  '+ 
  
	        ' FROM   tmp_PatDivPrep_InElig p  '+
		 	' INNER JOIN '+ 
		 	' (    '+ 
            '  	SELECT r.pmid, '+
            '    sum(IPAGenericAdminFee) as fee '+
            '    FROM pharmacymaster..PM_REBATES_CHAAP r '+
			'	JOIN pharmacymaster..v_PM_AllWithAffiliates p on r.pmid = p.pmid '+
	    	'	WHERE reports.dbo.csfnPatDivDate(date,p.aapeffectivedate,p.aapquitdate,' + @in_year + ')= 0  and year(date) = ' + @in_year + '   group by r.pmid,p.affiliate  '+


		 	' ) vol '+
		    ' on p.pmid = vol.pmid  ';
 EXEC (@SQL);



 SET @SQL = ' UPDATE p set  '+
		    ' [ML Admin Fee] = fee '+
 
	        ' FROM   tmp_PatDivPrep_InElig p  '+
		 	' INNER JOIN  '+
		 	' (   '+
			' SELECT round(sum(totalrebate)  ,2) as fee ,v.pmid,aapeffectivedate,aapquitdate '+
			' FROM  pharmacymaster..miamiluken v inner join pharmacymaster..v_pm_withdeleted on v.pmid =   v_pm_withdeleted.pmid '+
			' WHERE reports.dbo.csfnPatDivDate(date,aapeffectivedate,aapquitdate,' + @in_year +')= 0 '+
			' and year(date)  = ' + @in_year +'    group by v.pmid ,aapeffectivedate,aapquitdate'+
          	' ) vol  '+
		    ' on p.pmid = vol.pmid  ';
 EXEC (@SQL);

-- I did an Update for the Bashas Admin fee 
  SET @SQL = ' UPDATE p set  '+
		     ' [Bashas Admin Fee] = fee '+
	         ' FROM   tmp_PatDivPrep_InElig p  '+
		 	 ' inner join  '+
		 	 ' (   '+
             ' 	select b.pmid  , sum(adminfee) as fee from Purchases..PM_CH_Bashas b '+
			 '	join pharmacymaster..pm_pharmacy p on b.pmid = p.pmid '+
			 '	where reports.dbo.csfnPatDivDate(date,p.aapeffectivedate,p.aapquitdate,' + @in_year +')= 0  '+
             '    and year(date) = ' + @in_year +'  group by b.pmid  '+

		 	 ' ) vol '+
		     ' on p.pmid = vol.pmid  ';
   EXEC (@SQL);

-------------------------------------------------------------------------------------------------------------------

--------------Update annual admin fee  - Cant do until end of year



update Reports..tmp_PatDivPrep_InElig  set 	[Cardinal Annual Rebate] = 0.0
 

----GOOD ONE --UNCOMMENT THIS WHEN WE GET THE NEW CARDINAL ANNUAL ADMIN FEE FILE
DECLARE @extsales money;
DECLARE @annualadminfee money;
SET @extsales = (select sum(extsales) from Reports..import_RebateCAAnnualAdminFeePivot where year = @in_year and 
extsales > 0 );

SET @annualadminfee = (select sum(annualadminfee) from Reports..import_RebateCAAnnualAdminFeePivot where year = @in_year);


UPDATE p set 
	[Cardinal Annual Rebate] = annualAdminFee
     from  Reports..tmp_PatDivPrep_InElig p   
	inner join   
	(   
	SELECT distinct c.pmid,  

          CASE WHEN sum(extsales) <= 0 THEN 0 ELSE
			round(sum((extsales /@extsales)* @annualadminfee ) ,2)
		  END  as annualAdminFee from  Reports..import_RebateCAAnnualAdminFee c  
		  join pharmacymaster..pm_pharmacy p on c.pmid = p.pmid 
				where reports.dbo.csfnPatDivDate(date,p.aapeffectivedate,p.aapquitdate, @in_year )= 0  
              and year(c.date) = @in_year group by c.pmid WITH ROLLUP 
   ) vol 
	on p.pmid = vol.pmid  


-- SET @SQL = ' UPDATE p set '+
--	        ' [Cardinal Annual Rebate] =  annualAdminFee   '+
--            ' from  Reports..tmp_PatDivPrep_InElig p   '+
--	        ' inner join   '+
--	        ' (   '+
--     	    ' SELECT distinct c.pmid,  '+         
-- 
--			 '   case when sum(extsales) <= 0 then 0 else  '+
--		     '  round(sum((extsales /3583315052.58)*1624758.55 ) ,2)'+
--             ' end  as annualAdminFee from pharmacymaster..PM_CH_AnnualAdminFee_2014 c  '+
--         
--            ' join pharmacymaster..pm_pharmacy p on c.pmid = p.pmid '+
--			'	where reports.dbo.csfnPatDivDate(date,p.aapeffectivedate,p.aapquitdate,' + @in_year +')= 0  '+
--            ' group by c.pmid WITH ROLLUP'+
--		 
--            ' ) vol '+
--	        ' on p.pmid = vol.pmid  ';
-- EXEC (@SQL);

----round(sum((extsales /3583315052.58)*1624758.55 ) ,2)



--Per Paul need to delete all with no activity

  SET @SQL = ' Delete   from  Reports..tmp_PatDivPrep_InElig where ' +
	' [ML Admin Fee] = 0 and ' +
	' [Bashas Admin Fee]  = 0 and ' +
	' [HIGH VOL INCENTIVE]  = 0 and ' +
	' [AAP PVA Vol Admin Fee]  = 0 and ' +
	' [AAP PVA Vol Admin Fee Retained]  = 0 and ' +
	' [AAP PVA Gen Admin Fee]  = 0 and ' +
	' [AAP PVA Gen Admin Fee Retained]  = 0 and ' +
	' [Cardinal Annual Rebate]  = 0 and ' +
    ' [IPA Generic Admin Fee]  = 0 and ' +
	' [WH Total ' + @in_year + ']  = 0';

   EXEC (@SQL);
END

		 








GO
