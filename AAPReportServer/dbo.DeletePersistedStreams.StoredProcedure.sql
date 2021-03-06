USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[DeletePersistedStreams]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePersistedStreams]
@SessionID varchar(32)
AS
SET NOCOUNT OFF
delete 
    [AAPReportServerTempDB].dbo.PersistedStream
from 
    (select top 1 * from [AAPReportServerTempDB].dbo.PersistedStream PS2 where PS2.SessionID = @SessionID) as e1
where 
    e1.SessionID = [AAPReportServerTempDB].dbo.PersistedStream.[SessionID] and
    e1.[Index] = [AAPReportServerTempDB].dbo.PersistedStream.[Index]
GO
