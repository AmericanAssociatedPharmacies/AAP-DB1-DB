USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_APICatalog]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_APICatalog]

AS

SET NOCOUNT ON

BEGIN

	SELECT NDC, APIItemNum, isTierI, isTierII, GroupID
	FROM dbo.vwAPICatalog
	WHERE NDC IS NOT NULL
	ORDER BY NDC ASC


END
GO
