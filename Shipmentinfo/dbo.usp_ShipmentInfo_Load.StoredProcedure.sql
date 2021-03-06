USE [ShipmentInfo]
GO
/****** Object:  StoredProcedure [dbo].[usp_ShipmentInfo_Load]    Script Date: 12/22/2020 5:14:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_ShipmentInfo_Load]

AS

BEGIN


DECLARE @p1 INT


	SELECT @p1 = COUNT(*)
	FROM [Staging].[ShipmentDataTable]

	IF @p1 = 0

	BEGIN

		RETURN

	END

	ELSE IF @p1 > 0
	BEGIN

		MERGE [dbo].[ShipmentDataTable_New] AS target
		USING(SELECT RowID, PCKNUM, TrackNum, ShipWeight, PubCost, ShipCost, ShipDate, ShipStatus, ShipMethod, RowCreatedDate, RowUpdatedDate, RowversionID
				FROM [Staging].[ShipmentDataTable]
				) AS source (RowID, PCKNUM, TrackNum, ShipWeight, PubCost, ShipCost, ShipDate, ShipStatus, ShipMethod, RowCreatedDate, RowUpdatedDate, RowversionID)
											ON (target.RowID = source.RowID)


		WHEN MATCHED THEN

		UPDATE
		SET PCKNUM = source.[PCKNUM]
		, TrackNum = source.[TrackNum]
		, ShipWeight = source.[PubCost]
		, PubCost = source.[PubCost]
		, ShipCost = source.[ShipCost]
		, ShipDate = source.[ShipDate]
		, ShipStatus = source.[ShipStatus]
		, ShipMethod = source.[ShipMethod]
		, RowCreatedDate = source.[RowCreatedDate]
		, RowUpdatedDate = source.[RowUpdatedDate]
		, RowversionID = source.[RowversionID]

		WHEN NOT MATCHED THEN

		INSERT(RowID, PCKNUM, TrackNum, ShipWeight, PubCost, ShipCost, ShipDate, ShipStatus, ShipMethod, RowCreatedDate, RowUpdatedDate, RowversionID)
		VALUES(source.RowID, source.PCKNUM, source.TrackNum, source.ShipWeight, source.PubCost, source.ShipCost, source.ShipDate, source.ShipStatus, source.ShipMethod, source.RowCreatedDate, source.RowUpdatedDate, source.RowversionID)
		;

	END

END
GO
