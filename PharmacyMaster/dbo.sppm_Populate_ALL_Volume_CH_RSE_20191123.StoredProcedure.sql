USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_Populate_ALL_Volume_CH_RSE_20191123]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <10/08/2010>
-- Description:	 Populate ALL_VOlume table with CH AAP and API data (from CH_ALLPVA_SALES)
-- =============================================
CREATE PROCEDURE [dbo].[sppm_Populate_ALL_Volume_CH_RSE_20191123]

	@in_month varchar(2)
	, @in_year varchar(4) 

AS

SET NOCOUNT ON;

BEGIN


DECLARE @date DATETIME;
SET @date = @in_month + '/01/' + @in_year;
 
 MERGE [dbo].[ALL_Volume_RSE_20191122] AS t
 USING(SELECT Date,PMID,CHAccountNo,DCNum,DCCity,AccountName,Address,City,State,ZIP,APIAccountNo,AAPAccountNo,UDAccountNo,DEA,APICOGAppliedSales,
						APINetSales,APIGENRx,APIGENTotalSrc,APIGENTotalP2P3,APIGENTotal,APIBrand,APIOTC,APIOther,APIGBRPerc,AAPCOGAppliedSales,AAPNetSales,
						AAPBrand,AAPGENTotal,AAPGENTotalSrc,AAPGENExcl,AAPOTC,AAPOther,
                         AAPTotalRX,	AAPExcludedFromTotalRX,	AAPNonRXOTCandHH, AAPSourceCompliance,
						UDNetSales,UDBrand,UDGENTotalSrc,UDGENTotal,UDOTC,UDOther,UDAdminOnly,CombNetSales,
						CombBrands,CombOTC,CombGENTotal,CombGENTotalSrc,CombOther,CombAdminOnly 
		FROM  dbo.CH_ALLPVA_SALES
		WHERE Date = @Date
		) AS s ON t.PMID = s.PMID
				 AND t.Date = s.Date
								

WHEN MATCHED THEN 

	UPDATE SET 
	CHAccountNo = s.CHAccountNo,
	DCNum = s.DCNum,
	DCCity = s.DCCity,
	--AccountName = s.AccountName,
	Address  = s.Address,
	City  = s.City,
	State = s.State,
	ZIP = s.ZIP,
	APIAccountNo = s.APIAccountNo,
	UDAccountNo  = s.UDAccountNo,
	DEA = s.DEA,
	APICOGAppliedSales  = s.APICOGAppliedSales,
	APINetSales  = s.APINetSales,
	APIGENRx  = s.APIGENRx,
	APIGENTotalSrc = s.APIGENTotalSrc,
	APIGENTotalP2P3 = s.APIGENTotalP2P3,
	APIGENTotal = s.APIGENTotal,
	APIBrand = s.APIBrand,
	APIOTC = s.APIOTC,
	APIOther  = s.APIOther,
	APIGBRPerc  = s.APIGBRPerc,
	AAPCOGAppliedSales  = s.AAPCOGAppliedSales,
	AAPNetSales = s.AAPNetSales,
	AAPBrand = s.AAPBrand,
	AAPGENTotal = s.AAPGENTotal,
	AAPGENTotalSrc = s.AAPGENTotalSrc,
	AAPGENExcl = s.AAPGENExcl,
	AAPOTC  = s.AAPOTC,
	AAPOther  = s.AAPOther,
	AAPTotalRX = s.AAPTotalRX,
	AAPExcludedFromTotalRX = s.AAPExcludedFromTotalRX,
	AAPNonRXOTCandHH = s.AAPNonRXOTCandHH,
	AAPSourceCompliance = s.AAPSourceCompliance,
	UDNetSales  = s.UDNetSales,
	UDBrand = s.UDBrand,
	UDGENTotalSrc = s.UDGENTotalSrc,
	UDGENTotal  = s.UDGENTotal,
	UDOTC  = s.UDOTC,
	UDOther  = s.UDOther,
	UDAdminOnly   = s.UDAdminOnly,
	CombNetSales  = s.CombNetSales,
	CombBrands  = s.CombBrands,
	CombOTC   = s.CombOTC,
	CombGENTotal  = s.CombGENTotal,
	CombGENTotalSrc = s.CombGENTotalSrc,
	CombOther = s.CombOther,
	CombAdminOnly = s.CombAdminOnly

	WHEN NOT MATCHED THEN

	INSERT(CHAccountNo,DCNum,DCCity,AccountName,Address,City,State,ZIP,AAPAccountNo,APIAccountNo,DEA,APICOGAppliedSales,APINetSales,APIGENRx
			,APIGENTotalSrc,APIGENTotalP2P3,APIGENTotal,APIBrand,APIOTC,APIOther,APIGBRPerc,AAPCOGAppliedSales,AAPNetSales,AAPBrand
			, AAPGENTotal,AAPGENTotalSrc,AAPGENExcl,AAPOTC,AAPOther,AAPTotalRX,AAPExcludedFromTotalRX,AAPNonRXOTCandHH,AAPSourceCompliance,UDNetSales
			,UDBrand,UDGENTotalSrc,UDGENTotal,UDOTC,UDOther,UDAdminOnly,CombNetSales,CombBrands,CombOTC,CombGENTotal,CombGENTotalSrc,CombOther,CombAdminOnly
			)
	VALUES(s.CHAccountNo,s.DCNum,DCCity,s.AccountName,s.Address,s.City,s.State,s.ZIP,s.AAPAccountNo,s.APIAccountNo,s.DEA,s.APICOGAppliedSales,s.APINetSales,s.APIGENRx
			,s.APIGENTotalSrc,s.APIGENTotalP2P3,s.APIGENTotal,s.APIBrand,s.APIOTC,s.APIOther,s.APIGBRPerc,s.AAPCOGAppliedSales,s.AAPNetSales,s.AAPBrand
			, s.AAPGENTotal,s.AAPGENTotalSrc,s.AAPGENExcl,s.AAPOTC,s.AAPOther,s.AAPTotalRX,s.AAPExcludedFromTotalRX,s.AAPNonRXOTCandHH,s.AAPSourceCompliance,s.UDNetSales
			,s.UDBrand,s.UDGENTotalSrc,s.UDGENTotal,s.UDOTC,s.UDOther,s.UDAdminOnly,s.CombNetSales,s.CombBrands,s.CombOTC,s.CombGENTotal,s.CombGENTotalSrc,s.CombOther,s.CombAdminOnly
			)
	;
