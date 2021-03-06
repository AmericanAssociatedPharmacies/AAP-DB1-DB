USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_createt_API_MTD]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spapi_createt_API_MTD]
  
AS
SET NOCOUNT ON

 

BEGIN
	DECLARE @invDate datetime;
	DECLARE @startDate varchar(10);

	SET @invDate = (SELECT MAX(invdate) from api..v_apisalesdetail);
	SET @startDate = cast(month(@invDate) as varchar(2)) + '/01/' + cast(year(@invDate) as varchar(4));

   
	TRUNCATE TABLE webdev..API_SalesMTD 

-- Brand - do not need to do update at this point as the table is empty
	INSERT INTO webdev..API_SalesMTD (StartDate,EndDate,APIAccountNo,BrandSales)
	SELECT @startdate,@invDate,whaccountid,sum(extsales) as Brand from api..v_apisalesdetail where type = 'Brand' and month(invdate) = month(@invDate) and year(invdate) = year(@invDate)
            and whaccountid not in (select APIAccountNo from webdev..API_SalesMTD)
			group by whaccountid 


--Generic - update any that are already in there and then insert those that are not

	UPDATE  su  set 
		GenericSales = extsales
	FROM webdev..API_SalesMTD su 
	inner join 
		(  SELECT SUM(ExtSales) as extsales  ,whaccountid
			 FROM  api..v_apisalesdetail 
			 WHERE     month(invdate) = month(@invDate) and year(invdate) = year(@invDate) and type = 'Generic'
			 GROUP BY whaccountid ) api
	on su.APIAccountNo = api.whaccountid  

    INSERT INTO webdev..API_SalesMTD (StartDate,EndDate,APIAccountNo,GenericSales)
   	SELECT  @startdate,@invDate,whaccountid,sum(extsales) as Generic from api..v_apisalesdetail where type = 'Generic' and month(invdate) = month(@invDate) and year(invdate) = year(@invDate)
			and whaccountid not in (select APIAccountNo from webdev..API_SalesMTD)
			group by whaccountid;

--OTC - update any that are already in there and then insert those that are not

	UPDATE  su  set 
		OTCSales = extsales
	FROM webdev..API_SalesMTD su 
	inner join 
		(  SELECT SUM(ExtSales) as extsales  ,whaccountid
			 FROM  api..v_apisalesdetail 
			 WHERE     month(invdate) = month(@invDate) and year(invdate) = year(@invDate) and type = 'OTC'
			 GROUP BY whaccountid ) api
	on su.APIAccountNo = api.whaccountid  

    INSERT INTO webdev..API_SalesMTD (StartDate,EndDate,APIAccountNo,OTCSales)
   	SELECT @startdate,@invDate,whaccountid,sum(extsales) as OTC from api..v_apisalesdetail where type = 'OTC' and month(invdate) = month(@invDate) and year(invdate) = year(@invDate)
			 and whaccountid not in (select APIAccountNo from webdev..API_SalesMTD)
			group by whaccountid;

--TOTALS - don't need to do insert as you won't have a total without having a brand,generic or otc
	

	UPDATE  su  set 
		TotalSales = extsales
	FROM webdev..API_SalesMTD su 
	inner join 
		(  SELECT SUM(ExtSales) as extsales  ,whaccountid
			 FROM  api..v_apisalesdetail 
			 WHERE     month(invdate) = month(@invDate) and year(invdate) = year(@invDate)  
			 GROUP BY whaccountid ) api
	on su.APIAccountNo = api.whaccountid 

---Now set the nulls to zero

	UPDATE webdev..API_SalesMTD set BrandSales = 0.00 where BrandSales is null;
	UPDATE webdev..API_SalesMTD set GenericSales = 0.00 where GenericSales is null;
	UPDATE webdev..API_SalesMTD set OTCSales = 0.00 where OTCSales is null;
	UPDATE webdev..API_SalesMTD set TotalSales = 0.00 where BrandSales is null;

-- Now update PMID

	UPDATE  su  set 
		su.PMID = pm.PMID
	FROM webdev..API_SalesMTD su 
	inner join 
		(  SELECT pmid ,apiaccountno
			 FROM  pharmacymaster..pm_pharmacy 
        ) pm
	on su.APIAccountNo = pm.apiaccountno 
	

 

END

SET NOCOUNT OFF
GO
