USE [MedispanImages]
GO
/****** Object:  StoredProcedure [dbo].[usp_SwitchAll]    Script Date: 12/22/2020 4:40:29 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_SwitchAll]

AS

SET NOCOUNT ON;

BEGIN
BEGIN TRY

	BEGIN TRAN
	
	TRUNCATE TABLE [Archive].[IM2DMFG_M];
	ALTER TABLE [dbo].[IM2DMFG_M]
	SWITCH TO [Archive].[IM2DMFG_M];

	TRUNCATE TABLE [Archive].[IM2IMG_N];
	ALTER TABLE [dbo].[IM2IMG_N]
	SWITCH TO [Archive].[IM2IMG_N];

	TRUNCATE TABLE [Archive].[IM2SUM_A];
	ALTER TABLE [dbo].[IM2SUM_A]
	SWITCH TO [Archive].[IM2SUM_A];

	TRUNCATE TABLE [Archive].[IM2UDIJ_L];
	ALTER TABLE [dbo].[IM2UDIJ_L]
	SWITCH TO [Archive].[IM2UDIJ_L];

	TRUNCATE TABLE [Archive].[IM2UDRUG_K];
	ALTER TABLE [dbo].[IM2UDRUG_K]
	SWITCH TO [Archive].[IM2UDRUG_K];

	TRUNCATE TABLE [Archive].[IM2VAL_D];
	ALTER TABLE [dbo].[IM2VAL_D]
	SWITCH TO [Archive].[IM2VAL_D];

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
GO
