USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[SurveyGetLoginInfo]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		John Ngo
-- Create date: 8/29/2014
-- Description:	SurveyGetPharmacyInfo
-- =============================================
CREATE PROCEDURE [dbo].[SurveyGetLoginInfo]
	-- Add the parameters for the stored procedure here
	@LoginId INT = 0, 
	@Login NVARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	--SELECT TOP 1 '' roles, * FROM dbo.userlogin WHERE loginid = @LoginId OR [login] = @Login
	SELECT TOP 1 l.loginid,l.login,l.email,l.firstname,l.lastname,l.active,l.roleid, r.rolename 
			FROM dbo.userlogin l LEFT JOIN dbo.userrole r 
				ON l.roleid = r.roleid 
			WHERE 
					 l.loginid = (CASE WHEN @LoginId > 0 THEN @LoginId ELSE 0 END)
					OR l.login = (CASE WHEN LEN(@Login) > 1 THEN @Login ELSE NULL END)

/*
select * from userlogin where login like '%dev3%'

GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[SurveyGetLoginInfo]
		@LoginId = 1895761,
		@Login = N'itdev3'

SELECT	'Return Value' = @return_value

GO
*/
END


-- SELECT l.loginid,l.login,l.email,l.firstname,l.lastname,l.active,l.roleid, r.rolename      FROM dbo.userlogin l INNER JOIN dbo.userrole r ON l.roleid = r.roleid AND loginid = 1
-- SELECT l.loginid,l.login,l.email,l.firstname,l.lastname,l.active,l.roleid, r.rolename      FROM dbo.userlogin l INNER JOIN dbo.userrole r ON l.roleid = r.roleid AND loginid = @LoginId
GO
