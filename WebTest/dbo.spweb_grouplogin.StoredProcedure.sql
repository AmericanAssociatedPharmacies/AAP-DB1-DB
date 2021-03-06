USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_grouplogin]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE proc [dbo].[spweb_grouplogin](
@login_parent varchar(50)
)
as
select ug.*, ud.ncpdp,ud.description,ul.password
from usergroup ug 
	left join v_web_userdata ud on ug.login_child=ud.login
	left join userlogin ul on ug.login_child=ul.login
where ug.login_parent=@login_parent

grant execute on spweb_grouplogin to webdevuser
GO
