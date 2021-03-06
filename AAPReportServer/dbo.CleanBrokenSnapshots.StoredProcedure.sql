USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[CleanBrokenSnapshots]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CleanBrokenSnapshots]
@Machine nvarchar(512),
@SnapshotsCleaned int OUTPUT,
@ChunksCleaned int OUTPUT,
@TempSnapshotID uniqueidentifier OUTPUT
AS
    SET DEADLOCK_PRIORITY LOW
    DECLARE @now AS datetime
    SELECT @now = GETDATE()
    
    CREATE TABLE #tempSnapshot (SnapshotDataID uniqueidentifier)
    INSERT INTO #tempSnapshot SELECT TOP 1 SnapshotDataID 
    FROM SnapshotData  WITH (NOLOCK) 
    where SnapshotData.PermanentRefcount <= 0 
    AND ExpirationDate < @now
    SET @SnapshotsCleaned = @@ROWCOUNT

    DELETE ChunkData FROM ChunkData INNER JOIN #tempSnapshot
    ON ChunkData.SnapshotDataID = #tempSnapshot.SnapshotDataID
    SET @ChunksCleaned = @@ROWCOUNT

    DELETE SnapshotData FROM SnapshotData INNER JOIN #tempSnapshot
    ON SnapshotData.SnapshotDataID = #tempSnapshot.SnapshotDataID
    
    TRUNCATE TABLE #tempSnapshot

    INSERT INTO #tempSnapshot SELECT TOP 1 SnapshotDataID 
    FROM [AAPReportServerTempDB].dbo.SnapshotData  WITH (NOLOCK) 
    where [AAPReportServerTempDB].dbo.SnapshotData.PermanentRefcount <= 0 
    AND [AAPReportServerTempDB].dbo.SnapshotData.ExpirationDate < @now
    AND [AAPReportServerTempDB].dbo.SnapshotData.Machine = @Machine
    SET @SnapshotsCleaned = @SnapshotsCleaned + @@ROWCOUNT

    SELECT @TempSnapshotID = (SELECT SnapshotDataID FROM #tempSnapshot)

    DELETE [AAPReportServerTempDB].dbo.ChunkData FROM [AAPReportServerTempDB].dbo.ChunkData INNER JOIN #tempSnapshot
    ON [AAPReportServerTempDB].dbo.ChunkData.SnapshotDataID = #tempSnapshot.SnapshotDataID
    SET @ChunksCleaned = @ChunksCleaned + @@ROWCOUNT

    DELETE [AAPReportServerTempDB].dbo.SnapshotData FROM [AAPReportServerTempDB].dbo.SnapshotData INNER JOIN #tempSnapshot
    ON [AAPReportServerTempDB].dbo.SnapshotData.SnapshotDataID = #tempSnapshot.SnapshotDataID
GO
