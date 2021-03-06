USE [WebDev]
GO
/****** Object:  StoredProcedure [dbo].[spweb_get_Shipping_Invoice]    Script Date: 12/22/2020 5:21:26 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[spweb_get_Shipping_Invoice]
(@whaccount varchar(15),@includeDays int)
  
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

	--DECLARE @days int;
	--SET @days = @includeDays * -1;
	--SELECT WHAccountid,InvNbr,InvDate,OrderNbr,CarrierCode,CarrierDesc,Whsnum,
 --        Whsname from  APISalesInvoice_Web where WHAccountid =  @whaccount
	--	and invdate > (select DATEADD(d,@days,getdate())) order by invdate desc
END


GO
