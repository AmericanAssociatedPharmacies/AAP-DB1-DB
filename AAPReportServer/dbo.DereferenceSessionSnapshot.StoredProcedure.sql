USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[DereferenceSessionSnapshot]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DereferenceSessionSnapshot]
@SessionID as varchar(32),
@OwnerID as uniqueidentifier
AS

UPDATE SN
SET TransientRefcount = TransientRefcount - 1
FROM
   SnapshotData AS SN
   INNER JOIN [AAPReportServerTempDB].dbo.SessionData AS SE ON SN.SnapshotDataID = SE.SnapshotDataID
WHERE
   SE.SessionID = @SessionID AND
   SE.OwnerID = @OwnerID
   
UPDATE SN
SET TransientRefcount = TransientRefcount - 1
FROM
   [AAPReportServerTempDB].dbo.SnapshotData AS SN
   INNER JOIN [AAPReportServerTempDB].dbo.SessionData AS SE ON SN.SnapshotDataID = SE.SnapshotDataID
WHERE
   SE.SessionID = @SessionID AND
   SE.OwnerID = @OwnerID
GO
