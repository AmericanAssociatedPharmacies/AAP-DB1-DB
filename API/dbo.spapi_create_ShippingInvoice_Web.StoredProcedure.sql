USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_create_ShippingInvoice_Web]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spapi_create_ShippingInvoice_Web]
  
AS
SET NOCOUNT ON

 

BEGIN
	DECLARE @days int;
	SET @days = -31;
   
	 TRUNCATE TABLE webdev..APISalesInvoice_Web 
    
	 INSERT into webdev..APISalesInvoice_Web 
 
	 SELECT WHAccountid,InvNbr,InvDate,OrderNbr,CarrierCode,CarrierDesc,Whsnum ,
case when whsnum = 2 then 'Memphis' else 'Scottsboro' end as Whsname from  APISalesInvoice  
		where invdate >= (select DATEADD(d,@days,getdate()))  


END


GO
