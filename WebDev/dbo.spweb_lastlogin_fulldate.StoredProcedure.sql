USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_lastlogin_fulldate]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spweb_lastlogin_fulldate]
(
@username varchar(50)
)
as
begin
declare @lastdate datetime
select @lastdate = dt FROM (SELECT row_number() OVER (ORDER BY dt desc) r, dt FROM login_history where username=@username) q
WHERE r = 2 
select case 
	when @lastdate is null then dateadd(week,-2,getdate())
	else case 
		when datediff(day,@lastdate,getdate()) < 2 then dateadd(week,-2,getdate())
		else @lastdate end
	end as lastdate
end
GO
