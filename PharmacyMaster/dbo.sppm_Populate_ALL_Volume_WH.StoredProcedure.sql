USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Populate_ALL_Volume_WH]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate ALL_VOlume table with API WH Sales 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_Populate_ALL_Volume_WH]

	@in_month varchar(2)
	, @in_year varchar(4) 

AS

SET NOCOUNT ON;

BEGIN

DECLARE @Startdate DATETIME
, @EndDate DATETIME

SET @Startdate = @in_month + '/01/' + @in_year;
SET @EndDate = EOMONTH(@StartDate)


/**************************************************************************************************************************************************

							Load unaudited API data into work tables

****************************************************************************************************************************************************/


	TRUNCATE TABLE Reports.Staging.All_Volume_API;

	INSERT INTO Reports.Staging.All_Volume_API(PMID, [APIAccountNo], [Date], [Type], [Qty], [ExtSales])
	SELECT dt.PMID
	, dt.WHAccountID
	, dt.InvDate
	, dt.Type
	, ISNULL(SUM(dt.Qty),0) AS Qty
	, SUM(dt.ExtSales) AS ExtSales
	FROM(SELECT a.PMID
		, a.WHAccountID
		, DATEADD(month, DATEDIFF(month, 0, a.InvDate), 0) AS InvDate
		, IIF(a.ExtSales < 0.00 and a.Qty > 0, (-1 * a.Qty), a.Qty) AS Qty -- Need to show negative quantity when a return is present
		, a.Type
		, a.ExtSales
		FROM API.dbo.APISalesDetail AS a
		WHERE a.Type IN('Generic','Brand','OTC')
		AND a.InvDate BETWEEN @Startdate AND @EndDate
		--AND (ItemDescription NOT LIKE '%Credit%' -- Exclude all credits per Wayne
		--		OR TransTypeCodeDesc NOT LIKE '%Credit%'
		--	)
		
		AND PMID > 0
		) AS dt
	GROUP BY dt.PMID
	, dt.WHAccountID
	, dt.InvDate
	, dt.Type

	
/**************************************************************************************************************************************************

							Load audited API data if available

****************************************************************************************************************************************************/

DECLARE @RowCount INT

SELECT @RowCount = COUNT(*)
FROM [dbo].[PM_Rebates_APIMonthly]
WHERE Date = @StartDate

IF @RowCount > 0


BEGIN

	MERGE dbo.All_Volume AS t
	USING(SELECT a.Date, a.PMID, a.[Pharmacy Name] AS AccountName, a.[APIAccountNo] , a.[API Generic Sales] AS [WHAPIGeneric], a.[API Brand Sales] AS [WHAPIBrand]
			, a.[API OTC Sales] AS [WHAPIOTC], a.[API Total Whse Sales] AS [WHAPITotal], pd.DEA, gen.GenericQty AS [WHAPIGenericUnits], brn.BrandQty AS [WHAPIBrandUnits]
			, otc.OTCQty AS [WHAPIOTCUnits]
			FROM [dbo].[PM_Rebates_APIMonthly] AS a
			INNER JOIN PharmacyMaster.dbo.PM_Pharmacy AS pd ON a.PMID = pd.PMID
			LEFT OUTER JOIN(SELECT Date, PMID, SUM(Qty) AS GenericQty
							FROM Reports.Staging.All_Volume_API
							WHERE type = 'Generic'	
							AND Date = @StartDate
							GROUP BY Date, PMID		
							) AS gen ON a.Date = gen.Date
							AND a.PMID = gen.PMID
			LEFT OUTER JOIN(SELECT Date, PMID, SUM(Qty) AS BrandQty
							FROM Reports.Staging.All_Volume_API
							WHERE type = 'Brand'	
							AND Date = @StartDate
							GROUP BY Date, PMID		
							) AS brn ON a.Date = brn.Date
							AND a.PMID = brn.PMID
			LEFT OUTER JOIN(SELECT Date, PMID, SUM(Qty) AS OTCQty
						FROM Reports.Staging.All_Volume_API
						WHERE type = 'OTC'	
						AND Date = @StartDate
						GROUP BY Date, PMID		
						) AS otc ON a.Date = otc.Date
						AND a.PMID = otc.PMID
			WHERE a.Date = @StartDate
			) AS s (Date, PMID, AccountName, APIAccountNo, WHAPIGeneric, WHAPIBrand, WHAPIOTC, WHAPITotal, DEA, WHAPIGenericUnits, WHAPIBrandUnits, WHAPIOTCUnits)
			ON t.Date = s.Date
			AND t.PMID = s.PMID

	WHEN MATCHED THEN
	UPDATE
	SET [WHAPIBrand] = s.[WHAPIBrand]
	, [WHAPIGeneric] = s.[WHAPIGeneric]
	, [WHAPIOTC] = s.[WHAPIOTC]
	, [WHAPITotal] = s.[WHAPITotal]
	, WHAPIGenericUnits = s.WHAPIGenericUnits
	, WHAPIBrandUnits = s.WHAPIGenericUnits
	, WHAPIOTCUnits = s.WHAPIOTCUnits
	WHEN NOT MATCHED THEN

	INSERT (Date, PMID, AccountName, APIAccountNo, WHAPIGeneric, WHAPIBrand, WHAPIOTC, WHAPITotal, DEA, WHAPIGenericUnits,WHAPIBrandUnits,WHAPIOTCUnits)
	VALUES(s.Date, s.PMID, s.AccountName, s.APIAccountNo, s.WHAPIGeneric, s.WHAPIBrand, s.WHAPIOTC, s.WHAPITotal, s.DEA, s.WHAPIGenericUnits, s.WHAPIBrandUnits, s.WHAPIOTCUnits)
	;

