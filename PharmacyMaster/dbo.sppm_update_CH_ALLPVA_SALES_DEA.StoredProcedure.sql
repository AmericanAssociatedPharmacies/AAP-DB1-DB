USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[sppm_update_CH_ALLPVA_SALES_DEA]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <04/28/2010>
-- Description:	UPdate PM_Programs table
-- =============================================
CREATE PROCEDURE [dbo].[sppm_update_CH_ALLPVA_SALES_DEA]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
   UPDATE  a  set 
	   a.dea = p.dea
          FROM CH_ALLPVA_SALES a
		  join 
			( select   pmid,dea  from pm_pharmacy   ) p
	      on a.pmid  = p.pmid   

  --ALSO SETTING TO ZERO so there are no nulls in it

    UPDATE CH_ALLPVA_SALES SET APICOGAppliedSales = 0.00 where APICOGAppliedSales is null;
	UPDATE CH_ALLPVA_SALES SET APINetSales  = 0.00 where APINetSales is null;
	UPDATE CH_ALLPVA_SALES SET APIGENRx = 0.00 where APIGENRx is null;
	UPDATE CH_ALLPVA_SALES SET APIGENTotalSrc = 0.00 where APIGENTotalSrc is null;
	UPDATE CH_ALLPVA_SALES SET APIGENTotalP2P3 = 0.00 where APIGENTotalP2P3 is null;
	UPDATE CH_ALLPVA_SALES SET APIGENTotal = 0.00 where APIGENTotal is null;
	UPDATE CH_ALLPVA_SALES SET APIBrand = 0.00 where APIBrand is null;
	UPDATE CH_ALLPVA_SALES SET APIOTC = 0.00 where APIOTC is null;
	UPDATE CH_ALLPVA_SALES SET APIGBRPerc = 0.00 where APIGBRPerc is null;
	UPDATE CH_ALLPVA_SALES SET AAPCOGAppliedSales = 0.00 where AAPCOGAppliedSales is null;
	UPDATE CH_ALLPVA_SALES SET AAPNetSales = 0.00 where AAPNetSales is null;
	UPDATE CH_ALLPVA_SALES SET AAPBrand = 0.00 where AAPBrand is null;
	UPDATE CH_ALLPVA_SALES SET AAPGENTotal = 0.00 where AAPGENTotal is null;
	UPDATE CH_ALLPVA_SALES SET AAPGENTotalSrc = 0.00 where AAPGENTotalSrc is null;
	UPDATE CH_ALLPVA_SALES SET AAPGENExcl = 0.00 where AAPGENExcl is null;
	UPDATE CH_ALLPVA_SALES SET AAPOTC = 0.00 where AAPOTC is null;
	UPDATE CH_ALLPVA_SALES SET AAPOther = 0.00 where AAPOther is null;

	UPDATE CH_ALLPVA_SALES SET AAPTotalRX = 0.00 where AAPTotalRX is null;
	UPDATE CH_ALLPVA_SALES SET AAPExcludedFromTotalRX = 0.00 where AAPExcludedFromTotalRX is null;
	UPDATE CH_ALLPVA_SALES SET AAPNonRXOTCandHH = 0.00 where AAPNonRXOTCandHH is null;
	UPDATE CH_ALLPVA_SALES SET AAPSourceCompliance = 0.00 where AAPSourceCompliance is null;

	UPDATE CH_ALLPVA_SALES SET UDNetSales = 0.00 where UDNetSales is null;
	UPDATE CH_ALLPVA_SALES SET UDBrand = 0.00 where UDBrand is null;
	UPDATE CH_ALLPVA_SALES SET UDGENTotal = 0.00 where UDGENTotal is null;
	UPDATE CH_ALLPVA_SALES SET UDGENTotalSrc = 0.00 where UDGENTotalSrc is null;
	UPDATE CH_ALLPVA_SALES SET UDOTC = 0.00 where UDOTC is null;
	UPDATE CH_ALLPVA_SALES SET UDOther = 0.00 where UDOther is null;
	UPDATE CH_ALLPVA_SALES SET CombNetSales = 0.00 where CombNetSales is null;
	UPDATE CH_ALLPVA_SALES SET CombBrands = 0.00 where CombBrands is null;
	UPDATE CH_ALLPVA_SALES SET CombOTC = 0.00 where CombOTC is null;
	UPDATE CH_ALLPVA_SALES SET CombGENTotal = 0.00 where CombGENTotal is null;
	UPDATE CH_ALLPVA_SALES SET CombGENTotalSrc = 0.00 where CombGENTotalSrc is null;
    UPDATE CH_ALLPVA_SALES SET CombOther = 0.00 where CombOther is null;

	UPDATE CH_ALLPVA_SALES SET APIOther = 0.0 where APIOther is null;
	UPDATE CH_ALLPVA_SALES SET UDAdminOnly = 0.0 where UDAdminOnly is null
	UPDATE CH_ALLPVA_SALES SET CombAdminOnly = 0.0 where CombAdminOnly is null;

	--Also updating totals - I created the APIOther - so Combined other needs to be updated
	UPDATE CH_ALLPVA_SALES set CombNetSales = APINetSales + AAPNetSales + UDNetSales;
	UPDATE CH_ALLPVA_SALES set CombBrands = APIBrand + AAPBrand + UDBrand;
    UPDATE CH_ALLPVA_SALES SET CombOTC = APIOTC + AAPOTC + UDOTC ;
    UPDATE CH_ALLPVA_SALES SET CombGENTotal = APIGENTotal + AAPGENTotal + UDGENTotal;
    UPDATE CH_ALLPVA_SALES SET CombGENTotalSrc = APIGENTotalSrc + AAPGENTotalSrc + UDGENTotalSrc;
    UPDATE CH_ALLPVA_SALES SET CombOther = AAPOther + UDOther + APIOther;
	UPDATE CH_ALLPVA_SALES SET CombAdminOnly = UDAdminOnly;

 
END








GO
