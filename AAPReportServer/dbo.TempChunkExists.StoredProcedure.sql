USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[TempChunkExists]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[TempChunkExists]
	@ChunkId uniqueidentifier
AS
BEGIN
	SELECT COUNT(1) FROM [AAPReportServerTempDB].dbo.SegmentedChunk
	WHERE ChunkId = @ChunkId
END
GO
