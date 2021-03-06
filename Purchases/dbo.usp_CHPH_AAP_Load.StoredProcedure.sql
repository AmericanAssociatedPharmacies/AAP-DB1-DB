USE [Purchases]
GO
/****** Object:  StoredProcedure [dbo].[usp_CHPH_AAP_Load]    Script Date: 12/22/2020 4:55:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO











CREATE PROCEDURE [dbo].[usp_CHPH_AAP_Load]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	DELETE x
	FROM [dbo].[CHPH_AAP] AS x
	WHERE EXISTS(SELECT 1
					FROM Staging.CHPH_AAP AS s
					WHERE x.DateKey = s.DateKey	
					)
	
	INSERT INTO [dbo].[CHPH_AAP](DateKey,DC, CUSTOMER_NAME, CUSTOMER_NO, ITEM_NO, PMID, STORE, NDC, ITEM_TYPE, ITEM_DESCR, GENERIC_NAME, TRADE_NAME, INV_DATE, INVOICE_NO, TYPE, ORDER_QTY
								, SHIP_QTY, UNIT_COST, EXT_COST, CORP_AWP, WAC, VENDOR_NAME, UPC, CONTRACT_FLAG, BRAND, GENERIC_CODE, STRENGTH, SHORT_CODE, ENCODING, ContractNo, ContractDesc
								, MM_DD_YY_LOAD, OrderNo, [DEA], [InvoiceLineNmbr])
	OUTPUT INSERTED.ID,INSERTED.DateKey
	INTO [dbo].[CHPH_AAP_ETL](ID,DateKey)
	SELECT DateKey, DC, CUSTOMER_NAME, CUSTOMER_NO, ITEM_NO, PMID, STORE, NDC, ITEM_TYPE, ITEM_DESCR, GENERIC_NAME, TRADE_NAME, INV_DATE, INVOICE_NO, TYPE, ORDER_QTY, SHIP_QTY, UNIT_COST
	, EXT_COST, CORP_AWP, WAC, VENDOR_NAME, UPC, CONTRACT_FLAG, BRAND, GENERIC_CODE, STRENGTH, SHORT_CODE, ENCODING, ContractNo, ContractDesc, MM_DD_YY_LOAD, OrderNo, [DEA], [InvoiceLineNmbr]
	FROM [Staging].[CHPH_AAP] AS S
	ORDER BY DateKey ASC, PMID ASC,INVOICE_NO ASC, [InvoiceLineNmbr] ASC



END TRY
BEGIN CATCH

	DECLARE @ErrorMessage NVARCHAR(4000)
        , @ErrorNumber INT
        , @ErrorSeverity INT
        , @ErrorState INT
        , @ErrorLine INT
        , @ErrorProcedure NVARCHAR(200)

		SELECT 
        @ErrorNumber = ERROR_NUMBER()
        , @ErrorSeverity = ERROR_SEVERITY()
        , @ErrorState = ERROR_STATE()
        , @ErrorLine = ERROR_LINE()
        , @ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-')
		, @ErrorMessage = ERROR_MESSAGE();

		RAISERROR 
        (@ErrorMessage 
        , @ErrorSeverity, 1               
        , @ErrorNumber    -- parameter: original error number.
        , @ErrorSeverity  -- parameter: original error severity.
        , @ErrorState     -- parameter: original error state.
        , @ErrorProcedure -- parameter: original error procedure name.
        , @ErrorLine       -- parameter: original error line number.
        );
	

END CATCH


END










GO
