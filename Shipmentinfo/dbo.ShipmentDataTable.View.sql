USE [ShipmentInfo]
GO
/****** Object:  View [dbo].[ShipmentDataTable]    Script Date: 12/22/2020 9:35:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ShipmentDataTable]

AS

SELECT DISTINCT PCKNUM, TrackNum, ShipWeight, PubCost, ShipCost, ShipDate, ShipStatus, ShipMethod, OrderID AS OrderNum
FROM [dbo].[ShipmentDataTable_new]

GO
