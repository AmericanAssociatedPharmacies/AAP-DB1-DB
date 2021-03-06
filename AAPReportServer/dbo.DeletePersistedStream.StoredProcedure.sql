USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[DeletePersistedStream]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeletePersistedStream]
@SessionID varchar(32),
@Index int
AS

delete from [AAPReportServerTempDB].dbo.PersistedStream where SessionID = @SessionID and [Index] = @Index
GO
