USE [WebDev]
GO
/****** Object:  StoredProcedure [Staging].[usp_userlogin_Load]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[usp_userlogin_Load]

AS

SET NOCOUNT ON;

BEGIN

	INSERT INTO [Staging].[userlogin](login, password, nslogin, nspwd, defaultpmid, Active, Source)
	SELECT login, password, nslogin, nspwd, ISNULL(defaultpmid, dt.PMID) AS defaultpmid, Active, Source
	FROM Staging.vw_UserLogin AS s
	LEFT OUTER JOIN(SELECT DISTINCT apinumber
					, pmid
					FROM RXMaster.dbo.PharmacyDim
					WHERE APINumber IS NOT NULL
					AND pmid IS NOT NULL
					AND AAPQuitDate IS NULL
					) AS dt ON s.login = dt.apinumber

END
GO
