USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_loginValidate_nolog]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		B.Grant
-- Create date: 3/2012
-- Description:	test website login. formerly logintest_nolog
-- return loginid if user,pwd match; -1 if user only matches; -2 if neither
-- this is the same as spweb_loginValidate without logging
-- =============================================
CREATE PROCEDURE [dbo].[spweb_loginValidate_nolog]
	@user varchar(50),
	@password varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @retval int
	DECLARE @test1 int
	DECLARE @test2 int
	--test user and password
	select top 1 @test1 = loginid from userlogin 
		where (login=@user)
		and (password=@password)
		and active=1
	--test user only
	select top 1 @test2 = loginid from userlogin 
		where (login=@user)
		and active=1
	select @retval = 
	case 
		when @test1 is not null then @test1
		else case when @test2 is not null then -1 else -2 end
		--restore the above line when testing is complete
	end
	SELECT @retval as retval
	--logging to login_history omitted here
	RETURN @retval

END
GO
