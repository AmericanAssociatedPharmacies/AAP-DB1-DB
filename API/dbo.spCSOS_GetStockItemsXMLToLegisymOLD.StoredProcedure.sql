USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spCSOS_GetStockItemsXMLToLegisymOLD]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 7/11/2014
-- Description:	Return XML to delivery to Legisym
-- =============================================
CREATE PROCEDURE [dbo].[spCSOS_GetStockItemsXMLToLegisymOLD]
	-- Add the parameters for the stored procedure here
	@StockItemFrmAPIId INT
AS
BEGIN
	-- SELECT [API].[csos].[fnGetLegisymStockItemsXML] (@StockItemFrmAPIId);
DECLARE @ResultVar XML;

SET  @ResultVar = 
(SELECT
 * FROM 
  (SELECT
    --[API].csos.[fnGetLegisymControlRecordXML] (@StockItemFrmAPIId) AS ControlRecord,
	LTrim(RTrim(Lower(ActionCode))) AS ActionCode
	--, E222StockId
	, LTrim(RTrim(SupplierStockId)) SupplierStockId
	, LTrim(RTrim(StockDescription)) StockDescription
	, LTrim(RTrim(StockCategory)) StockCategory
	, LTrim(RTrim(Source)) Source
	, LTrim(RTrim(DeaSchedule)) DeaSchedule
	, LTrim(RTrim(DeaScheduleName)) DeaScheduleName
	, LTrim(RTrim(NdcNumber)) NdcNumber
	, LTrim(RTrim(PackageSize)) PackageSize
	, LTrim(RTrim(ArcosQtyFactor)) ArcosQtyFactor
	, LTrim(RTrim(ArcosUnit)) ArcosUnit
	, LTrim(RTrim(ArcosStrength)) ArcosStrength
    , dbo.fnCSOS_GetLegisymStockItemExtendedDataXML (innerX.StockItemFrmAPIId) AS StockItemExtendedData
	--, Price
	--, QtyonHand
	--, BrandReference
	--,PRDC
	FROM dbo.CSOS_StockItemFrmAPI innerX WHERE innerX.StockItemFrmAPIId = @StockItemFrmAPIId AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')
 ) DetailRecord 
FOR XML AUTO, ELEMENTS );

DECLARE @ControlRecord XML;
SELECT @ControlRecord = (SELECT dbo.fnCSOS_GetLegisymControlRecordXML(@StockItemFrmAPIId));

SET @ResultVar = CAST( '<StockItems>' + CAST(@ControlRecord AS VARCHAR(MAX)) + CAST(@ResultVar AS VARCHAR(MAX)) + '</StockItems>'  AS XML)

UPDATE dbo.CSOS_StockItemFrmAPI SET XmlToLegisym = @ResultVar WHERE StockItemFrmAPIId = @StockItemFrmAPIId;

SELECT @ResultVar
/*

DECLARE	@return_value int

EXEC	@return_value = dbo.[spCSOS_GetStockItemsXMLToLegisym]
		@StockItemFrmAPIId = 1

SELECT	'Return Value' = @return_value

GO

*/
END
GO
