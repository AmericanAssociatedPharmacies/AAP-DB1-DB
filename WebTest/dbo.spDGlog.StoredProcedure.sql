USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spDGlog]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spDGlog]
AS
BEGIN
	select * from DataGuardian_log order by dt desc
END
GO
