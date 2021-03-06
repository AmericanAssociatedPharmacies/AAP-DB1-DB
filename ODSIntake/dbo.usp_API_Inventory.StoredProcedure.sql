USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_API_Inventory]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_API_Inventory]

	@MaxDate DATETIME 

AS


SET NOCOUNT ON;

BEGIN

	DECLARE @p1 DATETIME

	SET @p1 = DATEADD(DAY, 0, DATEDIFF(DAY, 0, GETDATE()))

	SELECT WarehouseNumber, LocationZone, LocationID, Item, Batch
	, FirstPutAwayDate, OldestReceptionDate, QuantityInLocation
	, QuantityReservedForPick, StockTakeStatus, StockTakeListNumber
	, PickPriority, PutAwayPriority, LastStockTakeDate, LocationType
	, UnusableNonConformingStockOnHandQuantity, UsableNonConformingStockOnHandQuantity
	, NonConformityCertificateNumber, [SerialNumberTrackingY/N], OrderReferenceNumber
	, OrderReferenceLineNumber, LandedCostsRequired, [QualityControlY/N], [TransitDeliveryY/N]
	, [HeldBalanceY/N], ItemNumber, RowCreatedDate, ETLDateKey, ETLDate, ETLTime
	FROM [Staging].[vwAPIInventory]
	WHERE RowCreatedDate > @MaxDate
	AND RowCreatedDate < @p1



END
GO
