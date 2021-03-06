USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetSessionData]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Get record from session data, update session and snapshot
CREATE PROCEDURE [dbo].[GetSessionData]
@SessionID as varchar(32),
@OwnerSid as varbinary(85) = NULL,
@OwnerName as nvarchar(260),
@AuthType as int,
@SnapshotTimeoutMinutes as int
AS

DECLARE @now as datetime
SET @now = GETDATE()

DECLARE @DBSessionID varchar(32)
DECLARE @SnapshotDataID uniqueidentifier
DECLARE @IsPermanentSnapshot bit

EXEC CheckSessionLock @SessionID = @SessionID

DECLARE @OwnerID uniqueidentifier
EXEC GetUserID @OwnerSid, @OwnerName, @AuthType, @OwnerID OUTPUT

SELECT
    @DBSessionID = SE.SessionID,
    @SnapshotDataID = SE.SnapshotDataID,
    @IsPermanentSnapshot = SE.IsPermanentSnapshot
FROM
    [AAPReportServerTempDB].dbo.SessionData AS SE WITH (XLOCK)
WHERE
    SE.OwnerID = @OwnerID AND
    SE.SessionID = @SessionID AND 
    SE.Expiration > @now

IF (@DBSessionID IS NOT NULL) BEGIN -- We return something only if session is present

IF @IsPermanentSnapshot != 0 BEGIN -- If session has snapshot and it is permanent

SELECT
    SN.SnapshotDataID,
    SE.ShowHideInfo,
    SE.DataSourceInfo,
    SN.Description,
    SE.EffectiveParams,
    SN.CreatedDate,
    SE.IsPermanentSnapshot,
    SE.CreationTime,
    SE.HasInteractivity,
    SE.Timeout,
    SE.SnapshotExpirationDate,
    SE.ReportPath,
    SE.HistoryDate,
    SE.CompiledDefinition,
    SN.PageCount,
    SN.HasDocMap,
    SE.Expiration,
    SN.EffectiveParams,
    SE.PageHeight,
    SE.PageWidth,
    SE.TopMargin,
    SE.BottomMargin,
    SE.LeftMargin,
    SE.RightMargin,
    SE.AutoRefreshSeconds,
    SE.AwaitingFirstExecution,
    SN.[DependsOnUser], 
	SN.PaginationMode, 
	SN.ProcessingFlags, 
	NULL, -- No compiled definition in tempdb to get flags from
	CONVERT(BIT, 0) AS [FoundInCache] -- permanent snapshot is never from Cache
FROM
    [AAPReportServerTempDB].dbo.SessionData AS SE
    INNER JOIN SnapshotData AS SN ON SN.SnapshotDataID = SE.SnapshotDataID
WHERE
   SE.SessionID = @DBSessionID

UPDATE SnapshotData
SET ExpirationDate = DATEADD(n, @SnapshotTimeoutMinutes, @now)
WHERE SnapshotDataID = @SnapshotDataID

END ELSE IF @IsPermanentSnapshot = 0 BEGIN -- If session has snapshot and it is temporary

SELECT
    SN.SnapshotDataID,
    SE.ShowHideInfo,
    SE.DataSourceInfo,
    SN.Description,
    SE.EffectiveParams,
    SN.CreatedDate,
    SE.IsPermanentSnapshot,
    SE.CreationTime,
    SE.HasInteractivity,
    SE.Timeout,
    SE.SnapshotExpirationDate,
    SE.ReportPath,
    SE.HistoryDate,
    SE.CompiledDefinition,
    SN.PageCount,
    SN.HasDocMap,
    SE.Expiration,
    SN.EffectiveParams,
    SE.PageHeight,
    SE.PageWidth,
    SE.TopMargin,
    SE.BottomMargin,
    SE.LeftMargin,
    SE.RightMargin,
    SE.AutoRefreshSeconds,
    SE.AwaitingFirstExecution,
    SN.[DependsOnUser], 
    SN.PaginationMode, 
    SN.ProcessingFlags, 
    COMP.ProcessingFlags, 
    
    -- If we are AwaitingFirstExecution, then we haven't executed a 
    -- report and therefore have not been bound to a cached snapshot 
    -- because that binding only happens at report execution time.
    CASE SE.AwaitingFirstExecution WHEN 1 THEN CONVERT(BIT, 0) ELSE SN.IsCached END      
FROM
    [AAPReportServerTempDB].dbo.SessionData AS SE
    INNER JOIN [AAPReportServerTempDB].dbo.SnapshotData AS SN ON SN.SnapshotDataID = SE.SnapshotDataID  
    LEFT OUTER JOIN [AAPReportServerTempDB].dbo.SnapshotData AS COMP ON SE.CompiledDefinition = COMP.SnapshotDataID      
WHERE
   SE.SessionID = @DBSessionID
   
UPDATE [AAPReportServerTempDB].dbo.SnapshotData
SET ExpirationDate = DATEADD(n, @SnapshotTimeoutMinutes, @now)
WHERE SnapshotDataID = @SnapshotDataID

END ELSE BEGIN -- If session doesn't have snapshot

SELECT
    null,
    SE.ShowHideInfo,
    SE.DataSourceInfo,
    null,
    SE.EffectiveParams,
    null,
    SE.IsPermanentSnapshot,
    SE.CreationTime,
    SE.HasInteractivity,
    SE.Timeout,
    SE.SnapshotExpirationDate,
    SE.ReportPath,
    SE.HistoryDate,
    SE.CompiledDefinition,
    null,
    null,
    SE.Expiration,
    null,
    SE.PageHeight,
    SE.PageWidth,
    SE.TopMargin,
    SE.BottomMargin,
    SE.LeftMargin,
    SE.RightMargin,
    SE.AutoRefreshSeconds,
    SE.AwaitingFirstExecution,
    null, 
    null, 
    null, 
    COMP.ProcessingFlags,
    CONVERT(BIT, 0) AS [FoundInCache] -- no snapshot, so it can't be from the cache
FROM
    [AAPReportServerTempDB].dbo.SessionData AS SE
    LEFT OUTER JOIN [AAPReportServerTempDB].dbo.SnapshotData AS COMP ON (SE.CompiledDefinition = COMP.SnapshotDataID)
WHERE
   SE.SessionID = @DBSessionID

END

END

-- We need this update to keep session around while we process it.
UPDATE
   SE 
SET
   Expiration = DATEADD(s, Timeout, GetDate())
FROM
   [AAPReportServerTempDB].dbo.SessionData AS SE
WHERE
   SE.SessionID = @DBSessionID
GO
