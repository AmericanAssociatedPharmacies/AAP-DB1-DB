USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_KPIDash_AllyScripts_Config]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_KPIDash_AllyScripts_Config]

	@FileDir VARCHAR(1000)

AS

SET NOCOUNT ON;

BEGIN

	SELECT dt.SourcePath
	, dt.DateKey
	FROM(SELECT CONVERT(VARCHAR(1000), FilePath) AS SourcePath
		, cast(CONVERT(varchar(20),DATEADD(dd, 0 , DATEDIFF(dd, 0, FileCreateTime)),112) as INT) AS DateKey
		FROM dbo.mtvf_GetFileInfo(@FileDir)
		WHERE FileName LIKE 'KPIDash_AllyScripts%'
		AND FileName LIKE '%.csv'
	) AS dt

END

GO
