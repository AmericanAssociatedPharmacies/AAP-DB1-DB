USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spCSOS_GetStockItemsControlRecordXML]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 7/11/2014
-- Description:	Return XML to delivery to Legisym
-- =============================================
CREATE PROCEDURE [dbo].[spCSOS_GetStockItemsControlRecordXML]
@ServiceContract NVARCHAR(45),
@BatchNumber NVARCHAR(50)
AS
BEGIN

SELECT [API].[dbo].[fnCSOS_StockItemsControlRecordXML] (@ServiceContract,@BatchNumber )

/*

DECLARE	@return_value int

EXEC	@return_value = [dbo].[spCSOS_GetStockItemsControlRecordXML]
		@ServiceContract = N'asdf',
		@BatchNumber = N'asdf'

SELECT	'Return Value' = @return_value

GO



*/

END

GO
