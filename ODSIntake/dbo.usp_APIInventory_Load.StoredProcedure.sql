USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_APIInventory_Load]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_APIInventory_Load]


AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	MERGE [dbo].[APIInventory] AS t
	USING [dbo].[vwAPIInventoryS2K] AS s ON t.ItemNum = s.ItemNum
											AND t.DateKey = s.DateKey

	WHEN MATCHED THEN

	UPDATE SET CompanyNo = s.CompanyNo
	, Warehouse = s.Warehouse
	, QOH = s.QOH

	WHEN NOT MATCHED THEN

	INSERT(DateKey, CompanyNo, ItemNum, Warehouse, QOH)
	VALUES(s.DateKey, s.CompanyNo, s.ItemNum, s.Warehouse, s.QOH);

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
