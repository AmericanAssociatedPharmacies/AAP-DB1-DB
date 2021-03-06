USE [webdocs]
GO
/****** Object:  View [dbo].[dmActivityKeys]    Script Date: 12/22/2020 9:42:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[dmActivityKeys]
	AS
	SELECT  dbo.dmActivity.*, CONVERT(CHAR(20), ActivityDateTime, 120) + ActivityKey AS ActivityDateKey
	FROM dbo.dmActivity
GO
