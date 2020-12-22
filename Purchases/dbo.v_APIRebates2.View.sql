USE [Purchases]
GO
/****** Object:  View [dbo].[v_APIRebates2]    Script Date: 12/22/2020 9:26:41 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_APIRebates2]
AS
SELECT     NDC, MONTH(dateloaded) AS Mnth, YEAR(dateloaded) AS Yr, PricePerUnit, PricePerUnit - UnitNet AS NetPerUnit
FROM         dbo.APIPrice
WHERE     (UnitNet > 0)

GO
