USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[CheckSessionLock]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CheckSessionLock]
@SessionID as varchar(32)
AS
DECLARE @Selected nvarchar(32)
SELECT @Selected=SessionID FROM [AAPReportServerTempDB].dbo.SessionLock WITH (ROWLOCK) WHERE SessionID = @SessionID
GO
