USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_API_Create_ShippingSalesDetail_Web]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Edited: <Yodi Haile> rename the sproc name to usp (Not delete the old spapi_create_ShippingSalesDetail_Web)
-- Date: <03/28/2019>
-- =============================================

CREATE procedure [dbo].[usp_API_Create_ShippingSalesDetail_Web]
  
AS
SET NOCOUNT ON

 

BEGIN
	DECLARE @days int;
	SET @days = -31;
   
	TRUNCATE TABLE webdev.dbo.APISalesDetail_web

	INSERT into webdev.dbo.APISalesDetail_web
	 SELECT WHAccountid,InvLine,InvNbr,ItemDescription,Qty, InvDate,OrderNbr,NDC 
	 from  dbo.APISalesDetail
		where invdate > (select DATEADD(d,@days,getdate()))
 

END


GO
