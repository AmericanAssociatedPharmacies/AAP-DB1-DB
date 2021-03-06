USE [API]
GO
/****** Object:  UserDefinedFunction [dbo].[fnCSOS_GetLegisymStockItemExtendedDataXML]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 7/10/2014
-- Description:	Generate XML for Legisym Inventory StockItem
-- =============================================
CREATE FUNCTION [dbo].[fnCSOS_GetLegisymStockItemExtendedDataXML]
(
    @StockItemFrmAPIId INT
)
RETURNS XML
AS
BEGIN
DECLARE @ResultVar XML;

	SET  @ResultVar = 
	(SELECT
		'<Price>' + LTrim(RTrim(Price)) + '</Price>'
		+ '<QtyonHand>' + LTrim(RTrim(QtyonHand)) + '</QtyonHand>' 
		+ '<BrandReference>' + LTrim(RTrim(BrandReference)) + '</BrandReference>' 
		--,PRDC
		FROM dbo.CSOS_StockItemFrmAPI innterX WHERE innterX.StockItemFrmAPIId  = @StockItemFrmAPIId AND ([Status] IS NULL OR [Status] NOT LIKE 'Completed_%')	
	)
/*
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
SELECT [dbo].[fnCSOS_GetLegisymStockItemExtendedDataXML](1)
*/

END
GO