END



/**************************************************************************************************************************************************

							Load API data

****************************************************************************************************************************************************/


ELSE IF @RowCount = 0

	--Load Generics
	MERGE [dbo].[ALL_Volume] AS t
	USING(SELECT PMID
			, Date
			, [PharmacyName]
			, [APIAccountNo]
			, DEA
			, [Qty] AS [WHAPIGenericUnits]
			, [ExtSales] AS [WHAPIGeneric]			
			FROM Reports.Staging.All_Volume_API
			WHERE Date = @StartDate
			AND Type = 'Generic'	
			) AS s (PMID, Date, PharmacyName, APIAccountNo, DEA, [WHAPIGenericUnits], [WHAPIGeneric]) ON t.PMID = s.PMID
																							AND s.Date = t.Date

	WHEN MATCHED THEN
	UPDATE SET [WHAPIGenericUnits] = s.[WHAPIGenericUnits]
	, [WHAPIGeneric] = s.[WHAPIGeneric]
	

	WHEN NOT MATCHED THEN
	INSERT(PMID, Date, AccountName, APIAccountNo, DEA, [WHAPIGenericUnits], [WHAPIGeneric])
	VALUES(s.PMID, s.Date, s.PharmacyName, s.APIAccountNo, s.DEA, s.[WHAPIGenericUnits], s.[WHAPIGeneric])
	;

	--Load Brands
	MERGE [dbo].[ALL_Volume] AS t
	USING(SELECT PMID
			, Date
			, [PharmacyName]
			, [APIAccountNo]
			, DEA
			, [Qty] AS [WHAPIBrandUnits]
			, [ExtSales] AS [WHAPIBrand]		
			FROM Reports.Staging.All_Volume_API
			WHERE Date = @StartDate
			AND Type = 'Brand'	
			) AS s (PMID, Date, PharmacyName, APIAccountNo, DEA, [WHAPIBrandUnits], [WHAPIBrand]) ON t.PMID = s.PMID
																							AND s.Date = t.Date

	WHEN MATCHED THEN
	UPDATE SET 
	[WHAPIBrandUnits] = s.[WHAPIBrandUnits]
	, [WHAPIBrand] = s.[WHAPIBrand]
	

	WHEN NOT MATCHED THEN
	INSERT(PMID, Date, AccountName, APIAccountNo, DEA, [WHAPIBrandUnits], [WHAPIBrand])
	VALUES(s.PMID, s.Date, s.PharmacyName, s.APIAccountNo, s.DEA, s.[WHAPIBrandUnits], s.[WHAPIBrand])
	;

	--Load OTC
	MERGE [dbo].[ALL_Volume] AS t
	USING(SELECT PMID
			, Date
			, [PharmacyName]
			, [APIAccountNo]
			, DEA
			, [Qty] AS [WHAPIOTCUnits]
			, [ExtSales] AS [WHAPIOTC]
			FROM Reports.Staging.All_Volume_API
			WHERE Date = @StartDate
			AND Type = 'OTC'	
			) AS s (PMID, Date, PharmacyName, APIAccountNo, DEA, [WHAPIOTCUnits], [WHAPIOTC]) ON t.PMID = s.PMID
																							AND s.Date = t.Date

	WHEN MATCHED THEN
	UPDATE SET 
	[WHAPIOTCUnits] = s.[WHAPIOTCUnits]
	, [WHAPIOTC] = s.[WHAPIOTC]
	

	WHEN NOT MATCHED THEN
	INSERT(PMID, Date, AccountName, APIAccountNo, DEA, [WHAPIOTCUnits], [WHAPIOTC])
	VALUES(s.PMID, s.Date, s.PharmacyName, s.APIAccountNo, s.DEA, s.[WHAPIOTCUnits], s.[WHAPIOTC])
	;

	UPDATE x
	SET WHAPITotal = ISNULL(WHAPIBrand, 0.00) + ISNULL(WHAPIGeneric,0.00) + ISNULL(WHAPIOTC,0.00)
	FROM [dbo].[ALL_Volume] AS x
	WHERE Date = @StartDate
 
	--Update demographics
	UPDATE x
	SET AccountName = pd.PharmacyName
	, CHAccountNo = TRY_CONVERT(FLOAT,pd.CAHPrimaryAccount)
	, AAPAccountNo = pd.AAPNumber
	, DEA = pd.DEA_HIN
	, APIAccountNo = pd.APINumber
	FROM [dbo].[ALL_Volume] AS x
	INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON x.PMID = pd.PMID
	WHERE x.Date = @StartDate
 
