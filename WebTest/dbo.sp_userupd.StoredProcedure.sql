USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[sp_userupd]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_userupd]

	@loginid int,
	@login varchar(50),
	@firstname varchar(50),
	@lastname varchar(50),
	@email nvarchar(100),
	@roleid int,
	@nslogin nvarchar(50),
	@nspwd nvarchar(50),
	@pmid int,
	@currentuser nvarchar(50)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	Update userlogin set 
		[login]= @login,
		email= @email,
		firstname = @firstname,
		lastname = @lastname,
		roleid = @roleid,
		nslogin = @nslogin,
		nspwd = @nspwd,
		defaultpmid = @pmid,
		updatedon = getdate(),
		updatedby = @currentuser
	WHERE loginid=@loginid
   
END
GO
