USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_admin_addAPItemp]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE proc [dbo].[spweb_admin_addAPItemp]
(
@nslogin varchar(50),
@nspwd varchar(50)
)
as
if not exists (select top 1 * from userlogin where nslogin=@nslogin and nspwd=@nspwd)
begin
insert into userlogin (login,password,nslogin,nspwd,roleid,defaultpmid,active,source)
values(@nslogin,@nspwd,@nslogin,@nspwd,9,-1,1,2)
end

--delete from userlogin where login='testaccount'

--spweb_admin_addAPItemp 'testaccount','testpwd'
--select * from userlogin where login = 'testaccount'
GO
