USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Staging].[usp_UserLogin_Load]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[usp_UserLogin_Load]

AS

SET NOCOUNT ON;


BEGIN

	INSERT INTO [Staging].[UserLogin](uname, name, pwd, active, api_id, default_pmid)
	select ANCIDE as uname,
	ANNAME as name,
	ANWPWD as pwd,
	ANPWEN as active,
	NANUM as api_id,
	NANCA1 as default_pmid
	from [10.96.0.3].[APIASW].AX1492BFRX.ANOWEBCL as cl
	join [10.96.0.3].[APIASW].AX1492BFRX.SRONAM as s
	on cl.ANCIDE = s.NANUM

END
GO
