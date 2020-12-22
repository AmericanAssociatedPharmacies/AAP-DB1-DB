USE [API]
GO
/****** Object:  StoredProcedure [Staging].[usp_APIOrder_Load]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROC [Staging].[usp_APIOrder_Load]

AS

SET NOCOUNT ON;

INSERT INTO [Staging].[APIOrder] ([OrderNumber], [API_Item_Number], [Quantity], [OrderDate], [ItemDesc])
SELECT [OrderNumber], [API_Item_Number], [Quantity], [OrderDate], [ItemDescription]
FROM [Staging].[vwAPIOrder]
GO