END

/****************************************************************************************************************************************************

												Old SQL Code - Do Not Delete

******************************************************************************************************************************************************/


----Load work table
	--MERGE Reports.Staging.All_Volume_API AS t
	--USING(SELECT dt.PMID
	--		, dt.WHAccountID
	--		, dt.InvDate
	--		, dt.Type
	--		, SUM(dt.Qty) AS Qty
	--		, SUM(dt.ExtSales) AS ExtSales
	--		FROM(SELECT PMID
	--			, WHAccountID
	--			, DATEADD(month, DATEDIFF(month, 0, InvDate), 0) AS InvDate
	--			, IIF(ExtSales < 0.00 and Qty > 0, (-1 * Qty), Qty) AS Qty -- Need to show negative quantity when a return is present
	--			, Type
	--			, ExtSales
	--			FROM API.dbo.APISalesDetail AS a
	--			INNER JOIN RXMaster.dbo.PharmacyDim AS pd ON a.WHAccountID = pd.APINumber
	--														AND a.InvDate BETWEEN ISNULL(pd.[APIEffectiveDate], '19000101') AND ISNULL(pd.APIQuitDate, '29991231') -- This gets Change of Ownership to map PMID's correctly
	--			WHERE a.Type IN('Generic','Brand','OTC')
	--			AND a.InvDate BETWEEN @StartDate AND @EndDate
	--			AND ItemDescription NOT LIKE '%Credit%'
	--			) AS dt
	--		GROUP BY dt.PMID
	--		, dt.WHAccountID
	--		, dt.InvDate
	--		, dt.Type
	--		) AS s (PMID,WHAccountID,InvDate,Type,Qty,ExtSales) ON t.PMID = s.PMID 
	--															AND t.Date = s.InvDate
	--															AND t.Type = s.Type

	--WHEN MATCHED THEN
	--UPDATE 
	--SET Type = s.Type
	--, Qty = s.Qty
	--, ExtSales = s.ExtSales

	--WHEN NOT MATCHED THEN
	--INSERT(PMID, APIAccountNo, Date, Type, Qty, ExtSales)
	--VALUES(s.PMID, s.WHAccountID, s.InvDate, s.Type, s.Qty, s.ExtSales)
	--;






