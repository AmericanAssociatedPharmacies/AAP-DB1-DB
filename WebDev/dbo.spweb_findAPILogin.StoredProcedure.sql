USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_findAPILogin]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[spweb_findAPILogin]
	@login varchar(255),
	@pass varchar(255)
AS
	--return API login and password only. BGrant 6/12

	select u.login, u.password
	from userlogin u 
	where u.login=@login and u.password=@pass
GO
