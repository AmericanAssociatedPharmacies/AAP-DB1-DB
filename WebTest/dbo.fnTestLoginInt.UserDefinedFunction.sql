USE [WebTest]
GO
/****** Object:  UserDefinedFunction [dbo].[fnTestLoginInt]    Script Date: 12/22/2020 5:26:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[fnTestLoginInt]
(
	@user varchar(50),
	@password varchar(50)
)
RETURNS int
AS
BEGIN
	DECLARE @retval int
	DECLARE @test1 int
	DECLARE @test2 int
	select top 1 @test1 = loginid from userlogin 
		where (login=@user or nslogin=@user)
		and (password=@password or nspwd=@password)
		and active=1
	select top 1 @test2 = loginid from userlogin 
		where (login=@user or nslogin=@user)
		and active=1
	select @retval = 
	case 
		when @test1 is not null then 2
		else case when @test2 is not null then 1 else 0 end
		end
	RETURN @retval

END
GO
