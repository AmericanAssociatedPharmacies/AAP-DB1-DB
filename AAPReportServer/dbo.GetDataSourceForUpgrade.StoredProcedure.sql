USE [AAPReportServer]
GO
/****** Object:  StoredProcedure [dbo].[GetDataSourceForUpgrade]    Script Date: 12/22/2020 4:16:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetDataSourceForUpgrade]
@CurrentVersion int
AS
SELECT 
    [DSID]
FROM 
    [DataSource]
WHERE
    [Version] != @CurrentVersion
GO
