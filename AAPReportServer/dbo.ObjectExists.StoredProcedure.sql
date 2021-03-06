USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[ObjectExists]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObjectExists]
@Path nvarchar (425),
@AuthType int
AS
SELECT Type, ItemID, SnapshotLimit, NtSecDescPrimary, ExecutionFlag, Intermediate, [LinkSourceID]
FROM Catalog
LEFT OUTER JOIN SecData
ON Catalog.PolicyID = SecData.PolicyID AND SecData.AuthType = @AuthType
WHERE Path = @Path
GO
