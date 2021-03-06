USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spCSOS_GetStockItemsXMLToLegisym]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 7/11/2014
-- Description:	Return XML to delivery to Legisym
-- =============================================
CREATE PROCEDURE [dbo].[spCSOS_GetStockItemsXMLToLegisym]
	-- Add the parameters for the stored procedure here
	@ServiceContract NVARCHAR(45),
	@BatchNumber NVARCHAR(50) 
AS
BEGIN

UPDATE dbo.CSOS_StockItemFrmAPI SET
	XmlToLegisym = dbo.fnCSOS_GetLegisymStockItemExtendedDataXML (StockItemFrmAPIId)
WHERE ServiceContract = @ServiceContract 
	AND BatchNumber = @BatchNumber 
	AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%');

UPDATE dbo.CSOS_StockItemFrmAPI SET
	XmlToLegisym = dbo.fnCSOS_GetLegisymStockItemXML (StockItemFrmAPIId)
WHERE ServiceContract = @ServiceContract 
	AND BatchNumber = @BatchNumber 
	AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%');


--	-- SELECT [API].[csos].[fnGetLegisymStockItemsXML] (@StockItemFrmAPIId);
DECLARE @ResultVar XML;

SET  @ResultVar = 
(SELECT
 * FROM 
  (SELECT
     XmlToLegisym.query('/DetailRecord') AS XmlToLegisym
	FROM dbo.CSOS_StockItemFrmAPI innerX 
		WHERE --( StockItemFrmAPIId = 5 OR StockItemFrmAPIId = 6) AND
		ServiceContract = @ServiceContract 
		AND BatchNumber = @BatchNumber 
		AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')
		AND XmlToLegisym IS NOT NULL
	--UNION SELECT (CONVERT(XML,'<DetailRecord></DetailRecord>')) XmlToLegisym
 ) DetailRecord 
FOR XML AUTO, ELEMENTS );

SELECT @ResultVar;

--
--SET  @ResultVar = 
--(SELECT
-- * FROM 
--  (SELECT
--    --[API].csos.[fnGetLegisymControlRecordXML] (@StockItemFrmAPIId) AS ControlRecord,
--	LTrim(RTrim(Lower(ActionCode))) AS ActionCode
--	--, E222StockId
--	, LTrim(RTrim(SupplierStockId)) SupplierStockId
--	, LTrim(RTrim(StockDescription)) StockDescription
--	, LTrim(RTrim(StockCategory)) StockCategory
--	, LTrim(RTrim(Source)) Source
--	, LTrim(RTrim(DeaSchedule)) DeaSchedule
--	, LTrim(RTrim(DeaScheduleName)) DeaScheduleName
--	, LTrim(RTrim(NdcNumber)) NdcNumber
--	, LTrim(RTrim(PackageSize)) PackageSize
--	, LTrim(RTrim(ArcosQtyFactor)) ArcosQtyFactor
--	, LTrim(RTrim(ArcosUnit)) ArcosUnit
--	, LTrim(RTrim(ArcosStrength)) ArcosStrength
--	, XmlToLegisym StockItemExtendedData
--    --, dbo.fnCSOS_GetLegisymStockItemExtendedDataXML (innerX.StockItemFrmAPIId) AS StockItemExtendedData
--	--, Price
--	--, QtyonHand
--	--, BrandReference
--	--,PRDC
--	FROM dbo.CSOS_StockItemFrmAPI innerX 
--		WHERE 
--		StockItemFrmAPIId = 5 AND
--		ServiceContract = @ServiceContract 
--		AND BatchNumber = @BatchNumber 
--		AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')
--		
-- ) DetailRecord 
--FOR XML AUTO, ELEMENTS );
--
--SELECT @ResultVar;

DECLARE @ControlRecord XML;
SELECT @ControlRecord = (SELECT dbo.fnCSOS_GetLegisymControlRecordXML(@ServiceContract,@BatchNumber));

SET @ResultVar = CAST( '<StockItems>' + CAST(@ControlRecord AS VARCHAR(MAX)) + CAST(@ResultVar AS VARCHAR(MAX)) + '</StockItems>'  AS XML)

-- UPDATE dbo.CSOS_StockItemFrmAPI SET XmlToLegisym = @ResultVar WHERE StockItemFrmAPIId = @StockItemFrmAPIId;

SELECT @ResultVar
/*

DECLARE	@return_value int

EXEC	@return_value = dbo.[spCSOS_GetStockItemsXMLToLegisym]
		@ServiceContract ='873222B5-EACA-4409-BFE9-A82F3120B5DE',
		@BatchNumber = '1'

SELECT	'Return Value' = @return_value

GO

SELECT * FROM dbo.CSOS_StockItemFrmAPI  
*/
END
GO