----
----   IF EXISTS(SELECT name FROM sys.tables
----        WHERE name = 'tmp_ytd_WH_Sales_CS')
----          DROP TABLE tmp_ytd_WH_Sales_CS
 
--DECLARE @date varchar(10);
--SET @date = @in_month + '/01/' + @in_year;
--DECLARE @rollPMID int;
--SET @rollPMID = 900000;
 

---- UPDATE WITH WH DATA Brand 
--UPDATE t set 
--        WHAPIBrand =  v.totamt, -- CHANGE DATES
--		WHAPIBrandUnits = v.qty,
--		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNo = '' then v.whaccountid else t.APIAccountno end  
--	    FROM   pharmacymaster..ALL_Volume t 
--			inner join 
--			 (  
--              	SELECT SUM(ExtSales) as totamt , sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid
--				 FROM  api..v_apisalesdetail a
--                    join pm_pharmacy p on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand'   -- CHANGE DATES
--				 GROUP BY whaccountid, pmid
--			) v 
--		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

----INSERT WH DATA Brand WHERE THERE IS WH VOLUME BUT THERE WAS NO PVA VOLUME
-- INSERT  into pharmacymaster..ALL_Volume (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIBrand,WHAPIBrandUnits  )   

--      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt,qty  FROM (   -- CHANGE DATES
--			SELECT SUM(ExtSales) as totamt ,  sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid,p.dea,p.accountname
--				 FROM  api..v_apisalesdetail a
--                    join pm_pharmacy p on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand'   -- CHANGE DATES
--				 GROUP BY whaccountid, pmid,accountname,dea
--		 )vol
--	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES


----  UPDATE WITH WH DATA Generics 

--UPDATE t set 
--        WHAPIGeneric =  v.totamt, -- CHANGE DATES
--		WHAPIGenericUnits = v.qty,
--		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNO = '' then v.whaccountid else t.APIAccountno end  
--	    FROM   pharmacymaster..ALL_Volume t 
--			inner join 
--			 (  
--              	SELECT SUM(ExtSales) as totamt ,  sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty,whaccountid,  p.pmid
--				 FROM  api..v_apisalesdetail a
--                    join pm_pharmacy p on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'   -- CHANGE DATES
--				 GROUP BY whaccountid, pmid
--			) v 
--		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

----INSERT WH DATA Generic WHERE THERE IS WH VOLUME BUT THERE WAS NO PVA VOLUME
-- INSERT  into pharmacymaster..ALL_Volume (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIGeneric ,WHAPIGenericUnits )   

--      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt,qty  FROM (   -- CHANGE DATES
--			SELECT SUM(ExtSales) as totamt ,   sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty,whaccountid,  p.pmid,p.dea,p.accountname
--				 FROM  api..v_apisalesdetail a
--                    join pm_pharmacy p on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'   -- CHANGE DATES
--				 GROUP BY whaccountid, pmid,accountname,dea
--		 )vol
--	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES


----  UPDATE WITH WH DATA OTC --If the PMID exists don't overwrite any existing APIAccountNo field - if it's blank update it

--UPDATE t set 
--        WHAPIOTC =  v.totamt, -- CHANGE DATES
--		WHAPIOTCUnits = v.qty,
--		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNO = '' then v.whaccountid else t.APIAccountno end  
--	    FROM   pharmacymaster..ALL_Volume t 
--			inner join 
--			 (  
--              	SELECT SUM(ExtSales) as totamt , sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid
--				 FROM  api..v_apisalesdetail a
--                    join pm_pharmacy p on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'   -- CHANGE DATES
--				 GROUP BY whaccountid, pmid
--			) v 
--		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

----INSERT WH DATA OTC WHERE THERE IS WH VOLUME BUT THERE WAS NO PVA VOLUME
-- INSERT  into pharmacymaster..ALL_Volume (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIOTC,WHAPIOTCUnits  )   --Change Column

--      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt,qty  FROM (   -- CHANGE DATES
--			SELECT SUM(ExtSales) as totamt , sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid,p.dea,p.accountname
--				 FROM  api..v_apisalesdetail a
--                    join pm_pharmacy p on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'   -- CHANGE DATES
--				 GROUP BY whaccountid, pmid,accountname,dea
--		 )vol
--	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES


