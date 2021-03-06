USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [Staging].[APItoPMID_LifeTime_Load]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[APItoPMID_LifeTime_Load]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	INSERT INTO [Staging].[APItoPMID_LifeTime](APIAccountNo, PMID, AAPEffectiveDate, AAPQuitDate, DateOpened, FirstOrderDate, API_PMID_EffectiveDate, API_PMID_QuitDate, AAPAccountNo, LastOrderDate)
	SELECT APIAccountNo, PMID, AAPEffectiveDate, AAPQuitDate, DateOpened, FirstOrderDate, API_PMID_EffectiveDate, API_PMID_QuitDate, AAPAccountNo, LastOrderDate
	FROM [dbo].[v_APItoPMID_LifeTime]

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
