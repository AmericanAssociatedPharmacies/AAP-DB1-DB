USE [ReportServer]
GO
/****** Object:  View [dbo].[ExtendedDataSets]    Script Date: 12/22/2020 9:28:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExtendedDataSets]
AS 
SELECT 
	ID, LinkID, [Name], ItemID
FROM DataSets
UNION ALL
SELECT
	ID, LinkID, [Name], ItemID
FROM [ReportServerTempDB].dbo.TempDataSets
GO
