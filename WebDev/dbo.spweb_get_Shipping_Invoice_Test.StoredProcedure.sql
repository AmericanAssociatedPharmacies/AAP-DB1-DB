USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_get_Shipping_Invoice_Test]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE procedure [dbo].[spweb_get_Shipping_Invoice_Test]

	@whaccount varchar(15)
	,@includeDays int
  
AS

SET NOCOUNT ON 

BEGIN

	DECLARE @days int
	, @InvDate DATETIME

	SET @days = @includeDays * -1;

	SET @InvDate = DATEADD(d,@days,getdate())



	SELECT a.WHAccountid
	, a.InvNbr
	, a.InvDate
	, a.OrderNbr
	, a.CarrierCode
	, a.CarrierDesc
	, a.Whsnum
	, a.Whsname 
	FROM dbo.APISalesInvoice_Web AS a
	CROSS APPLY RXMaster.dbo.tvfAPIAccount(@whaccount) AS ca	
	WHERE a.WHAccountid = ca.APIAccountNo
	AND a.InvDate BETWEEN ca.APIEffectiveDate AND ca.APIQuitDate
	and invdate > @InvDate
	order by invdate desc

END



GO
