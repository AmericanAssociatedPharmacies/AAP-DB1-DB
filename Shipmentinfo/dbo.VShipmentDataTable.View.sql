USE [ShipmentInfo]
GO
/****** Object:  View [dbo].[VShipmentDataTable]    Script Date: 12/22/2020 9:35:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VShipmentDataTable]
AS
SELECT *
FROM [ShipmentInfo].[dbo].[ShipmentDataTable] WITH(NOLOCK)
GO
