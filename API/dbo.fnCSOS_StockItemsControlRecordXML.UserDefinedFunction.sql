USE [API]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCSOS_StockItemsControlRecordXML]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 7/10/2014
-- Description:	Generate XML for Legisym Inventory StockItem
-- =============================================
CREATE FUNCTION [dbo].[fnCSOS_StockItemsControlRecordXML]
(
    @ServiceContract NVARCHAR(45),
	@BatchNumber NVARCHAR(50)
)
RETURNS XML
AS
BEGIN
DECLARE @ResultVar XML;

SET  @ResultVar = (SELECT 
 * FROM 
  (SELECT DISTINCT
    LTrim(RTrim(SchemaVersion)) SchemaVersion
	--,LTrim(RTrim(DatePrepared)) DatePrepared
    ,CONVERT(char(10), DatePrepared,126) AS DatePrepared
	--,LTrim(RTrim(TimePrepared)) TimePrepared
	,CONVERT(VARCHAR(8),CAST(TimePrepared AS DATETIME),108) TimePrepared
	,LTrim(RTrim(ServiceContract)) ServiceContract
	FROM dbo.CSOS_StockItemFrmAPI innerX 
	WHERE innerX.ServiceContract = @ServiceContract AND innerX.BatchNumber = @BatchNumber AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')
 ) ControlRecord 
FOR XML AUTO, ELEMENTS );

/*SET  @ResultVar = 
(SELECT
	'<SchemaVersion>' + SchemaVersion  + '</SchemaVersion>'
	+ '<DatePrepared>' + DatePrepared  + '</DatePrepared>' 
	+ '<TimePrepared>' +TimePrepared  + '</TimePrepared>' 
	+ '<ServiceContract>' +ServiceContract  + '</ServiceContract>' 
	FROM csos.StockItemsFromAPI  innterX WHERE innterX.StockItemsId = @StockItemsId
  )

SET  @ResultVar = (SELECT *
 FROM 
  (SELECT
	'<Price>' + Price + '</Price>'
	, '<QtyonHand>' + QtyonHand + '</QtyonHand>' 
	, '<BrandReference>' + BrandReference + '</BrandReference>' 
	--,PRDC
	FROM csos.DetailRecordFromAPI innterX WHERE innterX.DetailRecordFromAPIId = @DetailRecordFromAPIId
  ) StockItemExtendedData 
FOR XML AUTO, ELEMENTS);
*/


RETURN @ResultVar;

/*
SELECT [API].csos.[fnGetLegisymControlRecordXML] (1)
*/

END
GO
