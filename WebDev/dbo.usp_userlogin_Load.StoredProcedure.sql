USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_userlogin_Load]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_userlogin_Load]

AS

SET NOCOUNT ON;

BEGIN

	--Set Active status
	UPDATE x
	SET [active] = s.active
	FROM [dbo].[userlogin_new] AS x
	INNER JOIN [Staging].[userlogin] AS s ON x.login = s.login
	
	
	--Insert any new rows
	INSERT INTO [dbo].[userlogin_new](login, password, nslogin, nspwd, defaultpmid, Active, Source)
	SELECT dt.login, dt.password, dt.nslogin, dt.nspwd, dt.defaultpmid, dt.Active, dt.Source
	FROM(SELECT ROW_NUMBER() OVER(PARTITION BY login, password, nslogin, nspwd, defaultpmid, Active, Source ORDER BY(SELECT NULL)) AS RN
			, login, password, nslogin, nspwd, defaultpmid, Active, Source
			FROM [Staging].[userlogin] AS s
			) AS dt
	WHERE dt.RN = 1
	AND NOT EXISTS(SELECT 1
						FROM dbo.userlogin AS u
						WHERE dt.[login] = u.[login]
						)
	ORDER BY dt.login ASC
	


END
GO
