USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[CleanExpiredSessions]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CleanExpiredSessions]
@SessionsCleaned int OUTPUT
AS
SET DEADLOCK_PRIORITY LOW

DECLARE @SessionToDelete table (SessionID varchar(32) COLLATE Latin1_General_CI_AS_KS_WS);
DECLARE @SessionLockDeleted table (SessionID varchar(32) COLLATE Latin1_General_CI_AS_KS_WS);

CREATE TABLE #tempSession
   (SessionID varchar(32) COLLATE Latin1_General_CI_AS_KS_WS,
    SnapshotDataID uniqueidentifier,
    CompiledDefinition uniqueidentifier)

DECLARE @now as datetime
SET @now = GETDATE()

INSERT INTO @SessionToDelete
SELECT TOP 20 SessionID
FROM [AAPReportServerTempDB].dbo.SessionData SD WITH (XLOCK)
WHERE Expiration < @now 

SET @SessionsCleaned = @@ROWCOUNT
IF @SessionsCleaned = 0 RETURN

DELETE SL
output deleted.SessionID into @SessionLockDeleted(SessionID)
FROM
	[AAPReportServerTempDB].dbo.SessionLock AS SL WITH (ROWLOCK, READPAST)
	INNER JOIN @SessionToDelete AS STD ON SL.SessionID = STD.SessionID

SET @SessionsCleaned = @@ROWCOUNT
IF @SessionsCleaned = 0 RETURN

DELETE SE
output deleted.SessionID, deleted.SnapshotDataID, deleted.CompiledDefinition
into #tempSession (SessionID, SnapshotDataID, CompiledDefinition)
FROM
   [AAPReportServerTempDB].dbo.SessionData AS SE
   INNER JOIN @SessionLockDeleted AS SLD on SE.SessionID = SLD.SessionID

-- Mark persisted streams for this session to be deleted
UPDATE PS
SET
    RefCount = 0,
    ExpirationDate = GETDATE()
FROM
    [AAPReportServerTempDB].dbo.PersistedStream AS PS
    INNER JOIN #tempSession on PS.SessionID = #tempsession.SessionID

UPDATE SN
SET
   TransientRefcount = TransientRefcount-1
FROM
   [AAPReportServerTempDB].dbo.SnapshotData AS SN
   INNER JOIN #tempSession AS SE ON SN.SnapshotDataID = SE.CompiledDefinition

UPDATE SN
SET
   TransientRefcount = TransientRefcount-
      (SELECT COUNT(*)
       FROM #tempSession AS SE1
       WHERE SE1.SnapshotDataID = SN.SnapshotDataID)
FROM
   SnapshotData AS SN
   INNER JOIN #tempSession AS SE ON SN.SnapshotDataID = SE.SnapshotDataID

UPDATE SN
SET
   TransientRefcount = TransientRefcount-
      (SELECT COUNT(*)
       FROM #tempSession AS SE1
       WHERE SE1.SnapshotDataID = SN.SnapshotDataID)
FROM
   [AAPReportServerTempDB].dbo.SnapshotData AS SN
   INNER JOIN #tempSession AS SE ON SN.SnapshotDataID = SE.SnapshotDataID
GO