----BECAUSE THE NEXT SET DEALS WITH MULTIPLE WAREHOUSE Accounts tied to the same PMID - We need to add the value to any existing PMID -SO set fields to zero
---- if null - so adds will take place correctly

--UPDATE pharmacymaster..ALL_Volume set WHAPIBrand = 0.00 where WHAPIBrand is null;
--UPDATE pharmacymaster..ALL_Volume set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
--UPDATE pharmacymaster..ALL_Volume set WHAPIOTC = 0.00 where WHAPIOTC is null;
--UPDATE pharmacymaster..ALL_Volume set WHAPITotal = 0.00 where WHAPITotal is null;
--UPDATE pharmacymaster..ALL_Volume set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
--UPDATE pharmacymaster..ALL_Volume set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
--UPDATE pharmacymaster..ALL_Volume set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;


-----Get the APIAccounts that are in the PM_APIAccounts as being old APIaccountnos tied to an existing PMID with new APIaccountno  -- BRAND

--       UPDATE t set  
--        WHAPIBrand = t.WHAPIBrand + v.totamt, -- CHANGE  column
--		WHAPIBrandUnits = v.qty,
--		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNO = '' then v.whaccountid else t.APIAccountno end   
--	    FROM   pharmacymaster..ALL_Volume t 
--			inner join 
--			 (  
--              	SELECT SUM(ExtSales) as totamt ,  sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid
--				 FROM  api..v_apisalesdetail a
--                    join 
--                     (select apiaccountno , pmid  from pm_apiaccounts  where date is not null )p
--                    on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'BRAND'   -- CHANGE DATES and type
--				 GROUP BY whaccountid, pmid
--			) v 
--		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES



-- INSERT  into pharmacymaster..ALL_Volume (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIBrand ,WHAPIBrandUnits )   --Change Column

--      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt,qty  FROM (   -- CHANGE DATES
--			SELECT SUM(ExtSales) as totamt , sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid,p.dea,p.accountname
--				 FROM  api..v_apisalesdetail a
--                    join 
--                     (select pm.apiaccountno , pm.pmid , pmp.accountname,pmp.dea from pm_apiaccounts  pm
--                        join pm_pharmacy pmp on pm.pmid = pmp.pmid
--                        where date is not null )p
--                    on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand'   -- CHANGE DATES
--				 GROUP BY whaccountid, pmid,accountname,dea
--		 )vol
--	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES
    
--	UPDATE pharmacymaster..ALL_Volume set WHAPIBrand = 0.00 where WHAPIBrand is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIOTC = 0.00 where WHAPIOTC is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPITotal = 0.00 where WHAPITotal is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;

-----Get the APIAccounts that are in the PM_APIAccounts as being old APIaccountnos tied to an existing PMID with new APIaccountno  -- Generic

--       UPDATE t set  
--        WHAPIGeneric = t.WHAPIGeneric + v.totamt, -- CHANGE  column
--		WHAPIGenericUnits = v.qty,
--		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNO = '' then v.whaccountid else t.APIAccountno end   
--	    FROM   pharmacymaster..ALL_Volume t 
--			inner join 
--			 (  
--              	SELECT SUM(ExtSales) as totamt , sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid
--				 FROM  api..v_apisalesdetail a
--                    join 
--                     (select apiaccountno , pmid  from pm_apiaccounts  where date is not null )p
--                    on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'   -- CHANGE DATES and type
--				 GROUP BY whaccountid, pmid
--			) v 
--		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES



