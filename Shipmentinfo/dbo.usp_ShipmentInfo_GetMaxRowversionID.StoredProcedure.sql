USE [ShipmentInfo]
GO
/****** Object:  StoredProcedure [dbo].[usp_ShipmentInfo_GetMaxRowversionID]    Script Date: 12/22/2020 5:14:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_ShipmentInfo_GetMaxRowversionID]

AS

SET NOCOUNT ON;


BEGIN

	DECLARE @MaxRowversionID VARCHAR(50)

	
	SELECT @MaxRowversionID = master.dbo.fn_varbintohexstr(C1)
	FROM(SELECT MAX([RowversionID]) AS C1
		FROM [dbo].[ShipmentDataTable_new]
		) AS dt

		SELECT dt.MaxRowversionID
		FROM(SELECT CONVERT(VARCHAR(50),@MaxRowversionID) AS MaxRowversionID
			) AS dt



END



GO
