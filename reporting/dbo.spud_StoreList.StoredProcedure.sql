USE [reporting]
GO
/****** Object:  StoredProcedure [dbo].[spud_StoreList]    Script Date: 12/22/2020 4:58:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spud_StoreList]
	
AS
BEGIN
	
	SET NOCOUNT ON;
	Select NABP,Store from v_stores    
	
END
GO
