USE [WebTest]
GO
/****** Object:  StoredProcedure [dbo].[spweb_get_Shipping_Invoice_Detail]    Script Date: 12/22/2020 5:26:55 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[spweb_get_Shipping_Invoice_Detail]
(@invoiceNo varchar(15),@invoiceDate varchar(10))
  
AS
SET NOCOUNT ON

 

BEGIN
	SELECT WHAccountid,InvLine,InvNbr,ItemDescription,Qty,InvDate,OrderNbr,NDC from apisalesdetail_web where invnbr = @invoiceNo
	and invdate = @invoiceDate;
END

SET NOCOUNT OFF
GO