---- UPDATE WITH CH 
--UPDATE v set 
--         CHAccountNo = c.CHAccountNo,
--         DCNum = c.DCNum,
--         DCCity = c.DCCity,
--         AccountName = c.AccountName,
--         Address  = c.Address,
--         City  = c.City,
--         State = c.State,
--         ZIP = c.ZIP,
--         APIAccountNo = c.APIAccountNo,
--         AAPAccountNo = c.AAPAccountNo,
--         UDAccountNo  = c.UDAccountNo,
--         DEA = c.DEA,
--        APICOGAppliedSales  = c.APICOGAppliedSales,
--        APINetSales  = c.APINetSales,
--        APIGENRx  = c.APIGENRx,
--        APIGENTotalSrc = c.APIGENTotalSrc,
--        APIGENTotalP2P3 = c.APIGENTotalP2P3,
--        APIGENTotal = c.APIGENTotal,
--        APIBrand = c.APIBrand,
--        APIOTC = c.APIOTC,
--        APIOther  = c.APIOther,
--        APIGBRPerc  = c.APIGBRPerc,
--        AAPCOGAppliedSales  = c.AAPCOGAppliedSales,
--        AAPNetSales = c.AAPNetSales,
--        AAPBrand = c.AAPBrand,
--        AAPGENTotal = c.AAPGENTotal,
--        AAPGENTotalSrc = c.AAPGENTotalSrc,
--        AAPGENExcl = c.AAPGENExcl,
--        AAPOTC  = c.AAPOTC,
--        AAPOther  = c.AAPOther,
--        AAPTotalRX = c.AAPTotalRX,
--	    AAPExcludedFromTotalRX = c.AAPExcludedFromTotalRX,
--	    AAPNonRXOTCandHH = c.AAPNonRXOTCandHH,
--	    AAPSourceCompliance = c.AAPSourceCompliance,
--        UDNetSales  = c.UDNetSales,
--        UDBrand = c.UDBrand,
--        UDGENTotalSrc = c.UDGENTotalSrc,
--        UDGENTotal  = c.UDGENTotal,
--        UDOTC  = c.UDOTC,
--        UDOther  = c.UDOther,
--        UDAdminOnly   = c.UDAdminOnly,
--        CombNetSales  = c.CombNetSales,
--        CombBrands  = c.CombBrands,
--        CombOTC   = c.CombOTC,
--        CombGENTotal  = c.CombGENTotal,
--        CombGENTotalSrc = c.CombGENTotalSrc,
--        CombOther = c.CombOther,
--        CombAdminOnly = c.CombAdminOnly
--	    FROM   pharmacymaster..ALL_Volume v 
--			inner join 
--			 (  
--              	SELECT Date,PMID,CHAccountNo,DCNum,DCCity,AccountName,Address,City,State,ZIP,APIAccountNo,AAPAccountNo,UDAccountNo,DEA,APICOGAppliedSales,
--						APINetSales,APIGENRx,APIGENTotalSrc,APIGENTotalP2P3,APIGENTotal,APIBrand,APIOTC,APIOther,APIGBRPerc,AAPCOGAppliedSales,AAPNetSales,
--						AAPBrand,AAPGENTotal,AAPGENTotalSrc,AAPGENExcl,AAPOTC,AAPOther,
--                        AAPTotalRX,	AAPExcludedFromTotalRX,	AAPNonRXOTCandHH, AAPSourceCompliance,
--                        UDNetSales,UDBrand,UDGENTotalSrc,UDGENTotal,UDOTC,UDOther,UDAdminOnly,CombNetSales,
--						CombBrands,CombOTC,CombGENTotal,CombGENTotalSrc,CombOther,CombAdminOnly
--                 FROM CH_ALLPVA_SALES
--				 WHERE      month(date) = @in_month and year(date) = @in_year   
--			) c 
--		   on v.pmid =c.pmid where month(v.date) = @in_month and year(v.date) = @in_year  -- CHANGE DATES

