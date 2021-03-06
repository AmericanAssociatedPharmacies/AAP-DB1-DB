USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APISales_DW_ETL]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [dbo].[usp_APISales_DW_ETL]

AS

SET NOCOUNT ON;

BEGIN

	SELECT ISNULL(B.ID, A.ID) AS APISalesInvoiceID
	, ISNULL(A.InvNbr, B.InvNbr) AS InvNbr
	, ISNULL(A.OrderNbr, B.OrderNbr) AS OrderNbr
	, ISNULL(A.InvDate, B.InvDate) AS InvDate
	, ISNULL(A.WHAccountID, B.[WHAccountID]) AS [WHAccountID]
	, ISNULL(A.CustomerName, B.CustomerName) AS CustomerName
	, A.CarrierCode
	, A.CarrierDesc
	, NULLIF(A.CustomerRef,  ' ') AS CustomerRef
	, ISNULL(A.Whsnum, B.WHNbr) AS Whsnum
	, A.OrdType
	, A.DateLoaded
	, B.ID AS APISalesDetailID
	, B.InvLine
	, B.APIItemNbr
	, B.ItemDescription
	, IIF(b.TransTypeCode = 'R', (-1 * B.Qty), B.Qty) AS Qty	
	, B.UnitAmount
	, B.ItemGrp
	, B.AcctGrp
	, B.Territory
	, B.LineAmt
	, IIF(b.TransTypeCode = 'R', (-1 * B.ExtSales), B.ExtSales) AS ExtSales
	, NULLIF(B.NDC_orig,  ' ') AS NDC_orig
	, NULLIF(B.NDC,  ' ') AS NDC
	, B.Type
	, A.[Whsnum] AS WHNbr
	, B.Rebate
	, CAST(CONVERT(VARCHAR(20), B.INVDATE, 112) AS INT) AS DateKey
	, ISNULL(B.APIHoldBackPercent,0.00) AS APIHoldBackPercent
	, ISNULL(B.APIHoldBackAmount,0.00) AS APIHoldBackAmount
	, ISNULL(B.[RebateAfterAPIHoldbackAmount],0.00) AS RebateAfterAPIHoldbackAmount
	, ISNULL(B.[AffiliateHoldbackPercent],0.00) AS AffiliateHoldbackPercent
	, ISNULL(B.[AffiliateHoldbackAmount],0.00) AS AffiliateHoldbackAmount
	, ISNULL(B.[FinalRebateAmount],0.00) AS FinalRebateAmount
	, CONVERT(VARBINARY(8), B.RowversionID) AS RowversionID
	, CAST(CONVERT(VARCHAR(20), DATEADD(DAY, 1, B.INVDATE), 112) AS INT) AS EndDateKey
	, b.TransTypeCode
	, b.TransTypeCodeDesc
	FROM API.dbo.APISalesDetail AS B 
	LEFT OUTER JOIN API.dbo.APISalesInvoice AS A ON A.WHAccountID = B.WHAccountID
											AND A.InvNbr = B.InvNbr
											AND A.InvDate = B.InvDate	
	CROSS JOIN(SELECT CONVERT(VARBINARY(8), ISNULL(CONVERT(VARBINARY(8), RowversionID, 1), 0)) AS MaxRowversionID
				FROM dbo.SalesDDS_APISalesDetail_MaxRowversionID
				) AS cj
	WHERE b.RowversionID > cj.MaxRowversionID

END




GO
