USE [WebDev]
GO
/****** Object:  View [dbo].[userlogin]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[userlogin]

AS

SELECT loginid, login, password, firstname, lastname, email, roleid, perms, nslogin, nspwd, defaultpmid, createdon, createdby, updatedon, updatedby, active, source, execpassword
FROM [dbo].[userlogin_new]
GO
