USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIOrder]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[usp_APIOrder]

	@MAXRowversionID VARCHAR(50)


AS

SET NOCOUNT ON;

BEGIN

	DECLARE @p1 VARBINARY(8)

	SET @p1 = CONVERT(VARBINARY(8), ISNULL(CONVERT(VARBINARY(8), @MAXRowversionID, 1), 0))

	SELECT [RowID], [OrderNumber], [API_Item_Number], [Quantity], [OrderDate], [ItemDesc], CONVERT(VARBINARY(8),[RowversionID]) AS RowVersionID
	FROM [dbo].[APIOrder]
	WHERE RowversionID > @p1

END

GO