----INSERT WH DATA Brand WHERE THERE IS WH VOLUME BUT THERE WAS NO PVA VOLUME
-- INSERT  into pharmacymaster..ALL_Volume (Date,PMID,CHAccountNo,DCNum,DCCity,AccountName,Address,City,State,ZIP,APIAccountNo,AAPAccountNo,UDAccountNo,DEA,APICOGAppliedSales,
--						APINetSales,APIGENRx,APIGENTotalSrc,APIGENTotalP2P3,APIGENTotal,APIBrand,APIOTC,APIOther,APIGBRPerc,AAPCOGAppliedSales,AAPNetSales,
--						AAPBrand,AAPGENTotal,AAPGENTotalSrc,AAPGENExcl,AAPOTC,AAPOther,
--                         AAPTotalRX,	AAPExcludedFromTotalRX,	AAPNonRXOTCandHH, AAPSourceCompliance,
--						UDNetSales,UDBrand,UDGENTotalSrc,UDGENTotal,UDOTC,UDOther,UDAdminOnly,CombNetSales,
--						CombBrands,CombOTC,CombGENTotal,CombGENTotalSrc,CombOther,CombAdminOnly )   

--      SELECT @date ,PMID,CHAccountNo,DCNum,DCCity,AccountName,Address,City,State,ZIP,APIAccountNo,AAPAccountNo,UDAccountNo,DEA,APICOGAppliedSales,
--						APINetSales,APIGENRx,APIGENTotalSrc,APIGENTotalP2P3,APIGENTotal,APIBrand,APIOTC,APIOther,APIGBRPerc,AAPCOGAppliedSales,AAPNetSales,
--						AAPBrand,AAPGENTotal,AAPGENTotalSrc,AAPGENExcl,AAPOTC,AAPOther,
--                         AAPTotalRX,	AAPExcludedFromTotalRX,	AAPNonRXOTCandHH, AAPSourceCompliance,
--						UDNetSales,UDBrand,UDGENTotalSrc,UDGENTotal,UDOTC,UDOther,UDAdminOnly,CombNetSales,
--						CombBrands,CombOTC,CombGENTotal,CombGENTotalSrc,CombOther,CombAdminOnly
--      FROM (   -- CHANGE DATES
--			SELECT Date,PMID,CHAccountNo,DCNum,DCCity,AccountName,Address,City,State,ZIP,APIAccountNo,AAPAccountNo,UDAccountNo,DEA,APICOGAppliedSales,
--						APINetSales,APIGENRx,APIGENTotalSrc,APIGENTotalP2P3,APIGENTotal,APIBrand,APIOTC,APIOther,APIGBRPerc,AAPCOGAppliedSales,AAPNetSales,
--						AAPBrand,AAPGENTotal,AAPGENTotalSrc,AAPGENExcl,AAPOTC,AAPOther,
--                         AAPTotalRX,	AAPExcludedFromTotalRX,	AAPNonRXOTCandHH, AAPSourceCompliance,
--						UDNetSales,UDBrand,UDGENTotalSrc,UDGENTotal,UDOTC,UDOther,UDAdminOnly,CombNetSales,
--						CombBrands,CombOTC,CombGENTotal,CombGENTotalSrc,CombOther,CombAdminOnly
--                 FROM CH_ALLPVA_SALES
--				 WHERE      month(date) = @in_month and year(date) = @in_year   
--		 )vol
--	 WHERE not exists  (select pmid from pharmacymaster..ALL_Volume where pmid = vol.pmid and   month(date) = @in_month and year(date) = @in_year  ); -- CHANGE DATES



	---SET any NULLS TO ZERO and DO totals
    
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPIBrand = 0.00 where WHAPIBrand is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPIOTC = 0.00 where WHAPIOTC is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPITotal = 0.00 where WHAPITotal is null;
--    UPDATE [dbo].[ALL_Volume_RSE_20191122] set MLTotal = 0.00 where MLTotal is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set AndaTotal = 0.00 where AndaTotal is null;


