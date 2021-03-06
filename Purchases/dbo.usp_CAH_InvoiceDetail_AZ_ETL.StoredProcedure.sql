USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_CAH_InvoiceDetail_AZ_ETL]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[usp_CAH_InvoiceDetail_AZ_ETL]
	
	--@MaxRowversionID VARCHAR(50)
	--, @DateKey INT
	
AS 

BEGIN

	--DECLARE @p1 VARBINARY(8)
	--, @p2 DATETIME

	--SET @p1 = CONVERT(VARBINARY(8), ISNULL(CONVERT(VARBINARY(8), @MAXRowversionID, 1), 0))	

	SELECT CONVERT(INT, ROW_NUMBER() OVER(ORDER BY a.ID ASC)) AS RowID
	, a.ID, DC, CUSTOMER_NAME, CUSTOMER_NO, ITEM_NO, PMID, STORE, NDC, ITEM_TYPE, ITEM_DESCR, GENERIC_NAME, TRADE_NAME, INV_DATE, INVOICE_NO
	, TYPE, ORDER_QTY, SHIP_QTY, UNIT_COST, EXT_COST, CORP_AWP, WAC, VENDOR_NAME, UPC, CONTRACT_FLAG, BRAND, GENERIC_CODE, STRENGTH, SHORT_CODE
	, ENCODING, ContractNo, ContractDesc, MM_DD_YY_LOAD, OrderNo
	, CONVERT(INT, ROW_NUMBER() OVER(PARTITION BY ISNULL([PMID],0), a.DateKey, [INVOICE_NO], NDC ORDER BY [PMID] ASC, a.DateKey ASC, [INVOICE_NO] ASC, NDC ASC)) AS InvoiceLineNumber
	, a.DateKey
	, a.DateKey AS InvoiceDateKey
	, CONVERT(VARBINARY(8),a.RowversionID) AS RowversionID
	, a.ID AS SourceCAHInvoiceDetailID
	FROM Purchases.[dbo].[CHPH_AAP] AS a
	CROSS JOIN(SELECT CONVERT(VARBINARY(8), ISNULL(CONVERT(VARBINARY(8), AZMaxRowversionID, 1), 0)) AS AZMaxRowversionID
				FROM dbo.CAHInvoiceDetailAZ
				) AS cj 
	--INNER JOIN [dbo].[CHPH_AAP_ETL] AS e ON a.ID = e.ID
	--WHERE a.DateKey BETWEEN 20200601 AND 20200630
	WHERE a.RowversionID > cj.AZMaxRowversionID
	--AND e.RowversionID >= @p1
	ORDER BY a.ID ASC



END




GO
