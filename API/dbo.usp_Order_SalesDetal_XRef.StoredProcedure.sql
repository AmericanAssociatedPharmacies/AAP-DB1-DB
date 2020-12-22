USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_Order_SalesDetal_XRef]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Order_SalesDetal_XRef]
	@SalesDetailID Int
	,@OrderID int

AS

SET NOCOUNT ON;

BEGIN

	SELECT [SalesDetailID], [OrderID]
	FROM [dbo].[Order_SalesDetal_XRef]
	WHERE SalesDetailID > @SalesDetailID
	  AND OrderID > @OrderID

END
GO
