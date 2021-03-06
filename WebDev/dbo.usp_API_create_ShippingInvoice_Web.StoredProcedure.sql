USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[usp_API_create_ShippingInvoice_Web]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE procedure [dbo].[usp_API_create_ShippingInvoice_Web]
  
AS


SET NOCOUNT ON;

 

BEGIN
	
	DECLARE @days int;
	SET @days = -31;
   
	 TRUNCATE TABLE webdev..APISalesInvoice_Web
    
	 INSERT into webdev..APISalesInvoice_Web(WHAccountid, InvNbr, InvDate, OrderNbr, CarrierCode, CarrierDesc, Whsnum, Whsname)	 
	 SELECT dt.WHAccountid
	, dt.InvNbr
	, dt.InvDate
	, dt.OrderNbr
	, dt.CarrierCode
	, dt.CarrierDesc
	, dt.Whsnum
	, dt.Whsname 
	 FROM(SELECT WHAccountid
		 , InvNbr
		 , InvDate
		 , OrderNbr
		 , CarrierCode
		 , CarrierDesc
		 , Whsnum
		  , case when whsnum = 2 then 'Memphis' 
			else 'Scottsboro' 
			end as Whsname 
		from  API.dbo.APISalesInvoice  
		where invdate >= (select DATEADD(d,@days,getdate()))  
		AND InvDate < '20200801'

		UNION ALL

		SELECT DISTINCT WHAccountid
		 , InvNbr
		 , InvDate
		 , OrderNbr
		 , CarrierCode
		 , CarrierDesc
		 , REPLACE(Whsnum, '0', '') AS WhNbr
		  , case when Whsnum = 2 then 'Memphis' 
			else 'Scottsboro' 
			end as Whsname 
		from  API.dbo.APISalesInvoice  
		where invdate >= (select DATEADD(d,@days,getdate()))  
		AND Whsnum IS NOT NULL
		) AS dt



END






GO
