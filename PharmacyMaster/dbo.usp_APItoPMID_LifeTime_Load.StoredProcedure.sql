USE [PharmacyMaster]
GO
/****** Object:  StoredProcedure [dbo].[usp_APItoPMID_LifeTime_Load]    Script Date: 12/22/2020 4:45:20 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_APItoPMID_LifeTime_Load]


AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	BEGIN TRAN

		TRUNCATE TABLE [Archive].[APItoPMID_LifeTime];

		ALTER TABLE [dbo].[APItoPMID_LifeTime]
		SWITCH TO [Archive].[APItoPMID_LifeTime];

		ALTER TABLE [Staging].[APItoPMID_LifeTime]
		SWITCH TO [dbo].[APItoPMID_LifeTime];

	COMMIT TRAN



END TRY
BEGIN CATCH

	ROLLBACK TRAN;

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
