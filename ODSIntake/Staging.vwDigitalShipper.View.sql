USE [ODSIntake]
GO
/****** Object:  View [Staging].[vwDigitalShipper]    Script Date: 12/22/2020 9:21:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Staging].[vwDigitalShipper]

AS



SELECT s.ROW_NUM, s.COMPANY_NO, s.PACKAGE_ID, s.ORDER_ID, s.ORDER_BO_CODE, s.COMPANY_ID, s.TRACKING_NUMBER, s.SHIP_COST, s.SHIP_DATE, s.SHIP_STATUS, s.SHIP_METHOD
FROM [10.80.2.41].[S7810B60].[R60MODSDTA].[SHIPMENTS] AS s
CROSS JOIN(SELECT MAX(ShipDate) AS MaxShipDate
			FROM ShipmentInfo.[dbo].[ShipmentDataTable_new]
			) AS cj
WHERE TRY_CONVERT(DATE,s.SHIP_DATE) > cj.MaxShipDate
GO
