USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spMCResetDemo]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spMCResetDemo]
AS
BEGIN
	delete from MessageCenter_Log where userrole in ('demo','admin')
END
GO
