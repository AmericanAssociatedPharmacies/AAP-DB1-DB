USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spMCDisplayDocList]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMCDisplayDocList]
AS
BEGIN
	select * from surveydoc
END
GO
