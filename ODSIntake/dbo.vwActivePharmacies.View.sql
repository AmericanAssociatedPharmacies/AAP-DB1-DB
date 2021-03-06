USE [ODSIntake]
GO
/****** Object:  View [dbo].[vwActivePharmacies]    Script Date: 12/22/2020 9:21:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwActivePharmacies]


AS


SELECT dt.ServiceProviderID
, dt.MaxRowCreatedDate
FROM(SELECT [ServiceProviderID]
		, MAX(RowCreatedDate) AS MaxRowCreatedDate
		FROM RX30.dbo.ActiveServiceProviderID
		GROUP BY [ServiceProviderID]
	) AS dt
GO
