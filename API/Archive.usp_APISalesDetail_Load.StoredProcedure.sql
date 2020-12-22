USE [API]
GO
/****** Object:  StoredProcedure [Archive].[usp_APISalesDetail_Load]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Archive].[usp_APISalesDetail_Load]

AS

SET NOCOUNT ON;

BEGIN


	ALTER TABLE [dbo].[APISalesDetail]
	ADD RowversionID ROWVERSION NOT NULL

	--DECLARE @p1 DATETIME


	--DECLARE C1 CURSOR FOR
	--SELECT DISTINCT InvDate
	--FROM dbo.APISalesDetail
	--WHERE InvDate < '20180101'
	--ORDER BY InvDate DESC

	--OPEN C1


	--FETCH NEXT
	--FROM C1
	--INTO @p1

	--WHILE @@FETCH_STATUS = 0
	--BEGIN

	--	INSERT INTO [Archive].[APISalesDetail](ID, WHAccountID, InvNbr, InvLine, CustomerName, APIItemNbr, ItemDescription, Qty, UnitAmount, ItemGrp, AcctGrp, Territory, InvDate, LineAmt, ExtSales, OrderNbr, NDC_orig, NDC, DateLoaded, Type, WHNbr, Rebate, APIHoldbackPercent, APIHoldbackAmount, RebateAfterAPIHoldbackAmount, AffiliateHoldbackPercent, AffiliateHoldbackAmount, FinalRebateAmount, DiscountPercentage, ConferenceCreditPercentage, ConferenceCreditAmount, RowVersionID)
	--	SELECT ID, WHAccountID, InvNbr, InvLine, CustomerName, APIItemNbr, ItemDescription, Qty, UnitAmount, ItemGrp, AcctGrp, Territory, InvDate, LineAmt, ExtSales, OrderNbr, NDC_orig, NDC, DateLoaded, Type, WHNbr, Rebate, APIHoldbackPercent, APIHoldbackAmount, RebateAfterAPIHoldbackAmount, AffiliateHoldbackPercent, AffiliateHoldbackAmount
	--	, FinalRebateAmount, DiscountPercentage, ConferenceCreditPercentage, ConferenceCreditAmount, CONVERT(VARBINARY(8),0) AS RowVersionID
	--	FROM dbo.APISalesDetail
	--	WHERE InvDate = @p1

	--	DELETE x
	--	FROM [dbo].[APISalesDetail] AS x
	--	WHERE InvDate = @p1

	--	FETCH NEXT
	--	FROM C1
	--	INTO @p1

	--END

	--CLOSE C1
	--DEALLOCATE C1

END



GO
