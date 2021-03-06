USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[sppm_updateALLVolumeCOMBTotals_TEST]    Script Date: 12/22/2020 5:00:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		< Joni Wilson>
-- Create date: <07/02/2012>
-- Description:	When Changing the ALL_Volume through UI need to recalculate the combined totals after an update has occurred
-- =============================================
CREATE PROCEDURE [dbo].[sppm_updateALLVolumeCOMBTotals_TEST]

AS
BEGIN
 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
  
	   --- Drop the previous runs table
--UPdate Totals 
	UPDATE ALL_Volume_TEST set CombNetSales = APINetSales + AAPNetSales + UDNetSales;
	UPDATE ALL_Volume_TEST set CombBrands = APIBrand + AAPBrand + UDBrand;
    UPDATE ALL_Volume_TEST SET CombOTC = APIOTC + AAPOTC + UDOTC;  
    UPDATE ALL_Volume_TEST SET CombGENTotal = APIGENTotal + AAPGENTotal + UDGENTotal;
    UPDATE ALL_Volume_TEST SET CombGENTotalSrc = APIGENTotalSrc + AAPGENTotalSrc + UDGENTotalSrc;
    UPDATE ALL_Volume_TEST SET CombOther = AAPOther + UDOther + APIOther;
	UPDATE ALL_Volume_TEST SET CombAdminOnly = UDAdminOnly;

END








GO
