USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_get_Shipping_Invoice]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spapi_get_Shipping_Invoice]
(@whaccount varchar(15),@includeDays int)
  
AS
SET NOCOUNT ON 

BEGIN

	DECLARE @days int;
	SET @days = @includeDays * -1;
	SELECT WHAccountid,InvNbr,InvDate,CarrierCode,CarrierDesc,Whsnum from  APISalesInvoice where WHAccountid =  @whaccount
		and invdate > (select DATEADD(d,@days,getdate()))
END

SET NOCOUNT OFF
GO
