USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Archive].[usp_APISalesDetail_Load]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [Archive].[usp_APISalesDetail_Load]

AS

SET NOCOUNT ON;


BEGIN

	INSERT INTO [Archive].[APISalesDetail](InvNbr, InvLine, CustNbr, Cust, Item, NDC, Qty, ItemAmt, ItemGrp, AcctGrp, Slsman, InvDate, LineAmt, ExtSales, SalesOrd, DISREBATE,
										   IDTYPP, IDNSVA, REBATE, IDPAGR, [DiscountPercentage], [ItemNo], CarrierCode, WharehouseNum, CarrierDesc
										   , [CustomerRef], [OrderType])
	SELECT InvNbr, InvLine, CustNbr, Cust, Item, NDC, Qty, ItemAmt, ItemGrp, AcctGrp, Slsman, InvDate, LineAmt, ExtSales, SalesOrd, DISREBATE, IDTYPP, IDNSVA, REBATE, IDPAGR
	, [DiscountPercentage], [ItemNo], CarrierCode, WharehouseNum, CarrierDesc, [CustomerRef], [OrderType]
	FROM [Staging].[APISalesDetail]

END



GO
