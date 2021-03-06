USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spCSOS_UpdateStockItemsXMLToLegisym]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 7/11/2014
-- Description:	Return XML to delivery to Legisym
-- =============================================
CREATE PROCEDURE [dbo].[spCSOS_UpdateStockItemsXMLToLegisym]
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

END
GO