--	  INSERT into pharmacymaster..ALL_Volume (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIGeneric,WHAPIGenericUnits)   --Change Column		
--      SELECT @date, PMID, whaccountid, accountname, DEA, totamt,qty -- CHANGE DATES
--	  FROM(SELECT SUM(ExtSales) as totamt 
--			, sum(case when extsales < 0 then (qty * -1)   
--						when  extsales > 0 then qty 
--						else 0 
--						end) as qty
--			, whaccountid
--			, p.pmid
--			, p.dea
--			, p.accountname
--			FROM  api..v_apisalesdetail a
--            join(select pm.apiaccountno , pm.pmid, pmp.accountname, pmp.dea 
--					from pm_apiaccounts  pm
--                    join pm_pharmacy pmp on pm.pmid = pmp.pmid
--                    where date is not null 
--					) AS p on a.whaccountid = p.apiaccountno
--			WHERE  month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'   -- CHANGE DATES
--			GROUP BY whaccountid, pmid,accountname,dea
--		 ) AS vol
--	 WHERE not exists(select pmid 
--						from pharmacymaster..ALL_Volume 
--						where pmid = vol.pmid 
--						and   month(date) = @in_month and year(date) = @in_year  
--						); -- CHANGE DATES

        
--	UPDATE pharmacymaster..ALL_Volume set WHAPIBrand = 0.00 where WHAPIBrand is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIOTC = 0.00 where WHAPIOTC is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPITotal = 0.00 where WHAPITotal is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;
-----Get the APIAccounts that are in the PM_APIAccounts as being old APIaccountnos tied to an existing PMID with new APIaccountno  -- OTC

--       UPDATE t set  
--        WHAPIOTC = t.WHAPIOTC + v.totamt, -- CHANGE  column
--		WHAPIOTCUnits = v.qty,
--		APIAccountNo = case when t.APIAccountNO is null or t.APIAccountNO = '' then v.whaccountid else t.APIAccountno end   
--	    FROM   pharmacymaster..ALL_Volume t 
--			inner join 
--			 (  
--              	SELECT SUM(ExtSales) as totamt ,  sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty,   whaccountid,  p.pmid
--				 FROM  api..v_apisalesdetail a
--                    join 
--                     (select apiaccountno , pmid  from pm_apiaccounts  where date is not null )p
--                    on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'   -- CHANGE DATES and type
--				 GROUP BY whaccountid, pmid
--			) v 
--		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES



-- INSERT  into pharmacymaster..ALL_Volume (Date,PMID,APIAccountNo,AccountName,DEA, WHAPIOTC ,WHAPIOTCUnits )   --Change Column

--      SELECT @date ,PMID,whaccountid,accountname,DEA,totamt,qty  FROM (   -- CHANGE DATES
--			SELECT SUM(ExtSales) as totamt , sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty, whaccountid,  p.pmid,p.dea,p.accountname
--				 FROM  api..v_apisalesdetail a
--                    join 
--                     (select pm.apiaccountno , pm.pmid , pmp.accountname,pmp.dea from pm_apiaccounts  pm
--                        join pm_pharmacy pmp on pm.pmid = pmp.pmid
--                        where date is not null )p
--                    on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'   -- CHANGE DATES
--				 GROUP BY whaccountid, pmid,accountname,dea
--		 )vol
--	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES

    
--	UPDATE pharmacymaster..ALL_Volume set WHAPIBrand = 0.00 where WHAPIBrand is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIOTC = 0.00 where WHAPIOTC is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPITotal = 0.00 where WHAPITotal is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;
----Now get those that are like Territory XX - and roll up into 900000 - below code not working yet
----Use this to insert into 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)
----
----BRAND
----Use this to  update 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)  
--      UPDATE t set  
--        WHAPIBrand = v.totamt,  -- CHANGE  column
--		WHAPIBrandUnits = v.qty
--	    FROM   pharmacymaster..ALL_Volume t 
--			inner join 
--			 (  
--				SELECT SUM(ExtSales) as totamt ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty   
--								 FROM  api..v_apisalesdetail a
--				left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
--								 WHERE      month(invdate) = @in_month  and year(invdate) = @in_year and type = 'Brand' and p.pmid is null --CHANGE DATE and Type
--				 and a.whaccountid not in
--				(select apiaccountno  from pm_apiaccounts  where date is not null)
--			) v 
--		   on t.pmid = @rollPMID where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

 

----Use this to insert into 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)
 
-- INSERT  into pharmacymaster..ALL_Volume (Date,PMID,WHAPIBrand,WHAPIBrandUnits  )   --Change Column

