USE [AAPReportServerTempDB]
GO
/****** Object:  StoredProcedure [dbo].[GetDBVersion]    Script Date: 12/22/2020 4:18:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDBVersion]
@DBVersion nvarchar(32) OUTPUT
AS
set @DBVersion = 'T.0.8.40'
GO
