USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_setALLVolumeNullToZero_TEST]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/02/2012>
-- Description:	When Inserting the ALL_Volume_Test through UI need to set null values  to zero
-- =============================================
CREATE PROCEDURE [dbo].[sppm_setALLVolumeNullToZero_TEST]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
--UPdate Totals 
	UPDATE Reports..ALL_Volume_Test set WHAPIBrand = 0.00 where WHAPIBrand is null;
	UPDATE Reports..ALL_Volume_Test set WHAPIGeneric = 0.00 where WHAPIGeneric is null;
	UPDATE Reports..ALL_Volume_Test set WHAPIOTC = 0.00 where WHAPIOTC is null;

	UPDATE Reports..ALL_Volume_Test set WHAPIBrandUnits = 0.00 where WHAPIBrandUnits is null;
	UPDATE Reports..ALL_Volume_Test set WHAPIGenericUnits = 0.00 where WHAPIGenericUnits is null;
	UPDATE Reports..ALL_Volume_Test set WHAPIOTCUnits = 0.00 where WHAPIOTCUnits is null;

	UPDATE Reports..ALL_Volume_Test set WHAPITotal = 0.00 where WHAPITotal is null;
    UPDATE Reports..ALL_Volume_Test set MLTotal = 0.00 where MLTotal is null;
    UPDATE Reports..ALL_Volume_Test set AndaTotal = 0.00 where AndaTotal is null;


--SET Other Fields TO ZERO WHERE NULL
	UPDATE ALL_Volume_Test SET APICOGAppliedSales = 0.00 where APICOGAppliedSales is null;
	UPDATE ALL_Volume_Test SET APINetSales  = 0.00 where APINetSales is null;
	UPDATE ALL_Volume_Test SET APIGENRx = 0.00 where APIGENRx is null;
	UPDATE ALL_Volume_Test SET APIGENTotalSrc = 0.00 where APIGENTotalSrc is null;
	UPDATE ALL_Volume_Test SET APIGENTotalP2P3 = 0.00 where APIGENTotalP2P3 is null;
	UPDATE ALL_Volume_Test SET APIGENTotal = 0.00 where APIGENTotal is null;
	UPDATE ALL_Volume_Test SET APIBrand = 0.00 where APIBrand is null;
	UPDATE ALL_Volume_Test SET APIOTC = 0.00 where APIOTC is null;
	UPDATE ALL_Volume_Test SET APIGBRPerc = 0.00 where APIGBRPerc is null;
	UPDATE ALL_Volume_Test SET AAPCOGAppliedSales = 0.00 where AAPCOGAppliedSales is null;
	UPDATE ALL_Volume_Test SET AAPNetSales = 0.00 where AAPNetSales is null;
	UPDATE ALL_Volume_Test SET AAPBrand = 0.00 where AAPBrand is null;
	UPDATE ALL_Volume_Test SET AAPGENTotal = 0.00 where AAPGENTotal is null;
	UPDATE ALL_Volume_Test SET AAPGENTotalSrc = 0.00 where AAPGENTotalSrc is null;
	UPDATE ALL_Volume_Test SET AAPGENExcl = 0.00 where AAPGENExcl is null;
	UPDATE ALL_Volume_Test SET AAPOTC = 0.00 where AAPOTC is null;
	UPDATE ALL_Volume_Test SET AAPOther = 0.00 where AAPOther is null;
	UPDATE ALL_Volume_Test SET AAPTotalRX = 0.00 where AAPTotalRX is null;
	UPDATE ALL_Volume_Test SET AAPExcludedFromTotalRX = 0.00 where AAPExcludedFromTotalRX is null;
	UPDATE ALL_Volume_Test SET AAPNonRXOTCandHH = 0.00 where AAPNonRXOTCandHH is null;
	UPDATE ALL_Volume_Test SET AAPSourceCompliance = 0.00 where AAPSourceCompliance is null;

	UPDATE ALL_Volume_Test SET UDNetSales = 0.00 where UDNetSales is null;
	UPDATE ALL_Volume_Test SET UDBrand = 0.00 where UDBrand is null;
	UPDATE ALL_Volume_Test SET UDGENTotal = 0.00 where UDGENTotal is null;
	UPDATE ALL_Volume_Test SET UDGENTotalSrc = 0.00 where UDGENTotalSrc is null;
	UPDATE ALL_Volume_Test SET UDOTC = 0.00 where UDOTC is null;
	UPDATE ALL_Volume_Test SET UDOther = 0.00 where UDOther is null;
	UPDATE ALL_Volume_Test SET CombNetSales = 0.00 where CombNetSales is null;
	UPDATE ALL_Volume_Test SET CombBrands = 0.00 where CombBrands is null;
	UPDATE ALL_Volume_Test SET CombOTC = 0.00 where CombOTC is null;
	UPDATE ALL_Volume_Test SET CombGENTotal = 0.00 where CombGENTotal is null;
	UPDATE ALL_Volume_Test SET CombGENTotalSrc = 0.00 where CombGENTotalSrc is null;
    UPDATE ALL_Volume_Test SET CombOther = 0.00 where CombOther is null;

	UPDATE ALL_Volume_Test SET APIOther = 0.0 where APIOther is null;
	UPDATE ALL_Volume_Test SET UDAdminOnly = 0.0 where UDAdminOnly is null
	UPDATE ALL_Volume_Test SET CombAdminOnly = 0.0 where CombAdminOnly is null;

END








GO
