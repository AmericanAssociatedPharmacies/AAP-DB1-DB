USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Archive].[usp_UserLogin_Load]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Archive].[usp_UserLogin_Load]

AS

SET NOCOUNT ON;


BEGIN

	INSERT INTO [Archive].[UserLogin](uname, name, pwd, active, api_id, default_pmid)
	SELECT uname, name, pwd, active, api_id, default_pmid
	FROM [Staging].[UserLogin]

END
GO
