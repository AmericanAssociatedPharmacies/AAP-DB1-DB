USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_Order_SalesDetal_XRef_Load]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[usp_Order_SalesDetal_XRef_Load]

AS

SET NOCOUNT ON;

BEGIN

	INSERT INTO API.dbo.Order_SalesDetal_XRef([SalesDetailID], [OrderID])
	SELECT a.ID AS [SalesDetailID]
	     , b.RowID AS [OrderID]
	FROM dbo.APISalesDetail AS a
	INNER JOIN [dbo].[APIOrder] AS B ON a.[OrderNbr] = b.[OrderNumber]
	                                AND a.APIItemNbr = b.[API_Item_Number]
	WHERE NOT EXISTS (SELECT 1
					  FROM dbo.Order_SalesDetal_XRef AS X
					  WHERE A.ID = X.SalesDetailID
							AND B.RowID = X.OrderID
					 ) 
	ORDER BY a.ID ASC, b.RowID ASC

END
​
GO