--	--SET Other Fields TO ZERO WHERE NULL
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET APICOGAppliedSales = 0.00 where APICOGAppliedSales is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET APINetSales  = 0.00 where APINetSales is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET APIGENRx = 0.00 where APIGENRx is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET APIGENTotalSrc = 0.00 where APIGENTotalSrc is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET APIGENTotalP2P3 = 0.00 where APIGENTotalP2P3 is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET APIGENTotal = 0.00 where APIGENTotal is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET APIBrand = 0.00 where APIBrand is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET APIOTC = 0.00 where APIOTC is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET APIGBRPerc = 0.00 where APIGBRPerc is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPCOGAppliedSales = 0.00 where AAPCOGAppliedSales is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPNetSales = 0.00 where AAPNetSales is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPBrand = 0.00 where AAPBrand is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPGENTotal = 0.00 where AAPGENTotal is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPGENTotalSrc = 0.00 where AAPGENTotalSrc is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPGENExcl = 0.00 where AAPGENExcl is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPOTC = 0.00 where AAPOTC is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPOther = 0.00 where AAPOther is null;

---- AAPTotalRX,	AAPExcludedFromTotalRX,	AAPNonRXOTCandHH, AAPSourceCompliance,

--    UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPTotalRX = 0.00 where AAPTotalRX is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPExcludedFromTotalRX = 0.00 where AAPExcludedFromTotalRX is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPNonRXOTCandHH = 0.00 where AAPNonRXOTCandHH is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET AAPSourceCompliance = 0.00 where AAPSourceCompliance is null;

--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET UDNetSales = 0.00 where UDNetSales is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET UDBrand = 0.00 where UDBrand is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET UDGENTotal = 0.00 where UDGENTotal is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET UDGENTotalSrc = 0.00 where UDGENTotalSrc is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET UDOTC = 0.00 where UDOTC is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET UDOther = 0.00 where UDOther is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombNetSales = 0.00 where CombNetSales is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombBrands = 0.00 where CombBrands is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombOTC = 0.00 where CombOTC is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombGENTotal = 0.00 where CombGENTotal is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombGENTotalSrc = 0.00 where CombGENTotalSrc is null;
--    UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombOther = 0.00 where CombOther is null;

--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET APIOther = 0.0 where APIOther is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET UDAdminOnly = 0.0 where UDAdminOnly is null
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombAdminOnly = 0.0 where CombAdminOnly is null;

--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPIBrand = 0.00 where WHAPIBrand is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPIOTC = 0.00 where WHAPIOTC is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPITotal = 0.00 where WHAPITotal is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
--	UPDATE [dbo].[ALL_Volume_RSE_20191122] set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;

--Update Totals 
	UPDATE x
	SET CombNetSales = APINetSales + AAPNetSales + UDNetSales
	, CombBrands = APIBrand + AAPBrand + UDBrand
    , CombOTC = APIOTC + AAPOTC + UDOTC 
    , CombGENTotal = APIGENTotal + AAPGENTotal + UDGENTotal
    , CombGENTotalSrc = APIGENTotalSrc + AAPGENTotalSrc + UDGENTotalSrc
    , CombOther = AAPOther + UDOther + APIOther
	, CombAdminOnly = UDAdminOnly
	FROM [dbo].[ALL_Volume_RSE_20191122] AS x
	WHERE Date = @Date


