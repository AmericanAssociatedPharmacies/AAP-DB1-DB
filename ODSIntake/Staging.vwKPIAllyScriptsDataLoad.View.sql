USE [ODSIntake]
GO
/****** Object:  View [Staging].[vwKPIAllyScriptsDataLoad]    Script Date: 12/22/2020 9:21:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [Staging].[vwKPIAllyScriptsDataLoad]

AS

SELECT Pharmacy, State, AAPNumber, APINumber, Date, RXReceived, RXFilled
FROM [Staging].[KPI_AllyScripts]

GO
