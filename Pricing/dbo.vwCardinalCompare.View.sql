USE [Pricing]
GO
/****** Object:  View [dbo].[vwCardinalCompare]    Script Date: 12/22/2020 9:25:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCardinalCompare]

AS

SELECT TOP 100 PERCENT cj.Date
, cj.Type AS Contract
, cj.DESCRIPTION
, cj.SIZE
, cj.Supplier
, cc.INVOICEPRICE 
, cj.[Comp Price]
, cj.Quantity
, cj.[NDC/UPC]
, cj.CIN
--, *
FROM(SELECT MIN(TheDate) AS TheDate
		FROM ODSIntake.dbo.DateDim
		WHERE TheDate >=  (GETDATE() -60) 
		AND TheDate <= GETDATE()
		) AS dt
CROSS JOIN [dbo].[CardinalPricing_forCompare] AS cj
LEFT OUTER JOIN Purchases.dbo.CardinalComplete AS cc ON cj.[NDC/UPC] = cc.NDC
WHERE cj.[Date] >= dt.TheDate
ORDER BY cj.Date ASC


GO
