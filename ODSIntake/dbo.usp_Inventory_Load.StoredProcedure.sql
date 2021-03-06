USE [ODSIntake]
GO
/****** Object:  StoredProcedure [dbo].[usp_Inventory_Load]    Script Date: 12/22/2020 4:42:35 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_Inventory_Load]

AS

SET NOCOUNT ON

BEGIN
BEGIN TRY

	BEGIN TRAN

	INSERT INTO [dbo].[API_Inventory](LPSROM, LPLZON, LPLCID, LPPRDC, LPBATC, LPFPUT, LPLPUT, LPLOQT, LPPIQT, LPSTTC, LPLIST, LPPIPR, LPPUPR, LPSDAT, LPLOCT, LPRQNC, LPUQNC, LPNCCN, LPSENC, LPORFN
									, LPORFL, LPLCRE, LPQCYN, LPTDCD, LPHLBA, ETLDateKey, ETLDate, ETLTime, RowVersionID
									)
	SELECT LPSROM, LPLZON, LPLCID, LPPRDC, LPBATC, LPFPUT, LPLPUT, LPLOQT, LPPIQT, LPSTTC, LPLIST, LPPIPR, LPPUPR, LPSDAT, LPLOCT, LPRQNC, LPUQNC, LPNCCN, LPSENC, LPORFN
	, LPORFL, LPLCRE, LPQCYN, LPTDCD, LPHLBA, ETLDateKey, ETLDate, ETLTime, RowVersionID
	FROM [dbo].[vwAPIInventory] AS s
	WHERE NOT EXISTS(SELECT 1
						FROM [dbo].[API_Inventory] AS d
						WHERE CONVERT(VARBINARY(8), s.RowVersionID) = d.RowversionID
							)
	ORDER BY ETLDateKey ASC, ETLTime ASC

	DELETE x
	FROM [Staging].[API_Inventory] AS x
	WHERE NOT EXISTS(SELECT 1
						FROM [dbo].[API_Inventory] AS d
						WHERE CONVERT(VARBINARY(8), x.RowVersionID) = d.RowversionID
							)

	COMMIT TRAN

END TRY
BEGIN CATCH

	ROLLBACK TRAN

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
--888325
--665859
GO
