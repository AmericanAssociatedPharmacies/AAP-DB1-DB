USE [WebDev]
GO
/****** Object:  View [dbo].[v_web_userdata_FromSource]    Script Date: 12/22/2020 9:41:50 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[v_web_userdata_FromSource]
as
select distinct
u.loginid, u.login, 
--u.password,
u.roleid,
r.rolename,
u.defaultpmid,
u.nslogin, u.nspwd,
u.active,
u.perms,
--u.source,
p.*,
dbo.fnWebUserDescription(accountname,city,state,isElite) as description

from userlogin u
left join pharmacymaster..v_web_pm_userdata p on u.defaultpmid=p.pmid	
left join userrole r on r.roleid=u.roleid
GO
