USE [Medispan]
GO
/****** Object:  View [dbo].[v_GPI_TClass]    Script Date: 12/22/2020 9:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[v_GPI_TClass]
AS
SELECT     Generic_Product_Identifier AS GPI, GPI_Generic_Name AS GPIDesc, LEFT(Generic_Product_Identifier, 10) AS GPIClass
FROM         dbo.M25_G
WHERE     (Generic_Product_Identifier IS NOT NULL)
GROUP BY Generic_Product_Identifier, GPI_Generic_Name
GO
