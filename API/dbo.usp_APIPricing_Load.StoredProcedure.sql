USE [API]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIPricing_Load]    Script Date: 12/22/2020 4:19:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[usp_APIPricing_Load]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	INSERT INTO [dbo].[APIPricing](APIItemNum, NDC, DrugName, IsControl, IsC2Control, CustomerInvoicePrice, Created, BrandName, RebateAmt, EffectiveDate, IsTier1, IsTier2)
	SELECT APIItemNum, NDC, DrugName, IsControl, IsC2Control, CustomerInvoicePrice, Created, BrandName, RebateAmt, EffectiveDate, IsTier1, IsTier2
	FROM [Staging].[APIPricing] AS s
	WHERE NOT EXISTS(SELECT 1
						FROM dbo.APIPricing AS t
						WHERE s.NDC = t.NDC
						AND s.EffectiveDate = t.EffectiveDate
						)


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
