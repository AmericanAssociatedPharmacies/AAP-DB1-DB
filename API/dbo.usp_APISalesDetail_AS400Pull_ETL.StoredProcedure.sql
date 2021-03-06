USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APISalesDetail_AS400Pull_ETL]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_APISalesDetail_AS400Pull_ETL]


AS

BEGIN


	DECLARE @MaxDate DATETIME
	, @CurrentDate DATETIME

	SELECT @MaxDate = MAX(InvDate)
	FROM dbo.APISalesDetail

	SET @CurrentDate = DATEADD(DAY, 1, DATEDIFF(DAY, 0, GETDATE()))

	--Get data

	SELECT dt.WHAccountID
	, dt.InvNbr
	, dt.InvLine
	, dt.CustomerName
	, dt.APIItemNbr
	, dt.ItemDescription
	, dt.Qty
	, dt.UnitAmt
	, dt.ItemGrp
	, dt.AcctGrp
	, dt.Territory
	, dt.InvDate
	, dt.LineAmt
	, dt.ExtSales
	, dt.OrderNbr
	, dt.NDC_orig
	, dt.NDC
	, dt.DateLoaded
	, dt.Type
	, dt.WHNbr
	FROM(SELECT CASE
				WHEN LTRIM(RTRIM(WHAccountID)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(32), LTRIM(RTRIM(WHAccountID)))
				END
				AS WHAccountID
			, CASE
				WHEN LTRIM(RTRIM(InvNbr)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(32), LTRIM(RTRIM(InvNbr)))
				END
				AS InvNbr
			, CASE
				WHEN LTRIM(RTRIM(InvLine))  NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(32), LTRIM(RTRIM(InvLine)))
				END
				AS InvLine
			, CASE
				WHEN LTRIM(RTRIM(CustomerName)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(75), LTRIM(RTRIM(CustomerName)) )
				END
				AS CustomerName
			, CASE
				WHEN LTRIM(RTRIM(APIItemNbr)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(50), LTRIM(RTRIM(APIItemNbr)))
				END AS APIItemNbr
			, CASE
				WHEN LTRIM(RTRIM(ItemDescription)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(125), LTRIM(RTRIM(ItemDescription)))
				END
				AS ItemDescription
			, LTRIM(RTRIM(Qty)) AS Qty
			, LTRIM(RTRIM(UnitAmt)) AS UnitAmt
			, CASE
				WHEN LTRIM(RTRIM(ItemGrp)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(5), LTRIM(RTRIM(ItemGrp)))
				END
				AS ItemGrp
			, CASE
				WHEN LTRIM(RTRIM(AcctGrp)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(5), LTRIM(RTRIM(AcctGrp)))
				END
				AS AcctGrp
			, CASE 
				WHEN LTRIM(RTRIM(Territory)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(4), LTRIM(RTRIM(Territory)))
				END 
				AS Territory
			, CASE
				WHEN LTRIM(RTRIM(InvDate)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(DATETIME, InvDate)
				END
				AS InvDate
			, LTRIM(RTRIM(LineAmt)) AS LineAmt
			, LTRIM(RTRIM(ExtSales)) AS ExtSales
			, CASE
				WHEN LTRIM(RTRIM(OrderNbr)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(15), LTRIM(RTRIM(OrderNbr)))
				END
				AS OrderNbr
			, CASE
				WHEN LTRIM(RTRIM(NDC_orig)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(50), LTRIM(RTRIM(NDC_orig)))
				END 
				AS NDC_orig
			, CASE
				WHEN LTRIM(RTRIM(NDC)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(11), LTRIM(RTRIM(NDC)))
				END
				AS NDC
			, DateLoaded
			, CASE
				WHEN LTRIM(RTRIM(Type)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(15), LTRIM(RTRIM(Type)))
				END
				AS Type
			, CASE
				WHEN LTRIM(RTRIM(WHNbr)) NOT LIKE '%[a-zA-Z0-9]%' THEN NULL
				ELSE CONVERT(VARCHAR(2), LTRIM(RTRIM(WHNbr)))
				END 
				AS WHNbr
			FROM [sales].[v_Import_API_WH_Sales]
			WHERE CONVERT(DATETIME, InvDate) > @MaxDate
			AND CONVERT(DATETIME, InvDate) < @CurrentDate
	) AS dt
	

END




GO
