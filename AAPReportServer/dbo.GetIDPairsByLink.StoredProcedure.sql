USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetIDPairsByLink]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetIDPairsByLink]
@Link uniqueidentifier
AS
SELECT LinkSourceID, ItemID
FROM Catalog
WHERE LinkSourceID = @Link
GO
