USE [Reports]
GO
/****** Object:  StoredProcedure [dbo].[usp_APISalesUnaudited_Monthly_Load]    Script Date: 12/22/2020 5:00:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [dbo].[usp_APISalesUnaudited_Monthly_Load]


AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	MERGE dbo.APISalesUnaudited_Monthly AS t
	USING Staging.APISalesUnaudited_Monthly AS s 
			ON t.PMID = s.PMID
			AND t.APIAccountNo = s.APIAccountNo
			AND t.Date = s.Date

	WHEN MATCHED THEN

		UPDATE
		SET t.GenericSales = ISNULL(s.GenericSales, 0.00)
		, t.BrandSales = ISNULL(s.BrandSales, 0.00)
		, t.OTCSales = ISNULL(s.OTCSales, 0.00)
		, t.GenericSalesTier1 = ISNULL(s.GenericSalesTier1, 0.00)
		, t.GenericSalesTier2 = ISNULL(s.GenericSalesTier2, 0.00)

	WHEN NOT MATCHED THEN

	INSERT(PMID, Date, APIAccountNo, GenericSales, BrandSales, OTCSales, GenericSalesTier1, GenericSalesTier2)
	VALUES(s.PMID, s.Date, s.APIAccountNo, ISNULL(s.GenericSales, 0.00), ISNULL(s.BrandSales, 0.00), ISNULL(s.OTCSales, 0.00), ISNULL(s.GenericSalesTier1, 0.00), ISNULL(s.GenericSalesTier2, 0.00))
	;

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
        )

		INSERT INTO PharmacyMaster.dbo.ErrorLog(ErrorNumber, ErrorLine, ErrorState, ErrorSeverity, ErrorProcedure, ErrorMessage)
		VALUES(@ErrorNumber, @ErrorLine, @ErrorState, @ErrorSeverity, @ErrorProcedure, @ErrorMessage)



END CATCH

END




GO
