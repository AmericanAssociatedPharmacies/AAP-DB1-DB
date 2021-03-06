USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Populate_ALL_Volume_WH_usesAPILifetime]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate ALL_Volume_usesAPILifetime table with API WH Sales 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_Populate_ALL_Volume_WH_usesAPILifetime]
(@in_month varchar(2), @in_year varchar(4) )
AS
BEGIN

--
--   IF EXISTS(SELECT name FROM sys.tables
--        WHERE name = 'tmp_ytd_WH_Sales_CS')
--          DROP TABLE tmp_ytd_WH_Sales_CS
 
DECLARE @date varchar(10);
SET @date = @in_month + '/01/' + @in_year;
DECLARE @rollPMID int;
SET @rollPMID = 900000;
 

-- UPDATE WITH WH DATA Brand 
UPDATE t set 
        WHAPIBrand =  v.totamt, -- CHANGE DATES
		WHAPIBrandUnits = v.qty,
		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNo = '' then v.whaccountid else t.APIAccountno end  
	    FROM   pharmacymaster..ALL_Volume_usesAPILifetime t 
			inner join 
			 (  
              	SELECT SUM(ExtSales) as totamt 
					, sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty
					, whaccountid
					, MAX(p.pmid) as PMID
				 FROM  api..v_apisalesdetail a
                    join (	
							SELECT PMID, APIAccountNo
							FROM v_APItoPMID_LifeTime
							WHERE @Date >= DATEADD(month, DATEDIFF(month, 0, API_PMID_EffectiveDate), 0)
							AND @Date < ISNULL(API_PMID_QuitDate, GETDATE())
						) as p on LEFT(a.whaccountid,8) = LEFT(p.apiaccountno, 8)
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand'   -- CHANGE DATES
				 GROUP BY whaccountid
			) v 
		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

