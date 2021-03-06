USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Populate_ALL_Volume_Bashas]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate ALL_VOlume table with API WH Sales 
-- =============================================
CREATE PROCEDURE [dbo].[sppm_Populate_ALL_Volume_Bashas]
(@in_month varchar(2), @in_year varchar(4) )
AS
BEGIN

--
--   IF EXISTS(SELECT name FROM sys.tables
--        WHERE name = 'tmp_ytd_WH_Sales_CS')
--          DROP TABLE tmp_ytd_WH_Sales_CS
 
DECLARE @date varchar(10);
SET @date = @in_month + '/01/' + @in_year;
 
 

-- UPDATE Bashas EXTSALES
UPDATE t set 
        UDNETSALES =  totamt  -- CHANGE DATES
 
	    FROM   pharmacymaster..ALL_Volume t 
			inner join 
			 (  
              	SELECT SUM(ExtSales) as totamt ,   pmid
				 FROM  purchases..pm_ch_bashas 
                    
				 WHERE      month(date) = @in_month and year(date) = @in_year  
				 GROUP BY pmid
			) v 
		   on t.pmid =v.pmid where month(t.date) = @in_month and year(t.date) = @in_year   

--INSERT Bashas EXTSALES
 INSERT  into pharmacymaster..ALL_Volume (Date,PMID,UDNETSALES )   

      SELECT @date ,PMID,totamt FROM (   -- CHANGE DATES
			SELECT SUM(ExtSales) as totamt , pmid 
                      FROM  purchases..pm_ch_bashas 
					 WHERE      month(date) = @in_month and year(date) = @in_year  
				 GROUP BY  pmid 
		 )vol
	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES



	---SET any NULLS TO ZERO and DO totals
    
	UPDATE pharmacymaster..ALL_Volume set WHAPIBrand = 0.00 where WHAPIBrand is null;
	UPDATE pharmacymaster..ALL_Volume set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
	UPDATE pharmacymaster..ALL_Volume set WHAPIOTC = 0.00 where WHAPIOTC is null;

	UPDATE pharmacymaster..ALL_Volume set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
	UPDATE pharmacymaster..ALL_Volume set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
	UPDATE pharmacymaster..ALL_Volume set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;

	UPDATE pharmacymaster..ALL_Volume set WHAPITotal = 0.00 where WHAPITotal is null;
    UPDATE pharmacymaster..ALL_Volume set MLTotal = 0.00 where MLTotal is null;
    UPDATE pharmacymaster..ALL_Volume set AndaTotal = 0.00 where AndaTotal is null;
	UPDATE pharmacymaster..ALL_Volume set WHAPITotal = WHAPIBrand + WHAPIGeneric + WHAPIOTC


--SET Other Fields TO ZERO WHERE NULL
	UPDATE ALL_Volume SET APICOGAppliedSales = 0.00 where APICOGAppliedSales is null;
	UPDATE ALL_Volume SET APINetSales  = 0.00 where APINetSales is null;
	UPDATE ALL_Volume SET APIGENRx = 0.00 where APIGENRx is null;
	UPDATE ALL_Volume SET APIGENTotalSrc = 0.00 where APIGENTotalSrc is null;
	UPDATE ALL_Volume SET APIGENTotalP2P3 = 0.00 where APIGENTotalP2P3 is null;
	UPDATE ALL_Volume SET APIGENTotal = 0.00 where APIGENTotal is null;
	UPDATE ALL_Volume SET APIBrand = 0.00 where APIBrand is null;
	UPDATE ALL_Volume SET APIOTC = 0.00 where APIOTC is null;
	UPDATE ALL_Volume SET APIGBRPerc = 0.00 where APIGBRPerc is null;
	UPDATE ALL_Volume SET AAPCOGAppliedSales = 0.00 where AAPCOGAppliedSales is null;
	UPDATE ALL_Volume SET AAPNetSales = 0.00 where AAPNetSales is null;
	UPDATE ALL_Volume SET AAPBrand = 0.00 where AAPBrand is null;
	UPDATE ALL_Volume SET AAPGENTotal = 0.00 where AAPGENTotal is null;
	UPDATE ALL_Volume SET AAPGENTotalSrc = 0.00 where AAPGENTotalSrc is null;
	UPDATE ALL_Volume SET AAPGENExcl = 0.00 where AAPGENExcl is null;
	UPDATE ALL_Volume SET AAPOTC = 0.00 where AAPOTC is null;
	UPDATE ALL_Volume SET AAPOther = 0.00 where AAPOther is null;
	UPDATE ALL_Volume SET UDNetSales = 0.00 where UDNetSales is null;
	UPDATE ALL_Volume SET UDBrand = 0.00 where UDBrand is null;
	UPDATE ALL_Volume SET UDGENTotal = 0.00 where UDGENTotal is null;
	UPDATE ALL_Volume SET UDGENTotalSrc = 0.00 where UDGENTotalSrc is null;
	UPDATE ALL_Volume SET UDOTC = 0.00 where UDOTC is null;
	UPDATE ALL_Volume SET UDOther = 0.00 where UDOther is null;
	UPDATE ALL_Volume SET CombNetSales = 0.00 where CombNetSales is null;
	UPDATE ALL_Volume SET CombBrands = 0.00 where CombBrands is null;
	UPDATE ALL_Volume SET CombOTC = 0.00 where CombOTC is null;
	UPDATE ALL_Volume SET CombGENTotal = 0.00 where CombGENTotal is null;
	UPDATE ALL_Volume SET CombGENTotalSrc = 0.00 where CombGENTotalSrc is null;
    UPDATE ALL_Volume SET CombOther = 0.00 where CombOther is null;

	UPDATE ALL_Volume SET APIOther = 0.0 where APIOther is null;
	UPDATE ALL_Volume SET UDAdminOnly = 0.0 where UDAdminOnly is null
	UPDATE ALL_Volume SET CombAdminOnly = 0.0 where CombAdminOnly is null;

--UPdate Totals 
	UPDATE ALL_Volume set CombNetSales = APINetSales + AAPNetSales + UDNetSales;
	UPDATE ALL_Volume set CombBrands = APIBrand + AAPBrand + UDBrand;
    UPDATE ALL_Volume SET CombOTC = APIOTC + AAPOTC + UDOTC;  
    UPDATE ALL_Volume SET CombGENTotal = APIGENTotal + AAPGENTotal + UDGENTotal;
    UPDATE ALL_Volume SET CombGENTotalSrc = APIGENTotalSrc + AAPGENTotalSrc + UDGENTotalSrc;
    UPDATE ALL_Volume SET CombOther = AAPOther + UDOther + APIOther;
	UPDATE ALL_Volume SET CombAdminOnly = UDAdminOnly;

 
END








GO
