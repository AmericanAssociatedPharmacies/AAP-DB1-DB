USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_CAHInvoiceDetail_HistoryLoad_AZ]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_CAHInvoiceDetail_HistoryLoad_AZ]

	@DateKey INT

AS SET NOCOUNT ON;

BEGIN


	SELECT ID AS [SourceCAHInvoiceDetailID], DateKey, DC, CUSTOMER_NAME, CUSTOMER_NO, ITEM_NO, PMID, STORE, NDC, ITEM_TYPE, ITEM_DESCR, GENERIC_NAME, TRADE_NAME, INV_DATE, INVOICE_NO, TYPE, ORDER_QTY, SHIP_QTY, UNIT_COST, EXT_COST, CORP_AWP, WAC, VENDOR_NAME, UPC, CONTRACT_FLAG, BRAND, GENERIC_CODE, STRENGTH, SHORT_CODE, ENCODING, ContractNo, ContractDesc, MM_DD_YY_LOAD, OrderNo, RowCreatedDate, RowUpdatedDate, CONVERT(VARBINARY(8),RowversionID) AS RowversionID
	, DateKey AS [InvoiceDateKey]
	FROM [dbo].[CHPH_AAP]
	WHERE DateKey = @DateKey


END
GO
