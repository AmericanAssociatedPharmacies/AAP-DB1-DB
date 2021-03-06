USE [ODSIntake]
GO
/****** Object:  StoredProcedure [Staging].[usp_ShipmentData_Load]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[usp_ShipmentData_Load]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY


	INSERT INTO ODSIntake.[Staging].[ShipmentInfo](ROW_NUM, COMPANY_NO, PACKAGE_ID, ORDER_ID, ORDER_BO_CODE, COMPANY_ID, TRACKING_NUMBER, SHIP_COST, SHIP_DATE, SHIP_STATUS, SHIP_METHOD)
	SELECT ROW_NUM, COMPANY_NO, PACKAGE_ID, ORDER_ID, ORDER_BO_CODE, COMPANY_ID, TRACKING_NUMBER, SHIP_COST, SHIP_DATE, SHIP_STATUS, SHIP_METHOD
	FROM [Staging].[vwDigitalShipper]
					
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
