USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[WriteNextPortionPersistedStream]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[WriteNextPortionPersistedStream]
@DataPointer binary(16),
@DataIndex int,
@DeleteLength int,
@Content image
AS

UPDATETEXT [AAPReportServerTempDB].dbo.PersistedStream.Content @DataPointer @DataIndex @DeleteLength @Content
GO
