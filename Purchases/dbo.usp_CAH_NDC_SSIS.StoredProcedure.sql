USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_CAH_NDC_SSIS]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CAH_NDC_SSIS]
AS

SET NOCOUNT ON;

SELECT DISTINCT c.NDC, c.ITEM_TYPE, c.Type, c.BRAND, c.DateKey
FROM Purchases.dbo.CHPH_AAP AS c
INNER JOIN(SELECT NDC
            , MAX(DateKey) AS MaxDateKey
            FROM Purchases.dbo.CHPH_AAP
            GROUP BY NDC
            ) AS dt ON  c.DateKey = dt.MaxDateKey
                        AND c.NDC = dt.NDC
WHERE DateKey >= 20180101
GO
