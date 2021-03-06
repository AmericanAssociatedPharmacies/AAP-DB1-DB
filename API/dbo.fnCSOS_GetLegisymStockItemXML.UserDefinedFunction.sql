USE [API]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCSOS_GetLegisymStockItemXML]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 7/10/2014
-- Description:	Generate XML for Legisym Inventory StockItem
-- =============================================
CREATE FUNCTION [dbo].[fnCSOS_GetLegisymStockItemXML]
(
    @StockItemFrmAPIId INT
)
RETURNS XML
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
	, XmlToLegisym StockItemExtendedData
    --, dbo.fnCSOS_GetLegisymStockItemExtendedDataXML (innerX.StockItemFrmAPIId) AS StockItemExtendedData
	--, Price
	--, QtyonHand
	--, BrandReference
	--,PRDC
	FROM dbo.CSOS_StockItemFrmAPI innerX 
	WHERE 
		StockItemFrmAPIId = @StockItemFrmAPIId 
		AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')
		
 ) DetailRecord 
FOR XML AUTO, ELEMENTS );

RETURN @ResultVar;

END
GO