--      SELECT @date ,@rollPMID, totamt,qty FROM (   -- CHANGE DATES
--			SELECT SUM(ExtSales) as totamt ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty   
--				 FROM  api..v_apisalesdetail a
--                    left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Brand'   -- CHANGE DATES
--            and p.pmid is null   and a.whaccountid not in (select apiaccountno  from pm_apiaccounts  where date is not null)
				 
--		 )vol
--	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume where pmid = @rollPMID and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES

----GENERIC
----Use this to  update 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)  
--      UPDATE t set  
--        WHAPIGeneric = v.totamt,  -- CHANGE  column
--		WHAPIGenericUnits = v.qty
--	    FROM   pharmacymaster..ALL_Volume t 
--			inner join 
--			 (  
--				SELECT SUM(ExtSales) as totamt ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty     
--								 FROM  api..v_apisalesdetail a
--				left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
--								 WHERE      month(invdate) = @in_month  and year(invdate) = @in_year and type = 'Generic' and p.pmid is null --CHANGE DATE and Type
--				 and a.whaccountid not in
--				(select apiaccountno  from pm_apiaccounts  where date is not null)
--			) v 
--		   on t.pmid = @rollPMID where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

 

----Use this to insert into 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)
 
-- INSERT  into pharmacymaster..ALL_Volume (Date,PMID,WHAPIGeneric ,WHAPIGenericUnits )   --Change Column

--      SELECT @date ,@rollPMID,totamt,qty  FROM (   -- CHANGE DATES
--			SELECT SUM(ExtSales) as totamt ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty   
--				 FROM  api..v_apisalesdetail a
--                    left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'Generic'   -- CHANGE DATES
--            and p.pmid is null   and a.whaccountid not in (select apiaccountno  from pm_apiaccounts  where date is not null)
				 
--		 )vol
--	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume where pmid = @rollPMID and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES

----OTC
----Use this to  update 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)  
--      UPDATE t set  
--        WHAPIOTC = v.totamt,  -- CHANGE  column
--		WHAPIOTCUnits = v.qty
--	    FROM   pharmacymaster..ALL_Volume t 
--			inner join 
--			 (  
--				SELECT SUM(ExtSales) as totamt  ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty     
--								 FROM  api..v_apisalesdetail a
--				left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
--								 WHERE      month(invdate) = @in_month  and year(invdate) = @in_year and type = 'OTC' and p.pmid is null --CHANGE DATE and Type
--				 and a.whaccountid not in
--				(select apiaccountno  from pm_apiaccounts  where date is not null)
--			) v 
--		   on t.pmid = @rollPMID where month(t.date) = @in_month and year(t.date) = @in_year  -- CHANGE DATES

 

----Use this to insert into 900000 PMID - where there is no PMID - make sure not getting any that are in the pm_apiAccounts (those are done seperatly)
 
-- INSERT  into pharmacymaster..ALL_Volume (Date,PMID,WHAPIOTC ,WHAPIOTCUnits )   --Change Column

--      SELECT @date ,@rollPMID,totamt,qty  FROM (   -- CHANGE DATES
--			SELECT SUM(ExtSales) as totamt ,sum(case when extsales < 0 then (qty * -1)   when  extsales > 0 then qty else 0 end) as qty   
--				 FROM  api..v_apisalesdetail a
--                    left outer join pm_pharmacy p on a.whaccountid = p.apiaccountno
--				 WHERE      month(invdate) = @in_month and year(invdate) = @in_year and type = 'OTC'   -- CHANGE DATES
--            and p.pmid is null   and a.whaccountid not in (select apiaccountno  from pm_apiaccounts  where date is not null)
				 
--		 )vol
--	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume where pmid = @rollPMID and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES



--	---SET any NULLS TO ZERO and DO totals
    
--	UPDATE pharmacymaster..ALL_Volume set WHAPIBrand = 0.00 where WHAPIBrand is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIOTC = 0.00 where WHAPIOTC is null;

--	UPDATE pharmacymaster..ALL_Volume set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;

