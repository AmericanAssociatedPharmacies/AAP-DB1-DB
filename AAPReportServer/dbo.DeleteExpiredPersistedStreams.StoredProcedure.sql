USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[DeleteExpiredPersistedStreams]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteExpiredPersistedStreams]
AS
SET NOCOUNT OFF
SET DEADLOCK_PRIORITY LOW
DELETE
    [AAPReportServerTempDB].dbo.PersistedStream
FROM 
    (SELECT TOP 1 * FROM [AAPReportServerTempDB].dbo.PersistedStream PS2 WHERE PS2.RefCount = 0 AND GETDATE() > PS2.ExpirationDate) AS e1
WHERE 
    e1.SessionID = [AAPReportServerTempDB].dbo.PersistedStream.[SessionID] AND
    e1.[Index] = [AAPReportServerTempDB].dbo.PersistedStream.[Index]
GO
