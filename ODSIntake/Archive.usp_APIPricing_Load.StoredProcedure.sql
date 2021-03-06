USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Archive].[usp_APIPricing_Load]    Script Date: 12/22/2020 4:42:34 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Archive].[usp_APIPricing_Load]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	INSERT INTO [Archive].[APIPricing](ROW, COMPANY_NO, SKU, STATUS, PRODUCT_ONLINE, NAME, CATEGORY_NAME, CATEGORY_ID, TOP_CATEGORY_NAME, TOP_CATEGORY_ID, NDC, UPC, BARCODE, IS_CONTROL, IS_CII_CONTROL, IS_REMS_RESTRICTED, IS_REFRIGERATED, TAX_CLASS_NAME, PRICE, CREATED, UPDATED, MSRP, RELATED_SKUS, UPSELL_SKUS, ALLOCATION, IMAGE_PATH_LG, WEIGHT, DESCRIPTION, BRAND_NAME, REBATE_AMT
										, EffectiveDate
										)
	SELECT ROW, COMPANY_NO, SKU, STATUS, PRODUCT_ONLINE, NAME, CATEGORY_NAME, CATEGORY_ID, TOP_CATEGORY_NAME, TOP_CATEGORY_ID, NDC, UPC, BARCODE, IS_CONTROL, IS_CII_CONTROL, IS_REMS_RESTRICTED, IS_REFRIGERATED, TAX_CLASS_NAME, PRICE, CREATED, UPDATED, MSRP, RELATED_SKUS, UPSELL_SKUS, ALLOCATION, IMAGE_PATH_LG, WEIGHT, DESCRIPTION, BRAND_NAME, REBATE_AMT, EffectiveDate
	FROM Staging.APIPricing

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
