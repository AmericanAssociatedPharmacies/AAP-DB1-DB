USE [ReportServer]
GO
/****** Object:  StoredProcedure [dbo].[WriteNextPortionPersistedStream]    Script Date: 12/22/2020 5:04:08 AM ******/
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

UPDATETEXT [ReportServerTempDB].dbo.PersistedStream.Content @DataPointer @DataIndex @DeleteLength @Content
GO
