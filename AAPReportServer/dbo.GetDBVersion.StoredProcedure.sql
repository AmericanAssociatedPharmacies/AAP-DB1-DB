USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetDBVersion]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDBVersion]
@DBVersion nvarchar(32) OUTPUT
AS
SET @DBVersion = 'C.0.8.40'
GO
