USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_AdminFunctions]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_AdminFunctions]
@Functiontype varchar(50),
@Login varchar(100)
as
--return adminfunctions the user is authorized for in adminfunctionusers, or all if user roleid=7
declare @rolename varchar(50)
select @rolename=r.rolename from userlogin u left join userrole r on r.roleid=u.roleid where u.login=@Login
if @rolename = 'admin - upload all files'
begin
select f.* from Adminfunctions f where f.functiontype = @FunctionType
order by f.FunctionName
end
else
begin
select f.*
from AdminFunctions f left join AdminFunctionUsers u
	on u.functionid = f.id
where u.Login = @Login
and f.functiontype = @FunctionType
order by f.FunctionName
end
GO
