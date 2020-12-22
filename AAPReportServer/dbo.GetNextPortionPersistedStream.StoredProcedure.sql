USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetNextPortionPersistedStream]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetNextPortionPersistedStream]
@DataPointer binary(16),
@DataIndex int,
@Length int
AS

READTEXT [AAPReportServerTempDB].dbo.PersistedStream.Content @DataPointer @DataIndex @Length
GO