--	UPDATE pharmacymaster..ALL_Volume set WHAPITotal = 0.00 where WHAPITotal is null;
--    UPDATE pharmacymaster..ALL_Volume set MLTotal = 0.00 where MLTotal is null;
--    UPDATE pharmacymaster..ALL_Volume set AndaTotal = 0.00 where AndaTotal is null;
--	UPDATE pharmacymaster..ALL_Volume set WHAPITotal = WHAPIBrand + WHAPIGeneric + WHAPIOTC


----SET Other Fields TO ZERO WHERE NULL
--	UPDATE ALL_Volume SET APICOGAppliedSales = 0.00 where APICOGAppliedSales is null;
--	UPDATE ALL_Volume SET APINetSales  = 0.00 where APINetSales is null;
--	UPDATE ALL_Volume SET APIGENRx = 0.00 where APIGENRx is null;
--	UPDATE ALL_Volume SET APIGENTotalSrc = 0.00 where APIGENTotalSrc is null;
--	UPDATE ALL_Volume SET APIGENTotalP2P3 = 0.00 where APIGENTotalP2P3 is null;
--	UPDATE ALL_Volume SET APIGENTotal = 0.00 where APIGENTotal is null;
--	UPDATE ALL_Volume SET APIBrand = 0.00 where APIBrand is null;
--	UPDATE ALL_Volume SET APIOTC = 0.00 where APIOTC is null;
--	UPDATE ALL_Volume SET APIGBRPerc = 0.00 where APIGBRPerc is null;
--	UPDATE ALL_Volume SET AAPCOGAppliedSales = 0.00 where AAPCOGAppliedSales is null;
--	UPDATE ALL_Volume SET AAPNetSales = 0.00 where AAPNetSales is null;
--	UPDATE ALL_Volume SET AAPBrand = 0.00 where AAPBrand is null;
--	UPDATE ALL_Volume SET AAPGENTotal = 0.00 where AAPGENTotal is null;
--	UPDATE ALL_Volume SET AAPGENTotalSrc = 0.00 where AAPGENTotalSrc is null;
--	UPDATE ALL_Volume SET AAPGENExcl = 0.00 where AAPGENExcl is null;
--	UPDATE ALL_Volume SET AAPOTC = 0.00 where AAPOTC is null;
--	UPDATE ALL_Volume SET AAPOther = 0.00 where AAPOther is null;
--	UPDATE ALL_Volume SET AAPTotalRX = 0.00 where AAPTotalRX is null;
--	UPDATE ALL_Volume SET AAPExcludedFromTotalRX = 0.00 where AAPExcludedFromTotalRX is null;
--	UPDATE ALL_Volume SET AAPNonRXOTCandHH = 0.00 where AAPNonRXOTCandHH is null;
--	UPDATE ALL_Volume SET AAPSourceCompliance = 0.00 where AAPSourceCompliance is null;

--	UPDATE ALL_Volume SET UDNetSales = 0.00 where UDNetSales is null;
--	UPDATE ALL_Volume SET UDBrand = 0.00 where UDBrand is null;
--	UPDATE ALL_Volume SET UDGENTotal = 0.00 where UDGENTotal is null;
--	UPDATE ALL_Volume SET UDGENTotalSrc = 0.00 where UDGENTotalSrc is null;
--	UPDATE ALL_Volume SET UDOTC = 0.00 where UDOTC is null;
--	UPDATE ALL_Volume SET UDOther = 0.00 where UDOther is null;
--	UPDATE ALL_Volume SET CombNetSales = 0.00 where CombNetSales is null;
--	UPDATE ALL_Volume SET CombBrands = 0.00 where CombBrands is null;
--	UPDATE ALL_Volume SET CombOTC = 0.00 where CombOTC is null;
--	UPDATE ALL_Volume SET CombGENTotal = 0.00 where CombGENTotal is null;
--	UPDATE ALL_Volume SET CombGENTotalSrc = 0.00 where CombGENTotalSrc is null;
--    UPDATE ALL_Volume SET CombOther = 0.00 where CombOther is null;

--	UPDATE ALL_Volume SET APIOther = 0.0 where APIOther is null;
--	UPDATE ALL_Volume SET UDAdminOnly = 0.0 where UDAdminOnly is null
--	UPDATE ALL_Volume SET CombAdminOnly = 0.0 where CombAdminOnly is nul














GO
