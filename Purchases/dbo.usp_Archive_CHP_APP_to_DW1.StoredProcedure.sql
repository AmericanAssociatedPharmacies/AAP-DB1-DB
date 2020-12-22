USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_Archive_CHP_APP_to_DW1]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Archive_CHP_APP_to_DW1]

	@InvDate DATETIME

AS

SET NOCOUNT ON;

BEGIN


	SELECT ID, DC, CUSTOMER_NAME, CUSTOMER_NO, ITEM_NO, PMID, STORE, NDC, ITEM_TYPE, ITEM_DESCR, GENERIC_NAME, TRADE_NAME
	, INV_DATE, INVOICE_NO, [TYPE], ORDER_QTY, SHIP_QTY, UNIT_COST, EXT_COST, CORP_AWP, WAC, VENDOR_NAME
	, UPC, CONTRACT_FLAG, BRAND, GENERIC_CODE, STRENGTH, SHORT_CODE, ENCODING, ContractNo
	, ContractDesc, MM_DD_YY_LOAD, OrderNo
	, CAST(CONVERT(varchar(20), [INV_DATE], 112) as INT) AS DateKey 
	FROM [dbo].[CHPH_AAP]
	WHERE INV_DATE = @InvDate

END
GO
