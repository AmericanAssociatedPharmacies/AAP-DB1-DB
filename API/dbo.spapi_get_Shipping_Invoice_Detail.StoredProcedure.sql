USE [API]
GO
/****** Object:  StoredProcedure [dbo].[spapi_get_Shipping_Invoice_Detail]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spapi_get_Shipping_Invoice_Detail]
(@invoiceNo varchar(15),@invoiceDate varchar(10))
  
AS
SET NOCOUNT ON

 

BEGIN
	SELECT WHAccountid,InvLine,InvNbr,ItemDescription,Qty,UnitAmount,InvDate,LineAmt,ExtSales,OrderNbr,NDC from apisalesdetail where invnbr = @invoiceNo
	and invdate = @invoiceDate;
END

SET NOCOUNT OFF
GO
