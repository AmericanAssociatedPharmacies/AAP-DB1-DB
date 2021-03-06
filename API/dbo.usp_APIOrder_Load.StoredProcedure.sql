USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIOrder_Load]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [dbo].[usp_APIOrder_Load]

AS

SET NOCOUNT ON;

BEGIN

MERGE [dbo].[APIOrder] AS T 
USING (SELECT [OrderNumber], [API_Item_Number], [Quantity], [OrderDate], [ItemDesc]
	   FROM [Staging].[APIOrder]) AS S 
	   ([OrderNumber], [API_Item_Number], [Quantity], [OrderDate], [ItemDesc])
	   ON T.[OrderNumber] = S.[OrderNumber]
	   AND T.[API_Item_Number] = S.[API_Item_Number]

WHEN MATCHED THEN

UPDATE SET T.[Quantity] = S.[Quantity]
		 , T.[OrderDate] = S.[OrderDate]
		 , T.[ItemDesc] = S.[ItemDesc]

WHEN NOT MATCHED THEN

	INSERT ([OrderNumber], [API_Item_Number], [Quantity], [OrderDate], [ItemDesc])
	VALUES (S.[OrderNumber], S.[API_Item_Number], S.[Quantity], S.[OrderDate], S.[ItemDesc]);

END
		   


GO
