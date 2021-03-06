USE [WebDev]
GO
/****** Object:  View [Staging].[vw_UserLogin]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Staging].[vw_UserLogin]

AS


SELECT LTRIM(RTRIM([uname])) AS login
, LTRIM(RTRIM([pwd])) AS password
, LTRIM(RTRIM([uname])) AS nslogin
, LTRIM(RTRIM([pwd])) AS nspwd
, CONVERT(INT, CASE
			WHEN LTRIM(RTRIM([default_pmid])) NOT LIKE '%[0-9]%' THEN NULL
			ELSE  LTRIM(RTRIM([default_pmid]))
			END
			)AS defaultpmid
, CONVERT(BIT, CASE
				WHEN LTRIM(RTRIM([active])) = 'Y' THEN 1 
				ELSE 0
		END) AS Active
, CONVERT(INT, 2) AS Source
FROM ODSIntake.[Staging].[UserLogin]
GO
