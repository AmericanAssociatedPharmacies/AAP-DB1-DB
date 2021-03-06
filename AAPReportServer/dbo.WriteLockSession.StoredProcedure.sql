USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[WriteLockSession]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WriteLockSession]
@SessionID as varchar(32),
@Persisted bit
AS
	SET NOCOUNT OFF ; 
	IF @Persisted = 1
	BEGIN
		UPDATE [AAPReportServerTempDB].dbo.SessionLock WITH (ROWLOCK)
		SET SessionID = SessionID
		WHERE SessionID = @SessionID ;
	END
	ELSE
	BEGIN
		INSERT INTO [AAPReportServerTempDB].dbo.SessionLock WITH (ROWLOCK) (SessionID) VALUES (@SessionID)
	END
GO
