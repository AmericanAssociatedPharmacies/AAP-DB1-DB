USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[sp_useradd]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_useradd]
	
	@login varchar(50),
	@password varchar(50),
	@firstname varchar(50),
	@lastname varchar(50),
	@email nvarchar(100),
	@roleid int,
	@nslogin nvarchar(50),
	@nspwd varchar(50),
	@pmid int,
	@currentuser nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	INSERT INTO userlogin(login,password,firstname,lastname,email,roleid,nslogin,nspwd,defaultpmid,createdon,createdby) VALUES (@login,@password,@firstname,@lastname,@email,@roleid,@nslogin,@nspwd,@pmid,getdate(),@currentuser)
		
	   
END
GO
