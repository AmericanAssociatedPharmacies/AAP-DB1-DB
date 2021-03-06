USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_adminlogintest]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		B.Grant
-- Create date: 5/2012
-- Description:	admin website login with search terms 
-- return loginid if a match found; else -2 for compatibility with spweb_logintest
-- =============================================
CREATE PROCEDURE [dbo].[spweb_adminlogintest]
	@user varchar(50),
	@aapno varchar(50),
	@apino varchar(50),
	@ncpdp varchar(50),
	@pmid int

AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @user2 varchar(50)
	DECLARE @aapno2 varchar(50)
	DECLARE @apino2 varchar(50)
	DECLARE @ncpdp2 varchar(50)
	DECLARE @retval int
	DECLARE @test1 int
	DECLARE @test2 int
	select @user2 = (case when @user='' then '-1' else @user end)
	select @aapno2 = (case when @aapno='' then '-1' else @aapno end)
	select @apino2 = (case when @apino='' then '-1' else @apino end)
	select @ncpdp2 = (case when @ncpdp='' then '-1' else @ncpdp end)
	--test user and password
	select top 1 @test1 = loginid from v_web_userdata 
		where login=@user2
			or aapaccountno=@aapno2
			or apiaccountno=@apino2
			or ncpdp=@ncpdp2
			or defaultpmid=isnull(@pmid,-1)
			order by defaultpmid desc

	select @retval = case when @test1 is null then -1 else @test1 end  
	select @retval as retval
	RETURN @retval

END

GO