--UPdate Totals 
	--UPDATE [dbo].[ALL_Volume_RSE_20191122] set CombNetSales = APINetSales + AAPNetSales + UDNetSales;
	--UPDATE [dbo].[ALL_Volume_RSE_20191122] set CombBrands = APIBrand + AAPBrand + UDBrand;
 --   UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombOTC = APIOTC + AAPOTC + UDOTC ;
 --   UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombGENTotal = APIGENTotal + AAPGENTotal + UDGENTotal;
 --   UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombGENTotalSrc = APIGENTotalSrc + AAPGENTotalSrc + UDGENTotalSrc;
 --   UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombOther = AAPOther + UDOther + APIOther;
	--UPDATE [dbo].[ALL_Volume_RSE_20191122] SET CombAdminOnly = UDAdminOnly;

--  QA for what was loaded from the CH_ALLPVA_SALES
--	select sum(CombNetSales) from  CH_ALLPVA_SALES where month(date)= 09
--	select sum(CombNetSales) from  ALL_Volume where month(date)= 09
--
--	 select sum(CombBrands)  from CH_ALLPVA_SALES where month(date)= 09
--	 select sum(CombBrands)  from ALL_Volume where month(date)= 09
--
--     select sum(CombOTC)  from CH_ALLPVA_SALES   where month(date)= 09
--     select sum(CombOTC)  from ALL_Volume   where month(date)= 09 
-- 
--     select sum(CombGENTotal)  from CH_ALLPVA_SALES where month(date)= 09
--     select sum(CombGENTotal)  from ALL_Volume where month(date)= 09
--
--    select sum(CombGENTotalSrc)  from CH_ALLPVA_SALES where month(date)= 09
--    select sum(CombGENTotalSrc)  from ALL_Volume where month(date)= 09
--
--     select sum(CombOther)  from CH_ALLPVA_SALES   where month(date)= 09
--     select sum(CombOther)  from ALL_Volume   where month(date)= 09
--
--	 select sum(CombAdminOnly)   from CH_ALLPVA_SALES where month(date)= 09
--	 select sum(CombAdminOnly)   from ALL_Volume where month(date)= 09
--
--
--	select sum(CombNetSales), sum( APINetSales + AAPNetSales + UDNetSales) from CH_ALLPVA_SALES where month(date) = 09
--	select sum(CombNetSales), sum( APINetSales + AAPNetSales + UDNetSales) from ALL_Volume where month(date) = 09
--
--	select  sum(CombBrands) ,sum(APIBrand + AAPBrand + UDBrand ) from CH_ALLPVA_SALES where month(date) = 09
--	select  sum(CombBrands) ,sum(APIBrand + AAPBrand + UDBrand ) from ALL_Volume where month(date) = 09
--
--    select   sum(CombOTC), sum(APIOTC + AAPOTC + UDOTC) from CH_ALLPVA_SALES where month(date) = 09
--    select   sum(CombOTC), sum(APIOTC + AAPOTC + UDOTC) from ALL_Volume where month(date) = 09
--
--    select   sum(CombGENTotal),sum(APIGENTotal + AAPGENTotal + UDGENTotal) from CH_ALLPVA_SALES where month(date) = 09
--    select   sum(CombGENTotal),sum(APIGENTotal + AAPGENTotal + UDGENTotal) from ALL_Volume where month(date) = 09
--
--    select   sum(CombGENTotalSrc), sum(APIGENTotalSrc + AAPGENTotalSrc + UDGENTotalSrc) from CH_ALLPVA_SALES where month(date) = 09
--    select   sum(CombGENTotalSrc), sum(APIGENTotalSrc + AAPGENTotalSrc + UDGENTotalSrc) from ALL_Volume where month(date) = 09
--
--    select   sum(CombOther), sum(AAPOther + UDOther + APIOther) from CH_ALLPVA_SALES where month(date) = 09
--    select   sum(CombOther), sum(AAPOther + UDOther + APIOther) from ALL_Volume where month(date) = 09
--
--	select   sum(CombAdminOnly), sum(UDAdminOnly) from CH_ALLPVA_SALES where month(date) = 09
--	select   sum(CombAdminOnly), sum(UDAdminOnly) from ALL_Volume where month(date) = 09


 
END










GO