--INSERT WH DATA Brand WHERE THERE IS WH VOLUME BUT THERE WAS NO PVA VOLUME
 INSERT  into pharmacymaster..ALL_Volume_usesAPILifetime (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIBrand,WHAPIBrandUnits  )   

      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt,qty  FROM (   -- CHANGE DATES
			SELECT SUM(ExtSales) as totamt 
				,  sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty
				, whaccountid
				, MAX(p.pmid) as PMID
				,p.dea
				,p.accountname
				 FROM  api..v_apisalesdetail a
                    join (	
							SELECT v.PMID, v.APIAccountNo, pm.AccountName, pm.DEA
							FROM v_APItoPMID_LifeTime as v
							INNER JOIN PharmacyMaster.dbo.PM_Pharmacy as pm ON pm.PMID = v.PMID
							WHERE @Date >= DATEADD(month, DATEDIFF(month, 0, API_PMID_EffectiveDate), 0)
							AND @Date < ISNULL(API_PMID_QuitDate, GETDATE())
						) as p on LEFT(a.whaccountid,8) = LEFT(p.apiaccountno, 8)
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand'   -- CHANGE DATES
				 GROUP BY whaccountid,accountname,dea
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume_usesAPILifetime where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES


--  UPDATE WITH WH DATA Generics 

UPDATE t set 
        WHAPIGeneric =  v.totamt, -- CHANGE DATES
		WHAPIGenericUnits = v.qty,
		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNO = '' then v.whaccountid else t.APIAccountno end  
	    FROM   pharmacymaster..ALL_Volume_usesAPILifetime t 
			inner join 
			 (  
              	SELECT SUM(ExtSales) as totamt 
					,  sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty
					,whaccountid
					,MAX(p.pmid) as PMID
				 FROM  api..v_apisalesdetail a
                    join (
							SELECT PMID, APIAccountNo
							FROM v_APItoPMID_LifeTime
							WHERE @Date >= DATEADD(month, DATEDIFF(month, 0, API_PMID_EffectiveDate), 0)
							AND @Date < ISNULL(API_PMID_QuitDate, GETDATE())
						) as p on LEFT(a.whaccountid,8) = LEFT(p.apiaccountno, 8)
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'   -- CHANGE DATES
				 GROUP BY whaccountid
			) v 
		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

--INSERT WH DATA Generic WHERE THERE IS WH VOLUME BUT THERE WAS NO PVA VOLUME
 INSERT  into pharmacymaster..ALL_Volume_usesAPILifetime (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIGeneric ,WHAPIGenericUnits )   

      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt,qty  FROM (   -- CHANGE DATES
			SELECT SUM(ExtSales) as totamt 
					,   sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty
					,whaccountid
					,MAX(p.pmid) as PMID
					,p.dea
					,p.accountname
				 FROM  api..v_apisalesdetail a
                    join (	
							SELECT v.PMID, v.APIAccountNo, pm.AccountName, pm.DEA
							FROM v_APItoPMID_LifeTime as v
							INNER JOIN PharmacyMaster.dbo.PM_Pharmacy as pm ON pm.PMID = v.PMID
							WHERE @Date >= DATEADD(month, DATEDIFF(month, 0, API_PMID_EffectiveDate), 0)
							AND @Date < ISNULL(API_PMID_QuitDate, GETDATE())
						) as p on LEFT(a.whaccountid,8) = LEFT(p.apiaccountno, 8)
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'   -- CHANGE DATES
				 GROUP BY whaccountid,accountname,dea
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume_usesAPILifetime where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES


--  UPDATE WITH WH DATA OTC --If the PMID exists don't overwrite any existing APIAccountNo field - if it's blank update it

UPDATE t set 
        WHAPIOTC =  v.totamt, -- CHANGE DATES
		WHAPIOTCUnits = v.qty,
		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNO = '' then v.whaccountid else t.APIAccountno end  
	    FROM   pharmacymaster..ALL_Volume_usesAPILifetime t 
			inner join 
			 (  
              	SELECT SUM(ExtSales) as totamt 
				, sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty
				, whaccountid
				, MAX(p.pmid) as PMID
				 FROM  api..v_apisalesdetail a
                    join (	
							SELECT PMID, APIAccountNo
							FROM v_APItoPMID_LifeTime
							WHERE @Date >= DATEADD(month, DATEDIFF(month, 0, API_PMID_EffectiveDate), 0)
							AND @Date < ISNULL(API_PMID_QuitDate, GETDATE())
						) as p on LEFT(a.whaccountid,8) = LEFT(p.apiaccountno, 8)
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'   -- CHANGE DATES
				 GROUP BY whaccountid
			) v 
		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

--INSERT WH DATA OTC WHERE THERE IS WH VOLUME BUT THERE WAS NO PVA VOLUME
 INSERT  into pharmacymaster..ALL_Volume_usesAPILifetime (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIOTC,WHAPIOTCUnits  )   --Change Column

      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt,qty  FROM (   -- CHANGE DATES
			SELECT SUM(ExtSales) as totamt 
			, sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty
			, whaccountid
			, MAX(p.pmid) as PMID
			,p.dea
			,p.accountname
				 FROM  api..v_apisalesdetail a
                    join (	
							SELECT v.PMID, v.APIAccountNo, pm.AccountName, pm.DEA
							FROM v_APItoPMID_LifeTime as v
							INNER JOIN PharmacyMaster.dbo.PM_Pharmacy as pm ON pm.PMID = v.PMID
							WHERE @Date >= DATEADD(month, DATEDIFF(month, 0, API_PMID_EffectiveDate), 0)
							AND @Date < ISNULL(API_PMID_QuitDate, GETDATE())
						) as p on LEFT(a.whaccountid,8) = LEFT(p.apiaccountno, 8)
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'   -- CHANGE DATES
				 GROUP BY whaccountid,accountname,dea
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume_usesAPILifetime where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES


--BECAUSE THE NEXT SET DEALS WITH MULTIPLE WAREHOUSE Accounts tied to the same PMID - We need to add the value to any existing PMID -SO set fields to zero
-- if null - so adds will take place correctly

UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIBrand = 0.00 where WHAPIBrand is null;
UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIOTC = 0.00 where WHAPIOTC is null;
UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPITotal = 0.00 where WHAPITotal is null;
UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;


---Get the APIAccounts that are in the PM_APIAccounts as being old APIaccountnos tied to an existing PMID with new APIaccountno  -- BRAND

       UPDATE t set  
        WHAPIBrand = t.WHAPIBrand + v.totamt, -- CHANGE  column
		WHAPIBrandUnits = v.qty,
		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNO = '' then v.whaccountid else t.APIAccountno end   
	    FROM   pharmacymaster..ALL_Volume_usesAPILifetime t 
			inner join 
			 (  
              	SELECT SUM(ExtSales) as totamt ,  sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid
				 FROM  api..v_apisalesdetail a
                    join 
                     (select apiaccountno , pmid  from pm_apiaccounts  where date is not null )p
                    on a.whaccountid = p.apiaccountno
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'BRAND'   -- CHANGE DATES and type
				 GROUP BY whaccountid, pmid
			) v 
		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES



 INSERT  into pharmacymaster..ALL_Volume_usesAPILifetime (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIBrand ,WHAPIBrandUnits )   --Change Column

      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt,qty  FROM (   -- CHANGE DATES
			SELECT SUM(ExtSales) as totamt , sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid,p.dea,p.accountname
				 FROM  api..v_apisalesdetail a
                    join 
                     (select pm.apiaccountno , pm.pmid , pmp.accountname,pmp.dea from pm_apiaccounts  pm
                        join pm_pharmacy pmp on pm.pmid = pmp.pmid
                        where date is not null )p
                    on a.whaccountid = p.apiaccountno
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand'   -- CHANGE DATES
				 GROUP BY whaccountid, pmid,accountname,dea
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume_usesAPILifetime where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES
    
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIBrand = 0.00 where WHAPIBrand is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIOTC = 0.00 where WHAPIOTC is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPITotal = 0.00 where WHAPITotal is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;

---Get the APIAccounts that are in the PM_APIAccounts as being old APIaccountnos tied to an existing PMID with new APIaccountno  -- Generic

       UPDATE t set  
        WHAPIGeneric = t.WHAPIGeneric + v.totamt, -- CHANGE  column
		WHAPIGenericUnits = v.qty,
		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNO = '' then v.whaccountid else t.APIAccountno end   
	    FROM   pharmacymaster..ALL_Volume_usesAPILifetime t 
			inner join 
			 (  
              	SELECT SUM(ExtSales) as totamt , sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid
				 FROM  api..v_apisalesdetail a
                    join 
                     (select apiaccountno , pmid  from pm_apiaccounts  where date is not null )p
                    on a.whaccountid = p.apiaccountno
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'   -- CHANGE DATES and type
				 GROUP BY whaccountid, pmid
			) v 
		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES



 INSERT  into pharmacymaster..ALL_Volume_usesAPILifetime (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIGeneric,WHAPIGenericUnits  )   --Change Column

      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt ,qty FROM (   -- CHANGE DATES
			SELECT SUM(ExtSales) as totamt , sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid,p.dea,p.accountname
				 FROM  api..v_apisalesdetail a
                    join 
                     (select pm.apiaccountno , pm.pmid , pmp.accountname,pmp.dea from pm_apiaccounts  pm
                        join pm_pharmacy pmp on pm.pmid = pmp.pmid
                        where date is not null )p
                    on a.whaccountid = p.apiaccountno
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'   -- CHANGE DATES
				 GROUP BY whaccountid, pmid,accountname,dea
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume_usesAPILifetime where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES

        
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIBrand = 0.00 where WHAPIBrand is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIOTC = 0.00 where WHAPIOTC is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPITotal = 0.00 where WHAPITotal is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;
---Get the APIAccounts that are in the PM_APIAccounts as being old APIaccountnos tied to an existing PMID with new APIaccountno  -- OTC

       UPDATE t set  
        WHAPIOTC = t.WHAPIOTC + v.totamt, -- CHANGE  column
		WHAPIOTCUnits = v.qty,
		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNO = '' then v.whaccountid else t.APIAccountno end   
	    FROM   pharmacymaster..ALL_Volume_usesAPILifetime t 
			inner join 
			 (  
              	SELECT SUM(ExtSales) as totamt ,  sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty,   whaccountid,  p.pmid
				 FROM  api..v_apisalesdetail a
                    join 
                     (select apiaccountno , pmid  from pm_apiaccounts  where date is not null )p
                    on a.whaccountid = p.apiaccountno
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'   -- CHANGE DATES and type
				 GROUP BY whaccountid, pmid
			) v 
		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES



 INSERT  into pharmacymaster..ALL_Volume_usesAPILifetime (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIOTC ,WHAPIOTCUnits )   --Change Column

      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt,qty  FROM (   -- CHANGE DATES
			SELECT SUM(ExtSales) as totamt , sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid,p.dea,p.accountname
				 FROM  api..v_apisalesdetail a
                    join 
                     (select pm.apiaccountno , pm.pmid , pmp.accountname,pmp.dea from pm_apiaccounts  pm
                        join pm_pharmacy pmp on pm.pmid = pmp.pmid
                        where date is not null )p
                    on a.whaccountid = p.apiaccountno
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'   -- CHANGE DATES
				 GROUP BY whaccountid, pmid,accountname,dea
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume_usesAPILifetime where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES

    
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIBrand = 0.00 where WHAPIBrand is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIOTC = 0.00 where WHAPIOTC is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPITotal = 0.00 where WHAPITotal is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;
--Now get those that are like Territory XX - and roll up into 900000 - below code not working yet
--Use this to insert into 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)
--
--BRAND
--Use this to  update 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)  
      UPDATE t set  
        WHAPIBrand = v.totamt,  -- CHANGE  column
		WHAPIBrandUnits = v.qty
	    FROM   pharmacymaster..ALL_Volume_usesAPILifetime t 
			inner join 
			 (  
				SELECT SUM(ExtSales) as totamt ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty   
								 FROM  api..v_apisalesdetail a
				left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
								 WHERE      month(invdate) = @in_month  and year(invdate) = @in_year and type = 'Brand' and p.pmid is null --CHANGE DATE and Type
				 and a.whaccountid not in
				(select apiaccountno  from pm_apiaccounts  where date is not null)
			) v 
		   on t.pmid = @rollPMID where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

 

--Use this to insert into 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)
 
 INSERT  into pharmacymaster..ALL_Volume_usesAPILifetime (Date,PMID,WHAPIBrand,WHAPIBrandUnits  )   --Change Column

      SELECT @date ,@rollPMID, totamt,qty FROM (   -- CHANGE DATES
			SELECT SUM(ExtSales) as totamt ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty   
				 FROM  api..v_apisalesdetail a
                    left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand'   -- CHANGE DATES
            and p.pmid is null   and a.whaccountid not in (select apiaccountno  from pm_apiaccounts  where date is not null)
				 
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume_usesAPILifetime where pmid = @rollPMID and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES

--GENERIC
--Use this to  update 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)  
      UPDATE t set  
        WHAPIGeneric = v.totamt,  -- CHANGE  column
		WHAPIGenericUnits = v.qty
	    FROM   pharmacymaster..ALL_Volume_usesAPILifetime t 
			inner join 
			 (  
				SELECT SUM(ExtSales) as totamt ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty     
								 FROM  api..v_apisalesdetail a
				left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
								 WHERE      month(invdate) = @in_month  and year(invdate) = @in_year and type = 'Generic' and p.pmid is null --CHANGE DATE and Type
				 and a.whaccountid not in
				(select apiaccountno  from pm_apiaccounts  where date is not null)
			) v 
		   on t.pmid = @rollPMID where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

 

--Use this to insert into 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)
 
 INSERT  into pharmacymaster..ALL_Volume_usesAPILifetime (Date,PMID,WHAPIGeneric ,WHAPIGenericUnits )   --Change Column

      SELECT @date ,@rollPMID,totamt,qty  FROM (   -- CHANGE DATES
			SELECT SUM(ExtSales) as totamt ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty   
				 FROM  api..v_apisalesdetail a
                    left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'   -- CHANGE DATES
            and p.pmid is null   and a.whaccountid not in (select apiaccountno  from pm_apiaccounts  where date is not null)
				 
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume_usesAPILifetime where pmid = @rollPMID and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES

--OTC
--Use this to  update 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)  
      UPDATE t set  
        WHAPIOTC = v.totamt,  -- CHANGE  column
		WHAPIOTCUnits = v.qty
	    FROM   pharmacymaster..ALL_Volume_usesAPILifetime t 
			inner join 
			 (  
				SELECT SUM(ExtSales) as totamt  ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty     
								 FROM  api..v_apisalesdetail a
				left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
								 WHERE      month(invdate) = @in_month  and year(invdate) = @in_year and type = 'OTC' and p.pmid is null --CHANGE DATE and Type
				 and a.whaccountid not in
				(select apiaccountno  from pm_apiaccounts  where date is not null)
			) v 
		   on t.pmid = @rollPMID where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

 

--Use this to insert into 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)
 
 INSERT  into pharmacymaster..ALL_Volume_usesAPILifetime (Date,PMID,WHAPIOTC ,WHAPIOTCUnits )   --Change Column

      SELECT @date ,@rollPMID,totamt,qty  FROM (   -- CHANGE DATES
			SELECT SUM(ExtSales) as totamt ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty   
				 FROM  api..v_apisalesdetail a
                    left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'   -- CHANGE DATES
            and p.pmid is null   and a.whaccountid not in (select apiaccountno  from pm_apiaccounts  where date is not null)
				 
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume_usesAPILifetime where pmid = @rollPMID and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES



	---SET any NULLS TO ZERO and DO totals
    
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIBrand = 0.00 where WHAPIBrand is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIOTC = 0.00 where WHAPIOTC is null;

	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;

	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPITotal = 0.00 where WHAPITotal is null;
    UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set MLTotal = 0.00 where MLTotal is null;
    UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set AndaTotal = 0.00 where AndaTotal is null;
	UPDATE pharmacymaster..ALL_Volume_usesAPILifetime set WHAPITotal = WHAPIBrand + WHAPIGeneric + WHAPIOTC


--SET Other Fields TO ZERO WHERE NULL
	UPDATE ALL_Volume_usesAPILifetime SET APICOGAppliedSales = 0.00 where APICOGAppliedSales is null;
	UPDATE ALL_Volume_usesAPILifetime SET APINetSales  = 0.00 where APINetSales is null;
	UPDATE ALL_Volume_usesAPILifetime SET APIGENRx = 0.00 where APIGENRx is null;
	UPDATE ALL_Volume_usesAPILifetime SET APIGENTotalSrc = 0.00 where APIGENTotalSrc is null;
	UPDATE ALL_Volume_usesAPILifetime SET APIGENTotalP2P3 = 0.00 where APIGENTotalP2P3 is null;
	UPDATE ALL_Volume_usesAPILifetime SET APIGENTotal = 0.00 where APIGENTotal is null;
	UPDATE ALL_Volume_usesAPILifetime SET APIBrand = 0.00 where APIBrand is null;
	UPDATE ALL_Volume_usesAPILifetime SET APIOTC = 0.00 where APIOTC is null;
	UPDATE ALL_Volume_usesAPILifetime SET APIGBRPerc = 0.00 where APIGBRPerc is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPCOGAppliedSales = 0.00 where AAPCOGAppliedSales is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPNetSales = 0.00 where AAPNetSales is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPBrand = 0.00 where AAPBrand is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPGENTotal = 0.00 where AAPGENTotal is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPGENTotalSrc = 0.00 where AAPGENTotalSrc is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPGENExcl = 0.00 where AAPGENExcl is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPOTC = 0.00 where AAPOTC is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPOther = 0.00 where AAPOther is null;
UPDATE ALL_Volume_usesAPILifetime SET AAPTotalRX = 0.00 where AAPTotalRX is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPExcludedFromTotalRX = 0.00 where AAPExcludedFromTotalRX is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPNonRXOTCandHH = 0.00 where AAPNonRXOTCandHH is null;
	UPDATE ALL_Volume_usesAPILifetime SET AAPSourceCompliance = 0.00 where AAPSourceCompliance is null;

	UPDATE ALL_Volume_usesAPILifetime SET UDNetSales = 0.00 where UDNetSales is null;
	UPDATE ALL_Volume_usesAPILifetime SET UDBrand = 0.00 where UDBrand is null;
	UPDATE ALL_Volume_usesAPILifetime SET UDGENTotal = 0.00 where UDGENTotal is null;
	UPDATE ALL_Volume_usesAPILifetime SET UDGENTotalSrc = 0.00 where UDGENTotalSrc is null;
	UPDATE ALL_Volume_usesAPILifetime SET UDOTC = 0.00 where UDOTC is null;
	UPDATE ALL_Volume_usesAPILifetime SET UDOther = 0.00 where UDOther is null;
	UPDATE ALL_Volume_usesAPILifetime SET CombNetSales = 0.00 where CombNetSales is null;
	UPDATE ALL_Volume_usesAPILifetime SET CombBrands = 0.00 where CombBrands is null;
	UPDATE ALL_Volume_usesAPILifetime SET CombOTC = 0.00 where CombOTC is null;
	UPDATE ALL_Volume_usesAPILifetime SET CombGENTotal = 0.00 where CombGENTotal is null;
	UPDATE ALL_Volume_usesAPILifetime SET CombGENTotalSrc = 0.00 where CombGENTotalSrc is null;
    UPDATE ALL_Volume_usesAPILifetime SET CombOther = 0.00 where CombOther is null;

	UPDATE ALL_Volume_usesAPILifetime SET APIOther = 0.0 where APIOther is null;
	UPDATE ALL_Volume_usesAPILifetime SET UDAdminOnly = 0.0 where UDAdminOnly is null
	UPDATE ALL_Volume_usesAPILifetime SET CombAdminOnly = 0.0 where CombAdminOnly is null;

 
END










GO
