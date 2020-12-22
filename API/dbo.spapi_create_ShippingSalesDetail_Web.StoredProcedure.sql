USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_create_ShippingSalesDetail_Web]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spapi_create_ShippingSalesDetail_Web]
  
AS

SET NOCOUNT ON; 

BEGIN

	DECLARE @days int;
	SET @days = -31;
   
	TRUNCATE TABLE webdev.dbo.APISalesDetail_Web 

	INSERT into webdev.dbo.APISalesDetail_Web  
	SELECT WHAccountid,InvLine,InvNbr,ItemDescription,Qty, InvDate,OrderNbr,NDC 
	FROM  dbo.APISalesDetail 
	WHERE invdate > (select DATEADD(d,@days,getdate()))
 

END



GO
